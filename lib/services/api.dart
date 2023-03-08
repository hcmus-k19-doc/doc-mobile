import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app/exceptions.dart';
import 'package:flutter_app/utils/secured_local_storage.dart';

class Api {
  late final Dio api;
  String? accessToken;
  final SecuredLocalStorage _storage = SecuredLocalStorage();

  Api(String baseUrl) {
    api = Dio();
    api.options.baseUrl = baseUrl;

    api.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {

      accessToken = await _storage.readString(KEY_CONST.ACCESS_TOKEN_KEY);


      if (accessToken == null)
        {
          return handler.next(options);
        }

      options.headers['Authorization'] = 'Bearer $accessToken';
      return handler.next(options);
    }, onError: (DioError error, handler) async {
      //if invalid token
      if (error.response?.statusCode == 401 || error.response?.statusCode == 419) {
        String? refreshToken =
            await _storage.readString(KEY_CONST.REFRESH_TOKEN_KEY);

        if (refreshToken != null) {
          if (await refreshTokenApi(refreshToken)) {
            //success get new access token retry a request
            return handler.resolve(await _retry(error.requestOptions));
          }
        }
      }
      return handler.next(error);
    }));
  }


  Future<dynamic> post({required String url, Map<String, dynamic>? headers,String? contentType, Map<String, dynamic>? data, CancelToken? cancelToken}) async {
    try {
      final response = await api.post(url, options: Options(headers: headers, contentType: contentType), data: data, cancelToken: cancelToken);
      switch(response.statusCode) {
        case 200:
          return response.data;
        case 201:
          return response.data;
        case 401:
          throw UnauthorizedException(response.data['message'].toString());
        case 419:
          throw AccessTokenExpiredException(response.data['message'].toString());
        case 500:
          throw FailedException(response.data['message'].toString());
      }
    } on DioError catch(err) {
      switch(err.type) {
        case DioErrorType.cancel:
          throw FailedException("Request is cancelled");
        default:
          throw FailedException("Failed");
      }
    }
  }



  Future<bool> refreshTokenApi(String refreshToken) async {
    final reponse =
        await api.post("/auth/refresh", data: {'refreshToken': refreshToken});
    if (reponse.statusCode == 201) {
      //get new access token
      accessToken = reponse.data;
      await _storage.saveString(KEY_CONST.ACCESS_TOKEN_KEY, accessToken!);
      return true;
    } else {
      //invalid refresh token
      accessToken = null;
      _storage.deleteAll();
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
}
