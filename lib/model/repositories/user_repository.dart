import 'package:dio/dio.dart';
import '../../constants/export_constants.dart';
import '../response/user/login_response.dart';
import 'basic_repository.dart';

class UserRepository extends BasicRepository {
  static const String customerPrefix = "customer/";

  UserRepository(String apiBaseUrl) : super(apiBaseUrl, customerPrefix);

  Future<LoginResponse> getTestObject(String randomParam, String accessToken) async {
    final response = await provider.get(
      url: "home-components?customerId=$randomParam",
      headers: {
        "Authorization": accessToken
      },
    );
    return LoginResponse.fromJson(response);
  }
}