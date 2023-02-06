import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/bloc/api_provider.dart';
import 'package:flutter_app/exceptions.dart';
import 'package:flutter_app/model/repositories/base_repository.dart';
import 'package:flutter_app/model/response/base_api_response.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (state is LoginInitial || state is LoginFailure) {
        emit(LoginLoading());
        APIProvider apiProvider = APIProvider(event.url);
        try {
          var data = await apiProvider.get(url: "/products");
          print(data);
          emit(LoginSuccess());
          emit(LoginInitial());
        } catch (err) {
          emit(LoginFailure(err as APIException));
        }
      }
    });
  }
}
