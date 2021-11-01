import 'package:flutter/material.dart';
import 'package:litmath/screens/elementary_screen.dart';
import 'package:litmath/screens/first_screen.dart';
import 'package:litmath/screens/kinder_screen.dart';
import 'package:litmath/screens/middle_screen.dart';
import 'package:litmath/screens/new_login_screen.dart';
import 'package:litmath/screens/new_signup_screen.dart';
import 'package:litmath/screens/second_screen.dart';
import 'package:litmath/screens/login_screen.dart';
import 'package:litmath/screens/selection_screen.dart';
import 'package:litmath/screens/settings_screen.dart';
import 'package:litmath/screens/signup_screen.dart';
import 'package:litmath/screens/slide_show_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.red[400],
          secondary: Colors.blue[600],
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SelectionScreen(),
      routes: {
        FirstScreen.routeName: (ctx) => const FirstScreen(),
        SecondScreen.routeName: (ctx) => const SecondScreen(),
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        SignUpScreen.routeName: (ctx) => const SignUpScreen(),
        SlideShowScreen.routeName: (ctx) => const SlideShowScreen(),
        NewLoginScreen.routeName: (ctx) => const NewLoginScreen(),
        NewSignUpScreen.routeName: (ctx) => const NewSignUpScreen(),
        SelectionScreen.routeName: (ctx) => const SelectionScreen(),
        KinderScreen.routeName: (ctx) => const KinderScreen(),
        ElementaryScreen.routeName: (ctx) => const ElementaryScreen(),
        MiddleScreen.routeName: (ctx) => const MiddleScreen(),
        SettingsScreen.routeName: (ctx) => const SettingsScreen()
      },
    );
  }
}
