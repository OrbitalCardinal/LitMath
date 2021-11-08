import 'package:flutter/material.dart';
import 'package:litmath/screens/second_elementary_activities/second_elementary_fractions.dart';
import 'package:litmath/screens/third_elementary_activities/third_elementary_divide.dart';
import 'package:litmath/screens/third_elementary_activities/third_elementary_multiplication.dart';
import 'package:litmath/screens/third_elementary_activities/third_elementary_plane.dart';
import 'package:litmath/screens/third_elementary_activities/third_elementary_substraction.dart';
import 'package:litmath/screens/third_elementary_activities/third_elementary_sums.dart';
import 'package:litmath/widgets/scholarship_card.dart';

class ThirdElementaryScreen extends StatelessWidget {
  const ThirdElementaryScreen({Key? key}) : super(key: key);
  static const routeName = "/thirdElementary";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("3° de Primaria"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: Scrollbar(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScholarshipCard(
                    imageUrl: "assets/imgs/suma.png",
                    title: "Sumas",
                    color: Colors.orange,
                    routeName: ThirdElementarySums.routeName),
                const SizedBox(
                  height: 50,
                ),
                ScholarshipCard(
                    imageUrl: "assets/imgs/resta.png",
                    title: "Restas",
                    color: Colors.red,
                    routeName: ThirdElementarySubstraction.routeName),
                const SizedBox(
                  height: 50,
                ),
                ScholarshipCard(
                    imageUrl: "assets/imgs/multiplicacion.png",
                    title: "Multiplicación",
                    color: Colors.green,
                    routeName: ThirdElementaryMultiplication.routeName),
                const SizedBox(
                  height: 50,
                ),
                ScholarshipCard(
                    imageUrl: "assets/imgs/division.png",
                    title: "División",
                    color: Colors.pink,
                    routeName: ThirdElementaryDivide.routeName),
                const SizedBox(
                  height: 50,
                ),
                ScholarshipCard(
                    imageUrl: "assets/imgs/plano.png",
                    title: "Plano Cartesiano",
                    color: Colors.purple,
                    routeName: ThirdElementaryPlane.routeName),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
