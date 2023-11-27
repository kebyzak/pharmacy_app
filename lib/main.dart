import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/blocs/news_bloc/news_bloc.dart';
import 'package:pharmacy_app/blocs/profile_bloc/profile_bloc.dart';
import 'package:pharmacy_app/blocs/qr_bloc/qr_bloc.dart';
import 'package:pharmacy_app/blocs/user_bloc/user_bloc.dart';
import 'package:pharmacy_app/pages/authentication/login_page.dart';
import 'package:pharmacy_app/firebase_options.dart';
import 'package:pharmacy_app/pages/screens/profile_page.dart';
import 'package:pharmacy_app/services/news_service.dart';
import 'package:pharmacy_app/services/profile_repository.dart';
import 'package:dio/dio.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(profileRepository: ProfileRepository()),
        ),
        BlocProvider<QrBloc>(
          create: (context) => QrBloc(),
        ),
        BlocProvider(
          create: (context) =>
              ProfileBloc(profileRepository: ProfileRepository())
                ..add(const ProfileEvent.loadProfile()),
          child: const ProfilePage(),
        ),
        BlocProvider<NewsBloc>(
          create: (context) => NewsBloc(newsService: NewsService(Dio())),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pharmacy App',
        home: AnimatedSplashScreen(
          splash: Image.asset('assets/splash.png'),
          nextScreen: const LoginPage(),
          backgroundColor: Colors.redAccent,
          splashTransition: SplashTransition.slideTransition,
        ),
      ),
    );
  }
}
