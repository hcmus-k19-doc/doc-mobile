import 'package:dio/dio.dart';

import '../../bloc/api_provider.dart';

class BasicRepository {
  late CancelToken cancelToken;
  late APIProvider provider;

  BasicRepository(String apiBaseUrl, String prefix) {
    provider = APIProvider("$apiBaseUrl$prefix");
    cancelToken = CancelToken();
  }

}