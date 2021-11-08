import 'package:flutter/material.dart';
import 'package:litmath/screens/second_elementary_activities/second_elementary_divide.dart';
import 'package:litmath/screens/second_elementary_activities/second_elementary_fractions.dart';
import 'package:litmath/screens/second_elementary_activities/second_elementary_multiplication.dart';
import 'package:litmath/screens/second_elementary_activities/second_elementary_shapes.dart';
import 'package:litmath/screens/second_elementary_activities/second_elementary_substraction.dart';
import 'package:litmath/screens/second_elementary_activities/second_elementary_sums.dart';
import 'package:litmath/widgets/scholarship_card.dart';

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
        padding: const EdgeInsets.all(8.0),
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
                    routeName: SecondElementarySums.routeName),
                const SizedBox(
                  height: 50,
                ),
                ScholarshipCard(
                    imageUrl: "assets/imgs/resta.png",
                    title: "Restas",
                    color: Colors.red,
                    routeName: SecondElementarySubstraction.routeName),
                const SizedBox(
                  height: 50,
                ),
                ScholarshipCard(
                    imageUrl: "assets/imgs/multiplicacion.png",
                    title: "Multiplicación",
                    color: Colors.green,
                    routeName: SecondElementaryMultiplication.routeName),
                const SizedBox(
                  height: 50,
                ),
                ScholarshipCard(
                    imageUrl: "assets/imgs/division.png",
                    title: "División",
                    color: Colors.pink,
                    routeName: SecondElementaryDivide.routeName),
                const SizedBox(
                  height: 50,
                ),
                ScholarshipCard(
                    imageUrl: "assets/imgs/tridimensional.png",
                    title: "Figuras",
                    color: Colors.lightBlue,
                    routeName: SecondElementaryShapes.routeName),
                const SizedBox(
                  height: 50,
                ),
                ScholarshipCard(
                    imageUrl: "assets/imgs/fracciones.png",
                    title: "Fracciones",
                    color: Colors.purple,
                    routeName: SecondElementaryFractions.routeName),
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
