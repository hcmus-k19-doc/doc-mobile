import 'package:dio/dio.dart';
import 'package:flutter_app/repositories/base_repository.dart';
import 'package:flutter_app/utils/secured_local_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthRepository extends BaseRepository {
  AuthRepository(super.baseUrl);
  String? accessToken;
  String? refreshToken;

  Future<void> login(String username, String password) async {
    try {
      var data = await provider
          .post(url: "", contentType: Headers.formUrlEncodedContentType, data: {
        "username": username,
        "password": password,
      });

      SecuredLocalStorage _storage = SecuredLocalStorage();
      await _storage.saveString(
          KEY_CONST.ACCESS_TOKEN_KEY, data["access_token"]!);
      await _storage.saveString(
          KEY_CONST.REFRESH_TOKEN_KEY, data["refresh_token"]!);
      accessToken = data["access_token"]!;
      refreshToken = data["refresh_token"]!;
    } catch (err) {
      rethrow;
    }
  }

  Future<void> checkAuthentication(
      String? accessTokenFromStorage, String? refreshTokenFromStorage) async {
    try {
      if (accessTokenFromStorage != null &&
          !JwtDecoder.isExpired(accessTokenFromStorage)) {
        accessToken = accessTokenFromStorage;
        refreshToken = refreshTokenFromStorage;
      } else {
        SecuredLocalStorage _storage = SecuredLocalStorage();

        if (refreshTokenFromStorage != null) {
          final response = await provider.post(
              url: "/refresh",
              contentType: Headers.formUrlEncodedContentType,
              data: {'refreshToken': refreshTokenFromStorage});

          accessToken = response["access_token"];
          refreshToken = response["refresh_token"];
        }
      }
    } catch (error) {
      rethrow;
    }
  }
}
