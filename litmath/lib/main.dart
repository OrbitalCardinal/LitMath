import 'package:flutter/material.dart';
import 'package:litmath/screens/kinder_acitivities/couting_activity_screen.dart';
import 'package:litmath/screens/first_elementary_activities/first_elementary_compare.dart';
import 'package:litmath/screens/first_elementary_activities/first_elementary_fractions.dart';
import 'package:litmath/screens/first_elementary_activities/first_elementary_substraction.dart';
import 'package:litmath/screens/first_elementary_activities/first_elementary_sums.dart';
import 'package:litmath/screens/activities_selection_screens/first_elementary_screen.dart';
import 'package:litmath/screens/kinder_acitivities/patterns_screen.dart';
import 'package:litmath/screens/second_elementary_activities/second_elementary_divide.dart';
import 'package:litmath/screens/second_elementary_activities/second_elementary_multiplication.dart';
import 'package:litmath/screens/second_elementary_activities/second_elementary_shapes.dart';
import 'package:litmath/screens/second_elementary_activities/second_elementary_substraction.dart';
import 'package:litmath/screens/second_elementary_activities/second_elementary_sums.dart';
import 'package:litmath/screens/activities_selection_screens/second_elementary_screen.dart';
import 'package:litmath/screens/kinder_acitivities/sum_screen.dart';
import 'package:litmath/screens/kinder_acitivities/substraction_screen.dart';
import 'package:litmath/screens/third_elementary_activities/third_elementary_divide.dart';
import 'package:litmath/screens/second_elementary_activities/second_elementary_fractions.dart';
import 'package:litmath/screens/third_elementary_activities/third_elementary_multiplication.dart';
import 'package:litmath/screens/third_elementary_activities/third_elementary_plane.dart';
import 'package:litmath/screens/third_elementary_activities/third_elementary_substraction.dart';
import 'package:litmath/screens/third_elementary_activities/third_elementary_sums.dart';
import 'package:litmath/screens/activities_selection_screens/third_elementary_screen.dart';
import 'package:litmath/screens/first_screen.dart';
import 'package:litmath/screens/activities_selection_screens/kinder_screen.dart';
import 'package:litmath/screens/middle_screen.dart';
import 'package:litmath/screens/auth_screens/new_login_screen.dart';
import 'package:litmath/screens/auth_screens/new_signup_screen.dart';
import 'package:litmath/screens/second_screen.dart';
import 'package:litmath/screens/selection_screen.dart';
import 'package:litmath/screens/settings_screen.dart';
import 'package:litmath/screens/slides_screens/slide_show_screen.dart';
import 'package:litmath/screens/drag_and_drop_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            primary: Colors.red[400],
            secondary: Colors.blue[600],
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const FirstElementarySubstraction(),
        routes: {
          FirstScreen.routeName: (ctx) => const FirstScreen(),
          SecondScreen.routeName: (ctx) => const SecondScreen(),
          SlideShowScreen.routeName: (ctx) => const SlideShowScreen(),
          NewLoginScreen.routeName: (ctx) => const NewLoginScreen(),
          NewSignUpScreen.routeName: (ctx) => const NewSignUpScreen(),
          SelectionScreen.routeName: (ctx) => const SelectionScreen(),
          KinderScreen.routeName: (ctx) => const KinderScreen(),
          FirstElementaryScreen.routeName: (ctx) =>
              const FirstElementaryScreen(),
          SecondElementaryScreen.routeName: (ctx) =>
              const SecondElementaryScreen(),
          ThirdElementaryScreen.routeName: (ctx) =>
              const ThirdElementaryScreen(),
          MiddleScreen.routeName: (ctx) => const MiddleScreen(),
          SettingsScreen.routeName: (ctx) => const SettingsScreen(),
          DragAndDropScreen.routeName: (ctx) => const DragAndDropScreen(),
          CountingActivtyScreen.routeName: (ctx) =>
              const CountingActivtyScreen(),
          PatternsScreen.routeName: (ctx) => const PatternsScreen(),
          SumScreen.routeName: (ctx) => const SumScreen(),
          SubstractionScreen.routeName: (ctx) => const SubstractionScreen(),
          FirstElementarySums.routeName: (ctx) => const FirstElementarySums(),
          FirstElementarySubstraction.routeName: (ctx) =>
              const FirstElementarySubstraction(),
          FirstElementaryCompare.routeName: (ctx) =>
              const FirstElementaryCompare(),
          FirstElementaryFractions.routeName: (ctx) =>
              const FirstElementaryFractions(),
          SecondElementarySums.routeName: (ctx) => const SecondElementarySums(),
          SecondElementarySubstraction.routeName: (ctx) =>
              const SecondElementarySubstraction(),
          SecondElementaryMultiplication.routeName: (ctx) =>
              const SecondElementaryMultiplication(),
          SecondElementaryDivide.routeName: (ctx) =>
              const SecondElementaryDivide(),
          SecondElementaryShapes.routeName: (ctx) =>
              const SecondElementaryShapes(),
          ThirdElementarySums.routeName: (ctx) => const ThirdElementarySums(),
          ThirdElementarySubstraction.routeName: (ctx) =>
              const ThirdElementarySubstraction(),
          ThirdElementaryMultiplication.routeName: (ctx) =>
              const ThirdElementaryMultiplication(),
          ThirdElementaryDivide.routeName: (ctx) =>
              const ThirdElementaryDivide(),
          SecondElementaryFractions.routeName: (ctx) =>
              const SecondElementaryFractions(),
          ThirdElementaryPlane.routeName: (ctx) => const ThirdElementaryPlane()
        },
      );
    });
  }
}
