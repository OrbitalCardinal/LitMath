import 'package:flutter/material.dart';
import 'package:litmath/widgets/scholarship_card.dart';

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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScholarshipCard(
                imageUrl: "assets/imgs/suma.png",
                title: "Sumas",
                color: Colors.orange,
                routeName: ""),
            const SizedBox(
              height: 50,
            ),
            ScholarshipCard(
                imageUrl: "assets/imgs/resta.png",
                title: "Restas",
                color: Colors.red,
                routeName: ""),
            const SizedBox(
              height: 50,
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
                routeName: ""),
            const SizedBox(
              height: 50,
            ),
            ScholarshipCard(
                imageUrl: "assets/imgs/fracciones.png",
                title: "Fracciones",
                color: Colors.purple,
                routeName: ""),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
