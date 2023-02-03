import 'package:json_annotation/json_annotation.dart';

part 'base_api_response.g.dart';

@JsonSerializable()
class BaseAPIResponse {
  @JsonKey(required: true)
  final int statusCode;

  @JsonKey(required: true)
  final String message;

  BaseAPIResponse({required this.statusCode, required this.message});

  factory BaseAPIResponse.fromJson(Map<String, dynamic> json) => _$BaseAPIResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseAPIResponseToJson(this);
}
