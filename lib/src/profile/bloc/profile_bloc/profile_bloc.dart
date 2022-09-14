import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:social_media_app/src/models/profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileLoading()) {
    on<ProfileInitialEvent>(_onProfileInitialEvent);
    on<ProfileLoad>(_onProfileLoad);
    on<ProfileErrorLoad>(_onProfileErrorLoad);
  }

  void _onProfileInitialEvent(
    ProfileInitialEvent event,
    Emitter<ProfileState> emit,
  ) {
    emit(ProfileLoading());
  }

  void _onProfileLoad(ProfileLoad event, Emitter<ProfileState> emit) {
    if (event.profile.id.isNotEmpty) {
      return emit(ProfileLoaded(profile: event.profile));
    }
    return emit(ProfileLoaded(profile: event.profile));
  }

  void _onProfileErrorLoad(ProfileErrorLoad event, Emitter<ProfileState> emit) {
    emit(ProfileErrorLoaded());
  }
}
