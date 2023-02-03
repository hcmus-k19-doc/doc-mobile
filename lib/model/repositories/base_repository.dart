import 'package:dio/dio.dart';

import '../../bloc/api_provider.dart';

class BaseRepository {
  late CancelToken cancelToken;
  late APIProvider provider;

  BaseRepository(String apiBaseUrl, String prefix) {
    provider = APIProvider("$apiBaseUrl$prefix");
    cancelToken = CancelToken();
  }

}