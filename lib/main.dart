import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:importan_skripsi/firebase_options.dart';
import 'package:importan_skripsi/home/main_page.dart';
import 'package:importan_skripsi/pages/signin_page.dart';
import 'package:importan_skripsi/pages/signup_page.dart';
import 'package:importan_skripsi/pages/splash_page.dart';
import 'package:importan_skripsi/widgets/edit_profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/sign-in': (context) => const SignInPages(),
        '/home': (context) => const MainPage(),
        '/sign-up': (context) => const SignUpPage(),
        '/edit-profile': (context) => const EditProfilePage(),
      },
    );
  }
}
