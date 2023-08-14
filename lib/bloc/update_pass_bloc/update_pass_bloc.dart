import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/repositories/auth_repository.dart';

part 'update_pass_event.dart';
part 'update_pass_state.dart';

class UpdatePassBloc extends Bloc<UpdatePassEvent, UpdatePassState> {
  AuthRepository authRepository;
  UpdatePassBloc(this.authRepository) : super(UpdatePassInitial()) {
    on<UpdatePassEvent>((event, emit) async {
      emit(UpdatePassLoading());
      try {
        await authRepository.updatePassword(event.username, event.oldPassword,
            event.confirmPassword, event.newPassword);
        emit(UpdatePassSuccess());
      } catch (error) {
        print(error);
        emit(UpdatePassError());
      }
    });
  }
}
