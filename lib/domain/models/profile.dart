// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';

@freezed
abstract class Profile with _$Profile {
  factory Profile({
    required String uid,
    required String name,
    required String email,
  }) = _Profile;
}
