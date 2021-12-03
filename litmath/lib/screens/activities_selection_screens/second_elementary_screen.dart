import 'package:flutter/material.dart';
import 'package:litmath/screens/second_elementary_activities/second_elementary_divide.dart';
import 'package:litmath/screens/second_elementary_activities/second_elementary_fractions.dart';
import 'package:litmath/screens/second_elementary_activities/second_elementary_multiplication.dart';
import 'package:litmath/screens/second_elementary_activities/second_elementary_shapes.dart';
import 'package:litmath/screens/second_elementary_activities/second_elementary_substraction.dart';
import 'package:litmath/screens/second_elementary_activities/second_elementary_sums.dart';
import 'package:litmath/widgets/scholarship_card.dart';
import 'package:sizer/sizer.dart';

class SecondElementaryScreen extends StatelessWidget {
  const SecondElementaryScreen({Key? key}) : super(key: key);
  static const routeName = "/secondElementary";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("2° de Primaria"),
      ),
      body: Padding(
        padding: EdgeInsets.all(6.w),
        child: Scrollbar(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
              height: 5.h,
            ),
                ScholarshipCard(
                    imageUrl: "assets/imgs/suma.png",
                    title: "Sumas",
                    color: Colors.orange,
                    routeName: SecondElementarySums.routeName),
                SizedBox(
              height: 6.5.h,
            ),
                ScholarshipCard(
                    imageUrl: "assets/imgs/resta.png",
                    title: "Restas",
                    color: Colors.red,
                    routeName: SecondElementarySubstraction.routeName),
                SizedBox(
              height: 6.5.h,
            ),
                ScholarshipCard(
                    imageUrl: "assets/imgs/multiplicacion.png",
                    title: "Multiplicación",
                    color: Colors.green,
                    routeName: SecondElementaryMultiplication.routeName),
                SizedBox(
              height: 6.5.h,
            ),
                ScholarshipCard(
                    imageUrl: "assets/imgs/division.png",
                    title: "División",
                    color: Colors.pink,
                    routeName: SecondElementaryDivide.routeName),
                SizedBox(
              height: 6.5.h,
            ),
                ScholarshipCard(
                    imageUrl: "assets/imgs/tridimensional.png",
                    title: "Figuras",
                    color: Colors.lightBlue,
                    routeName: SecondElementaryShapes.routeName),
                SizedBox(
              height: 6.5.h,
            ),
                ScholarshipCard(
                    imageUrl: "assets/imgs/fracciones.png",
                    title: "Fracciones",
                    color: Colors.purple,
                    routeName: SecondElementaryFractions.routeName),
                
              ],
            ),)
          ),
        ),
      ),
    );
  }
}
