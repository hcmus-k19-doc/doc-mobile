import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/model/token.dart';
import 'package:flutter_app/repositories/auth_repository.dart';
import 'package:flutter_app/utils/secured_local_storage.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository repository;
  Token? token;

  AuthBloc(this.repository) : super(UnAuthenticated()) {
    on<CheckTokenEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        SecuredLocalStorage _storage = SecuredLocalStorage();

        token = await repository.checkAuthentication(
            event.accessTokenStorage, event.refreshTokenStorage);
        if (token != null) {
          await _storage.saveString(
              KEY_CONST.ACCESS_TOKEN_KEY, token!.accessToken!);
          await _storage.saveString(
              KEY_CONST.REFRESH_TOKEN_KEY, token!.refreshToken!);
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
      if (state is UnAuthenticated || state is AuthError) {
        emit(AuthLoading());
        try {
          token = await repository.login(event.username, event.password);
          SecuredLocalStorage _storage = SecuredLocalStorage();
          await _storage.saveString(
              KEY_CONST.ACCESS_TOKEN_KEY, token!.accessToken!);
          await _storage.saveString(
              KEY_CONST.REFRESH_TOKEN_KEY, token!.refreshToken!);
          emit(Authenticated());
        } catch (err) {
          emit(AuthError());
        }
      }
    });
    on<LogoutEvent>((event, emit) async {
      await SecuredLocalStorage().deleteAll();
      emit(UnAuthenticated());
      try {
        String tempRefreshToken = token!.refreshToken!;
        token = null;
        await repository.logout(tempRefreshToken);
      } catch (error) {
        print(error);
      }
    });
  }
}
