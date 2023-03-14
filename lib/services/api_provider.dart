import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app/exceptions.dart';

//xai ke duoc nay xem template post get nay kia co gi implement ben file API trong services
class APIProvider {
  late final Dio dio;

  APIProvider(String apiBaseUrl) {
    dio = Dio();
    dio.options.baseUrl = apiBaseUrl;
  }

  Future<dynamic> post({required String url, Map<String, dynamic>? headers, Map<String, dynamic>? data, CancelToken? cancelToken}) async {
    try {
      final response = await dio.post(url, options: Options(headers: headers), data: data, cancelToken: cancelToken);
      var responseJson = json.decode(response.toString());
      switch(responseJson['responseCode']) {
        case 200:
          return responseJson;
        case 201:
          return responseJson;
        case 401:
          throw UnauthorizedException(responseJson['message'].toString());
        case 419:
          throw AccessTokenExpiredException(responseJson['message'].toString());
        case 500:
          throw FailedException(responseJson['message'].toString());
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

  Future<dynamic> get({required String url, Map<String, dynamic>? headers, CancelToken? cancelToken}) async {
    try {
      //Sua do de goi API test
      final response = await dio.get(url, options: Options(headers: headers), cancelToken: cancelToken);
      switch(response.statusCode) {
        case 200:
          return response.data;
        case 201:
          throw NoHaveDataException(response.data['message'].toString());
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
          throw FailedException("Không thể kết nối tới máy chủ");
        default:
          throw FailedException("Failed");
      }
    }
  }

  Future<dynamic> postFormData({required String url, Map<String, dynamic>? headers, required FormData data, CancelToken? cancelToken}) async {
    try {
      final response = await dio.post(url, options: Options(headers: headers, contentType: Headers.formUrlEncodedContentType), data: data, cancelToken: cancelToken);
      var responseJson = json.decode(response.toString());
      switch(responseJson['responseCode']) {
        case 200:
          return responseJson;
        case 201:
          throw NoHaveDataException(responseJson['message'].toString());
        case 401:
          throw UnauthorizedException(responseJson['message'].toString());
        case 419:
          throw AccessTokenExpiredException(responseJson['message'].toString());
        case 500:
          throw FailedException(responseJson['message'].toString());
      }
    } on DioError catch(err) {
      switch(err.type) {
        case DioErrorType.cancel:
          throw FailedException("Không thể kết nối tới máy chủ");
        default:
          throw FailedException("Failed");
      }
    }
  }
}

