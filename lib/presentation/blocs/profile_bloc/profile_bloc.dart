import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/data/services/profile_repository.dart';
import 'package:pharmacy_app/domain/models/profile.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc({required this.profileRepository})
      : super(const ProfileState.initial()) {
    on<_FetchProfileEvent>((event, emit) async {
      emit(const ProfileState.loading());
      try {
        final profile = await profileRepository.getProfile();
        await profileRepository.saveProfileToPrefs(profile);
        emit(ProfileState.success(profile: profile));
      } catch (e) {
        emit(const ProfileState.error());
      }
    });

    on<_LoadProfileEvent>((event, emit) async {
      emit(const ProfileState.loading());
      try {
        final profile = await profileRepository.getProfileFromPrefs();
        emit(ProfileState.success(profile: profile));
      } catch (e) {
        emit(const ProfileState.error());
      }
    });
  }
}
