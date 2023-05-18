part of 'change_pass_bloc.dart';

abstract class ChangePassState extends Equatable {
  const ChangePassState();

  @override
  List<Object> get props => [];
}

class ChangePassInitial extends ChangePassState {}

class ChangePassLoading extends ChangePassState {}

class ChangePassSuccess extends ChangePassState {}

class ChangePassFailure extends ChangePassState {
  final String errorMessage;

  const ChangePassFailure(this.errorMessage);
}
