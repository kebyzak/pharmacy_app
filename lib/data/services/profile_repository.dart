import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmacy_app/domain/models/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Profile> getProfile() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final DocumentSnapshot<Map<String, dynamic>> userDoc =
            await _firestore.collection('users').doc(user.uid).get();

        final String name = userDoc.get('name');
        final String email = userDoc.get('email');
        final String uid = userDoc.get('uid');

        return Profile(uid: uid, name: name, email: email);
      } else {
        throw Exception('User not authenticated');
      }
    } catch (e) {
      throw Exception('Error fetching profile data: $e');
    }
  }

  Future<void> saveProfileToPrefs(Profile profile) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('profile_name', profile.name);
    prefs.setString('profile_email', profile.email);
    prefs.setString('profile_uid', profile.uid);
  }

  Future<Profile> getProfileFromPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String name = prefs.getString('profile_name') ?? '';
    final String email = prefs.getString('profile_email') ?? '';
    final String uid = prefs.getString('profile_uid') ?? '';

    return Profile(name: name, email: email, uid: uid);
  }
}
