part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class CheckTokenEvent extends AuthEvent {
  final String? accessTokenStorage;
  final String? refreshTokenStorage;

  const CheckTokenEvent(this.accessTokenStorage, this.refreshTokenStorage);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
