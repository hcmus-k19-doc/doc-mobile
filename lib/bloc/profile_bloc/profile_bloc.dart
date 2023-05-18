import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/model/profile.dart';
import 'package:flutter_app/repositories/user_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  UserRepository userRepository;
  ProfileBloc(this.userRepository) : super(ProfileInitial()) {
    on<FetchCurrentProfile>((event, emit) async {
      emit(ProfileLoading());
      try {
        Profile currentProfile = await userRepository.getCurrentProfile();
        emit(ProfileSuccess(currentProfile));
      } catch (error) {
        emit(ProfileError(error.toString()));
      }
    });
  }
}
