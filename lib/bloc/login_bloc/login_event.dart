part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  final String userName;
  final String password;
  const LoginEvent(this.userName, this.password);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
