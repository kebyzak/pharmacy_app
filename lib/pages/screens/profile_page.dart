import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/blocs/profile_bloc/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileBloc>().add(const ProfileEvent.loadProfile());

    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(
              child: Text('Initial state'),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: () => const Center(
              child: Text('Error fetching profile data.'),
            ),
            success: (profile) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 48.0,
                      backgroundColor: Colors.redAccent,
                      child:
                          Icon(Icons.person, size: 48.0, color: Colors.white),
                    ),
                    const SizedBox(height: 16.0),
                    _buildProfileInfo('Name', profile.name),
                    _buildProfileInfo('Email', profile.email),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

Widget _buildProfileInfo(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$label: ',
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            )),
        Text(value, style: const TextStyle(fontSize: 18.0)),
      ],
    ),
  );
}
