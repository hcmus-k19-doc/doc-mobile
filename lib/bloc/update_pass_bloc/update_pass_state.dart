part of 'update_pass_bloc.dart';

abstract class UpdatePassState extends Equatable {
  const UpdatePassState();
  @override
  List<Object> get props => [];
}

class UpdatePassInitial extends UpdatePassState {}

class UpdatePassLoading extends UpdatePassState {}

class UpdatePassSuccess extends UpdatePassState {}

class UpdatePassError extends UpdatePassState {}
