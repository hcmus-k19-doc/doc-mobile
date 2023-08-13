part of 'forgot_pass_bloc.dart';

abstract class ForgotPassState extends Equatable {
  const ForgotPassState();
  @override
  List<Object> get props => [];
}

class ForgotPassInitial extends ForgotPassState {}

class ForgotPassLoading extends ForgotPassState {}

class ForgotPassSuccess extends ForgotPassState {}

class ForgotPassError extends ForgotPassState {}
