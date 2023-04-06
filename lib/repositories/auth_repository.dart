import 'package:dio/dio.dart';
import 'package:flutter_app/model/token.dart';
import 'package:flutter_app/repositories/base_repository.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthRepository extends BaseRepository {
  AuthRepository(super.baseUrl);

  Future<Token?> login(String username, String password) async {
    try {
      var response = await provider
          .post(url: "", contentType: Headers.formUrlEncodedContentType, data: {
        "username": username,
        "password": password,
      });
      return Token(
          accessToken: response["access_token"]!,
          refreshToken: response["refresh_token"]!);
    } catch (err) {
      rethrow;
    }
  }

  Future<Token?> checkAuthentication(
      String? accessTokenFromStorage, String? refreshTokenFromStorage) async {
    try {
      if (accessTokenFromStorage != null &&
          !JwtDecoder.isExpired(accessTokenFromStorage)) {
        return Token(
            accessToken: accessTokenFromStorage,
            refreshToken: refreshTokenFromStorage);
      } else {
        if (refreshTokenFromStorage != null) {
          final response = await provider.post(
              url: "/refresh",
              contentType: Headers.formUrlEncodedContentType,
              data: {'refreshToken': refreshTokenFromStorage});
          return Token(
              accessToken: response["access_token"],
              refreshToken: response["refresh_token"]);
        } else {
          return null;
        }
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> logout(String refreshToken) async {
    try {
      await provider.post(
          url: "/revoke",
          contentType: Headers.formUrlEncodedContentType,
          data: {"refreshToken": refreshToken});
    } catch (error) {
      rethrow;
    }
  }
}
