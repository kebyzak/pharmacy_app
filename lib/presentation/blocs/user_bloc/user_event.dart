part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.signIn({
    required String email,
    required String password,
  }) = _SignInEvent;

  const factory UserEvent.signUp({
    required String email,
    required String password,
    required String name,
  }) = _SignUpEvent;
}
