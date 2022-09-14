part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileInitialEvent extends ProfileEvent {}

class ProfileLoad extends ProfileEvent {
  final Profile profile;

  const ProfileLoad({required this.profile});
  @override
  List<Object> get props => [profile];
}

class ProfileErrorLoad extends ProfileEvent {}
