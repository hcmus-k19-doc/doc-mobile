import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/model/profile.dart';
import 'package:flutter_app/model/token.dart';
import 'package:flutter_app/repositories/auth_repository.dart';
import 'package:flutter_app/repositories/user_repository.dart';
import 'package:flutter_app/utils/secured_local_storage.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository;
  UserRepository userRepository;

  Token? token;
  Profile? profile;

  AuthBloc(this.authRepository, this.userRepository)
      : super(UnAuthenticated()) {
    on<CheckTokenEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        SecuredLocalStorage _storage = SecuredLocalStorage();

        token = await authRepository.checkAuthentication(
            event.accessTokenStorage, event.refreshTokenStorage);
        if (token != null) {
          await _storage.saveString(
              KEY_CONST.ACCESS_TOKEN_KEY, token!.accessToken!);
          await _storage.saveString(
              KEY_CONST.REFRESH_TOKEN_KEY, token!.refreshToken!);
          profile = await userRepository.getCurrentProfile();
          emit(Authenticated());
        } else {
          await _storage.deleteAll();
          emit(UnAuthenticated());
        }
      } catch (error) {
        await SecuredLocalStorage().deleteAll();
        emit(UnAuthenticated());
      }
    });
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        token = await authRepository.login(event.username, event.password);
        SecuredLocalStorage _storage = SecuredLocalStorage();
        await _storage.saveString(
            KEY_CONST.ACCESS_TOKEN_KEY, token!.accessToken!);
        await _storage.saveString(
            KEY_CONST.REFRESH_TOKEN_KEY, token!.refreshToken!);
        profile = await userRepository.getCurrentProfile();
        emit(Authenticated());
      } catch (err) {
        emit(AuthError());
      }
    });
    on<LogoutEvent>((event, emit) async {
      await SecuredLocalStorage().deleteAll();
      emit(UnAuthenticated());
      try {
        String tempRefreshToken = token!.refreshToken!;
        token = null;
        profile = null;
        await authRepository.logout(tempRefreshToken);
      } catch (error) {
        print(error);
      }
    });
  }
}
