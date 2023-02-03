import 'package:json_annotation/json_annotation.dart';
import '../base_api_response.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends BaseAPIResponse {
  LoginData data;

  LoginResponse({required int statusCode, required String message, required this.data}): super(statusCode: statusCode, message: message);

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

}

@JsonSerializable()
class LoginData {
  final String accessToken;
  final String customerId;
  final String fullName;
  final String firstName;
  final String lastName;
  final String deviceId;
  final String profileImageUrl;
  final String loginProviderType;
  final String email;

  LoginData({required this.accessToken, required this.customerId, required this.email, required this.fullName, required this.firstName, required this.lastName, required this.profileImageUrl, required this.deviceId, required this.loginProviderType});

  factory LoginData.fromJson(Map<String, dynamic> json) => _$LoginDataFromJson(json);

}