part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class FetchCurrentProfile extends ProfileEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
