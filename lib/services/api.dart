import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/constants/api_const.dart';
import 'package:flutter_app/exceptions.dart';
import 'package:flutter_app/utils/secured_local_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class Api {
  Dio api = Dio();
  String? accessToken;
  final SecuredLocalStorage _storage = SecuredLocalStorage();

  Api(String baseUrl) {
    api.options.baseUrl = baseUrl;

    api.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      accessToken = await _storage.readString(KEY_CONST.ACCESS_TOKEN_KEY);

      if (accessToken == null || JwtDecoder.isExpired(accessToken!)) {
        return handler.next(options);
      }

      options.headers['Authorization'] = 'Bearer $accessToken';
      return handler.next(options);
    }, onError: (DioError error, handler) async {
      //only run if access Token expired or invalid.
      if (error.response?.statusCode == 401) {
        String? refreshToken =
            await _storage.readString(KEY_CONST.REFRESH_TOKEN_KEY);

        if (refreshToken != null) {
          if (await refreshTokenApi(refreshToken)) {
            //success get new access token retry a request
            return handler.resolve(await _retry(error.requestOptions));
          } else {
            await _performLogout();
            return handler.reject(error);
          }
        }
      }
      return handler.next(error);
    }));
  }

  Future<dynamic> post(
      {required String url,
      Map<String, dynamic>? headers,
      String? contentType,
      Map<String, dynamic>? data,
      Map<String, dynamic>? queryParams,
      CancelToken? cancelToken}) async {
    try {
      final response = await api.post(url,
          options: Options(headers: headers, contentType: contentType),
          data: data,
          queryParameters: queryParams,
          cancelToken: cancelToken);

      switch (response.statusCode) {
        case 200:
          return response.data;
        case 201:
          return response.data;
        case 401:
          throw UnauthorizedException(response.data['message'].toString());
        case 419:
          throw AccessTokenExpiredException(
              response.data['message'].toString());
        case 500:
          throw FailedException(response.data['message'].toString());
      }
    } on DioError catch (err) {
      switch (err.type) {
        case DioErrorType.cancel:
          throw FailedException("Request is cancelled");
        default:
          throw FailedException(err.response?.data["message"]);
      }
    }
  }

  Future<dynamic> get(
      {required String url,
      Map<String, dynamic>? headers,
      String? contentType,
      CancelToken? cancelToken}) async {
    try {
      final response = await api.get(url,
          options: Options(headers: headers, contentType: contentType),
          cancelToken: cancelToken);
      switch (response.statusCode) {
        case 200:
          return response.data;
        case 201:
          throw NoHaveDataException(response.data['message'].toString());
        case 401:
          throw UnauthorizedException(response.data['message'].toString());
        case 419:
          throw AccessTokenExpiredException(
              response.data['message'].toString());
        case 500:
          throw FailedException(response.data['message'].toString());
      }
    } on DioError catch (err) {
      switch (err.type) {
        case DioErrorType.cancel:
          throw FailedException("Request is cancelled");
        default:
          throw FailedException(err.response?.data["message"]);
      }
    }
  }

  Future<bool> refreshTokenApi(String refreshToken) async {
    try {
      final reponse = await Dio()
          .post("${UrlConst.DOC_SERVICE_URL}/security/auth/refresh-token",
              options: Options(
                contentType: Headers.formUrlEncodedContentType,
              ),
              data: {'refreshToken': refreshToken});
      if (reponse.statusCode == 200) {
        //get new access token
        accessToken = reponse.data["access_token"];
        await _storage.saveString(KEY_CONST.ACCESS_TOKEN_KEY, accessToken!);
        return true;
      } else {
        //invalid refresh token
        accessToken = null;
        _storage.deleteAll();
        return false;
      }
    } catch (err) {
      return false;
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return api.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  Future<void> _performLogout() async {
    // await _storage.deleteAll();
    //navigate to login page
  }
}
