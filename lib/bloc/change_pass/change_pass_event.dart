part of 'change_pass_bloc.dart';

class ChangePassEvent extends Equatable {
  final String newPassword, oldPassword;
  const ChangePassEvent(this.newPassword, this.oldPassword);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
