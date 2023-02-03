// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['statusCode', 'message'],
  );
  return LoginResponse(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
    data: LoginData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
      accessToken: json['accessToken'] as String,
      customerId: json['customerId'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
      deviceId: json['deviceId'] as String,
      loginProviderType: json['loginProviderType'] as String,
    );

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'customerId': instance.customerId,
      'fullName': instance.fullName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'deviceId': instance.deviceId,
      'profileImageUrl': instance.profileImageUrl,
      'loginProviderType': instance.loginProviderType,
      'email': instance.email,
    };
