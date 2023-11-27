part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.fetchProfile() = _FetchProfileEvent;
  const factory ProfileEvent.loadProfile() = _LoadProfileEvent;
}
