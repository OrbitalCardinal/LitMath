import 'package:flutter/material.dart';
import 'package:litmath/screens/first_screen.dart';
import 'package:litmath/screens/second_screen.dart';
import 'package:litmath/screens/login_screen.dart';
import 'package:litmath/screens/register_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
      routes: {
        FirstScreen.routeName: (ctx) => const FirstScreen(),
        SecondScreen.routeName: (ctx) => const SecondScreen(),
        LoginScreen.routeName:(ctx) => const LoginScreen(),
        RegisterScreen.routeName:(ctx) => const RegisterScreen(),
      },
    );
  }
}
