part of 'forgot_pass_bloc.dart';

class ForgotPassEvent extends Equatable {
  final String email;
  const ForgotPassEvent(this.email);

  @override
  // TODO: implement props
  List<Object?> get props => [email];
}
