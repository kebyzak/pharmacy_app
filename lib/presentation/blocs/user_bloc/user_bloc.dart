import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/data/services/profile_repository.dart';
import 'package:pharmacy_app/domain/models/profile.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final ProfileRepository profileRepository;

  UserBloc({required this.profileRepository})
      : super(const UserState.initial()) {
    on<_SignInEvent>((event, emit) async {
      emit(const UserState.loading());
      try {
        await auth.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(const UserState.success());
        Profile profile = await profileRepository.getProfile();
        profileRepository.saveProfileToPrefs(profile);
      } catch (e) {
        emit(const UserState.error());
      }
    });

    on<_SignUpEvent>((event, emit) async {
      emit(const UserState.loading());
      try {
        final userCredential = await auth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        final User user = userCredential.user!;
        await user.updateDisplayName(event.name);
        await user.reload();
        final User updatedUser = auth.currentUser!;
        final FirebaseFirestore firestore = FirebaseFirestore.instance;
        final userData = {
          'email': updatedUser.email,
          'uid': updatedUser.uid,
          'name': updatedUser.displayName,
        };

        await firestore.collection('users').doc(updatedUser.uid).set(userData);
        emit(const UserState.success());
        // Fetch and save the profile data to SharedPreferences
        Profile profile = await profileRepository.getProfile();
        profileRepository.saveProfileToPrefs(profile);
      } catch (e) {
        emit(const UserState.error());
      }
    });
  }
}
