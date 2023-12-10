import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/data/services/profile_repository.dart';
import 'package:pharmacy_app/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:pharmacy_app/presentation/pages/screens/authentication/register_page.dart';
import 'package:pharmacy_app/presentation/pages/widgets/bottom_navbar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/login.png',
                height: 300.0,
                width: 300.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: LoginForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final UserBloc userBloc = UserBloc(profileRepository: ProfileRepository());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          success: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    const AnimatedBottomNavBarPage(initialIndex: 0),
              ),
            );
          },
        );
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintText: 'Enter Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintText: 'Enter Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              height: 48.0,
              child: ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  context.read<UserBloc>().add(
                        UserEvent.signIn(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.redAccent,
                ),
                child: const Text('Login'),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.redAccent,
              ),
              child: const Text("Don't have an account? Create one"),
            ),
            state.maybeWhen(
              orElse: () => const SizedBox(),
              loading: () => const SizedBox(
                width: 100,
                height: 100,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                  ),
                ),
              ),
              error: () => Container(
                color: Colors.red,
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'Email or password is incorrect',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
