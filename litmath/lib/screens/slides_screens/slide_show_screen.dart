import 'package:flutter/material.dart';
import 'package:litmath/screens/auth_screens/new_login_screen.dart';
import 'package:litmath/screens/auth_screens/new_signup_screen.dart';
import 'package:litmath/screens/slides_screens/slide1_screen.dart';
import 'package:litmath/screens/slides_screens/slide2_screen.dart';
import 'package:sizer/sizer.dart';

class SlideShowScreen extends StatefulWidget {
  const SlideShowScreen({Key? key}) : super(key: key);
  static const routeName = "/slide-show";

  @override
  _SlideShowScreenState createState() => _SlideShowScreenState();
}
double width = 30.w;
double height = 5.7.h;

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
                  SizedBox(height: 3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.cyan[600],
                            fixedSize: Size(width, height)),
                        onPressed: () => Navigator.of(context)
                            .pushNamed(NewSignUpScreen.routeName),
                        child: const Text(
                          "Registrarse",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 3.w),
                      TextButton(
                        onPressed: () => Navigator.of(context)
                            .pushNamed(NewLoginScreen.routeName),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red[400],
                          fixedSize: Size(width, height),
                          //const Size(120, 40),
                        ),
                        child: const Text(
                          "Iniciar sesión",
                          style: TextStyle(color: Colors.white),
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
    final mediaQueryData = MediaQuery.of(context);
    if (mediaQueryData.orientation == Orientation.portrait) {
    return Container(
      margin: EdgeInsets.only(right: 1.w,left: 1.w),
      height: 1.5.h,
      width: 1.5.h,
      decoration: BoxDecoration(
          color: active,
          borderRadius: BorderRadius.circular(2.h),
      
          border: Border.all(color: Colors.grey)),
    );
    } {
      return Container(
      margin: EdgeInsets.only(right: 1.w,left: 1.w),
      height: 1.h,
      width: 1.h,
      decoration: BoxDecoration(
          color: active,
          borderRadius: BorderRadius.circular(2.h),
      
          border: Border.all(color: Colors.grey)),
    );
    }
  }
}

// class SlidesDot extends StatelessWidget {
//   final Color active;
//   SlidesDot(this.active);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(right: 5),
//       height: 12,
//       width: 12,
//       decoration: BoxDecoration(
//           color: active,
//           borderRadius: BorderRadius.circular(15),
      
//           border: Border.all(color: Colors.grey)),
//     );
//   }
// }
