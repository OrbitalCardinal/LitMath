import 'package:flutter/material.dart';
import 'package:litmath/screens/first_elementary_activities/first_elementary_compare.dart';
import 'package:litmath/screens/first_elementary_activities/first_elementary_fractions.dart';
import 'package:litmath/screens/first_elementary_activities/first_elementary_substraction.dart';
import 'package:litmath/screens/first_elementary_activities/first_elementary_sums.dart';
import 'package:litmath/widgets/scholarship_card.dart';
import 'package:sizer/sizer.dart';

class FirstElementaryScreen extends StatelessWidget {
  const FirstElementaryScreen({Key? key}) : super(key: key);
  static const routeName = "/firstElementary";

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("1° de Primaria"),
      ),
      body: Padding(
        padding:  EdgeInsets.all(6.w),
        child: Scrollbar(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
        child: Center(child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 1.h,
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            ScholarshipCard(
                imageUrl: "assets/imgs/suma.png",
                title: "Sumas",
                color: Colors.orange,
                routeName: FirstElementarySums.routeName),
            SizedBox(
              height: 6.5.h,
            ),
            ScholarshipCard(
                imageUrl: "assets/imgs/resta.png",
                title: "Restas",
                color: Colors.red,
                routeName: FirstElementarySubstraction.routeName),
            SizedBox(
              height: 6.5.h,
            ),
            // ScholarshipCard(
            //     imageUrl: "assets/imgs/multiplicacion.png",
            //     title: "Multiplicación",
            //     color: Colors.green,
            //     routeName: ""),
            // const SizedBox(
            //   height: 50,
            // ),
            // ScholarshipCard(
            //     imageUrl: "assets/imgs/division.png",
            //     title: "División",
            //     color: Colors.pink,
            //     routeName: ""),
            // const SizedBox(
            //   height: 50,
            // ),
            ScholarshipCard(
                imageUrl: "assets/imgs/comparacion.png",
                title: "Comparación",
                color: Colors.lightBlue,
                routeName: FirstElementaryCompare.routeName),
            SizedBox(
              height: 6.5.h,
            ),
            ScholarshipCard(
                imageUrl: "assets/imgs/fracciones.png",
                title: "Fracciones",
                color: Colors.purple,
                routeName: FirstElementaryFractions.routeName),
            // const SizedBox(
            //   height: 50,
            // ),
          ],
        ),
      ),),),)
    );
    }
    
  }

