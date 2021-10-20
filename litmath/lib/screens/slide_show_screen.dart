import 'package:flutter/material.dart';
import 'package:litmath/screens/login_screen.dart';
import 'package:litmath/screens/new_login_screen.dart';
import 'package:litmath/screens/new_signup_screen.dart';
import 'package:litmath/screens/signup_screen.dart';
import 'package:litmath/screens/slide1_screen.dart';
import 'package:litmath/screens/slide2_screen.dart';
import 'package:sizer/sizer.dart';

class SlideShowScreen extends StatefulWidget {
  const SlideShowScreen({Key? key}) : super(key: key);
  static const routeName = "/slide-show";

  @override
  _SlideShowScreenState createState() => _SlideShowScreenState();
}

class _SlideShowScreenState extends State<SlideShowScreen> {
  int actualPage = 0;
  final controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: PageView(
              controller: controller,
              onPageChanged: (page) {
                setState(() {
                  actualPage = page;
                });
              },
              children: const [
                Slide1Screen(),
                Slide2Screen(),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SlidesDot(actualPage == 0
                          ? Colors.lime.shade400
                          : Colors.white),
                      SlidesDot(actualPage == 1
                          ? Colors.lime.shade400
                          : Colors.white),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.cyan[600],
                            fixedSize: Size(30.w, 6.6.h)),
                        onPressed: () => Navigator.of(context)
                            .pushNamed(NewSignUpScreen.routeName),
                        child: const Text(
                          "Registrarse",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      TextButton(
                        onPressed: () => Navigator.of(context)
                            .pushNamed(NewLoginScreen.routeName),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red[400],
                          fixedSize: Size(30.w, 6.6.h),
                        ),
                        child: const Text(
                          "Iniciar sesión",
                          style: TextStyle(
                            
                            color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SlidesDot extends StatelessWidget {
  final Color active;
  SlidesDot(this.active);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
          color: active,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey)),
    );
  }
}
