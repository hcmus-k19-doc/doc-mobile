import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/repositories/user_repository.dart';

part 'change_pass_event.dart';

part 'change_pass_state.dart';

class ChangePassBloc extends Bloc<ChangePassEvent, ChangePassState> {
  UserRepository userRepository;

  ChangePassBloc(this.userRepository) : super(ChangePassInitial()) {
    on<ChangePassEvent>((event, emit) async {
      if (state is! ChangePassLoading) {
        emit(ChangePassLoading());
        try {
          await userRepository.changePasswordCurrentUser(
              event.newPassword, event.oldPassword);
          emit(ChangePassSuccess());
        } catch (error) {
          emit(ChangePassFailure(error.toString().contains("password.incorrect")
              ? "Wrong password"
              : error.toString()));
        }
      }
    });
  }
}
