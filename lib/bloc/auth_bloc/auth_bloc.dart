import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/constants/url_const.dart';
import 'package:flutter_app/repositories/auth_repository.dart';
import 'package:flutter_app/services/api.dart';
import 'package:flutter_app/utils/secured_local_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository repository;

  AuthBloc(this.repository) : super(UnAuthenticated()) {
    on<CheckTokenEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        SecuredLocalStorage _storage = SecuredLocalStorage();

        await repository.checkAuthentication(
            event.accessTokenStorage, event.refreshTokenStorage);
        if (repository.accessToken != null && repository.refreshToken != null) {
          await _storage.saveString(
              KEY_CONST.ACCESS_TOKEN_KEY, repository.accessToken!);
          await _storage.saveString(
              KEY_CONST.REFRESH_TOKEN_KEY, repository.refreshToken!);
          emit(Authenticated());
        } else {
          await _storage.deleteAll();
          emit(UnAuthenticated());
        }
      } catch (error) {
        await SecuredLocalStorage().deleteAll();
        emit(AuthError());
      }
    });
    on<LoginEvent>((event, emit) async {
      if (state is UnAuthenticated || state is AuthError) {
        emit(AuthLoading());
        try {
          await repository.login(event.username, event.password);
          if (repository.accessToken != null &&
              repository.refreshToken != null) {
            SecuredLocalStorage _storage = SecuredLocalStorage();
            await _storage.saveString(
                KEY_CONST.ACCESS_TOKEN_KEY, repository.accessToken!);
            await _storage.saveString(
                KEY_CONST.REFRESH_TOKEN_KEY, repository.refreshToken!);
            emit(Authenticated());
          } else {
            emit(AuthError());
          }
        } catch (err) {
          emit(AuthError());
        }
      }
    });
  }
}
