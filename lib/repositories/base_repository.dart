import 'package:dio/dio.dart';
import 'package:flutter_app/services/api.dart';

abstract class BaseRepository {
  late CancelToken cancelToken;
  late Api provider;
  BaseRepository(String baseUrl) {
    provider = Api(baseUrl);
    cancelToken = CancelToken();
  }
}
