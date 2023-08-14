part of 'update_pass_bloc.dart';

class UpdatePassEvent extends Equatable {
  final String username;
  final String oldPassword;
  final String confirmPassword;
  final String newPassword;
  const UpdatePassEvent(
      this.username, this.oldPassword, this.confirmPassword, this.newPassword);

  @override
  // TODO: implement props
  List<Object?> get props =>
      [username, oldPassword, newPassword, confirmPassword];
}
