import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/repositories/auth_repository.dart';

part 'forgot_pass_event.dart';
part 'forgot_pass_state.dart';

class ForgotPassBloc extends Bloc<ForgotPassEvent, ForgotPassState> {
  AuthRepository authRepository;

  ForgotPassBloc(this.authRepository) : super(ForgotPassInitial()) {
    on<ForgotPassEvent>((event, emit) async {
      emit(ForgotPassLoading());
      try {
        await authRepository.forgotPassword(event.email);
        emit(ForgotPassSuccess());
      } catch (error) {
        emit(ForgotPassError());
      }
    });
  }
}
