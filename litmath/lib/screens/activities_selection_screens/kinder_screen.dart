import 'package:flutter/material.dart';
import 'package:litmath/screens/kinder_acitivities/couting_activity_screen.dart';
import 'package:litmath/screens/kinder_acitivities/patterns_screen.dart';
import 'package:litmath/screens/kinder_acitivities/substraction_screen.dart';
import 'package:litmath/screens/kinder_acitivities/sum_screen.dart';
import 'package:litmath/widgets/scholarship_card.dart';
import 'package:sizer/sizer.dart';
import '../drag_and_drop_screen.dart';

class KinderScreen extends StatelessWidget {
  const KinderScreen({Key? key}) : super(key: key);
  static const routeName = "/kinderScreen";

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preescolar"),
      ),
      body: Padding(
        padding: EdgeInsets.all(6.w),
        child: Center(child: Scrollbar(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 1.h,
            ),
            ScholarshipCard(
                imageUrl: "assets/imgs/conteo.png",
                title: "Conteo",
                color: Colors.grey,
                routeName: CountingActivtyScreen.routeName),
            SizedBox(
              height: 6.5.h,
            ),
            ScholarshipCard(
                imageUrl: "assets/imgs/patrones.png",
                title: "Patrones",
                color: Colors.lightBlue,
                routeName: PatternsScreen.routeName),
            SizedBox(
              height: 6.5.h,
            ),
            ScholarshipCard(
                imageUrl: "assets/imgs/suma.png",
                title: "Sumas",
                color: Colors.orange,
                routeName: SumScreen.routeName),
            SizedBox(
              height: 6.5.h,
            ),
            ScholarshipCard(
                imageUrl: "assets/imgs/resta.png",
                title: "Restas",
                color: Colors.red,
                routeName: SubstractionScreen.routeName),
            
          ],
        ),
      ),),),)
    ); 
    }
    
  }

