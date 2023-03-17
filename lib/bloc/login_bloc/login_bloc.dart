import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/services/api_provider.dart';
import 'package:flutter_app/constants/url_const.dart';
import 'package:flutter_app/exceptions.dart';
import 'package:flutter_app/services/api.dart';
import 'package:flutter_app/utils/secured_local_storage.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (state is LoginInitial || state is LoginFailure) {
        emit(LoginLoading());
        Api api = Api(UrlConst.DOC_SERVICE_URL);
        try {
          var data = await api.post(
              url: "/security/auth/token",
              contentType: Headers.formUrlEncodedContentType,
              data: {
                "username": event.userName,
                "password": event.password,
              });

          SecuredLocalStorage _storage = SecuredLocalStorage();
          await _storage.saveString(
              KEY_CONST.ACCESS_TOKEN_KEY, data["access_token"]!);
          await _storage.saveString(
              KEY_CONST.REFRESH_TOKEN_KEY, data["refresh_token"]!);

          emit(LoginSuccess());
          emit(LoginInitial());
        } catch (err) {
          emit(LoginFailure(err as APIException));
        }
      }
    });
  }
}
