import 'package:dio/dio.dart';
import 'package:flutter_app/utils/secured_local_storage.dart';

class Api {
  final api = Dio();
  String? accessToken;
  final SecuredLocalStorage _storage = SecuredLocalStorage();

  Api() {
    api.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      options.headers['Authorization'] = 'Bearer $accessToken';
      return handler.next(options);
    }, onError: (DioError error, handler) async {
      //if invalid token
      if (error.response?.statusCode == 401) {

        String? refreshToken = await _storage.readString(
            KEY_CONST.REFRESH_TOKEN_KEY);

        if (refreshToken != null) {
          if (await refreshTokenApi(refreshToken))
            {
              //success get new access token retry a request
              return handler.resolve(await _retry(error.requestOptions));
            }
        }
      }
      return handler.next(error);
    }
    ));
  }

  Future<bool> refreshTokenApi(String refreshToken) async {
    final reponse = await api.post(
        "/auth/refresh", data: {'refreshToken': refreshToken});
    if (reponse.statusCode == 201)
      {
        //get new access token
        accessToken = reponse.data;
        return true;
      }
    else
      {
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
