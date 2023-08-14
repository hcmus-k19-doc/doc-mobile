import 'package:dio/dio.dart';
import 'package:flutter_app/model/token.dart';
import 'package:flutter_app/repositories/base_repository.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthRepository extends BaseRepository {
  AuthRepository(super.baseUrl);

  Future<Token?> login(
      String username, String password, String firebaseToken) async {
    try {
      var response = await provider.post(
          url: "/token",
          contentType: Headers.formUrlEncodedContentType,
          data: {
            "username": username,
            "password": password,
            'firebaseCloudMessagingToken': firebaseToken
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
              url: "/token/refresh",
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

  Future<void> logout(String refreshToken, String firebaseToken) async {
    try {
      await provider.post(
          url: "/token/revoke",
          contentType: Headers.formUrlEncodedContentType,
          data: {
            "refreshToken": refreshToken,
            "firebaseCloudMessagingToken": firebaseToken
          });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      await provider.post(
          url: "/forgot-password",
          contentType: Headers.formUrlEncodedContentType,
          data: {"email": email});
    } catch (error) {
      rethrow;
    }
  }

  Future<void> updatePassword(String username, String oldPassword,
      String confirmPassword, String newPassword) async {
    try {
      await provider.put(
          url: "/change-password",
          contentType: Headers.formUrlEncodedContentType,
          data: {
            "username": username,
            "oldPassword": oldPassword,
            "confirmPassword": confirmPassword,
            "newPassword": newPassword
          });
    } catch (error) {
      rethrow;
    }
  }
}
