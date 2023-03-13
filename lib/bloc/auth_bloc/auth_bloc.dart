import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/constants/url_const.dart';
import 'package:flutter_app/services/api.dart';
import 'package:flutter_app/utils/secured_local_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  String? accessToken;
  String? refreshToken;

  AuthBloc() : super(UnAuthenticated()) {
    on<CheckTokenEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        if (event.accessTokenStorage != null &&
            !JwtDecoder.isExpired(event.accessTokenStorage!)) {
          accessToken = event.accessTokenStorage;
          refreshToken = event.refreshTokenStorage;
          emit(Authenticated());
        } else {
          Api api = Api(UrlConst.DOC_SERVICE_URL);
          SecuredLocalStorage _storage = SecuredLocalStorage();

          if (event.refreshTokenStorage != null) {
            final response = await api.post(
                url: "/security/auth/token/refresh",
                contentType: Headers.formUrlEncodedContentType,
                data: {'refreshToken': event.refreshTokenStorage});

            await _storage.saveString(
                KEY_CONST.ACCESS_TOKEN_KEY, response["access_token"]!);
            await _storage.saveString(
                KEY_CONST.REFRESH_TOKEN_KEY, response["refresh_token"]!);

            accessToken = response["access_token"];
            refreshToken = response["refresh_token"];
            emit(Authenticated());
          } else {
            await _storage.deleteAll();
            emit(UnAuthenticated());
          }
        }
      } catch (error) {
        await SecuredLocalStorage().deleteAll();
        emit(AuthError());
      }
    });
  }
}
