import 'package:flutter/material.dart';
import 'package:litmath/widgets/scholarship_card.dart';

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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScholarshipCard(
                imageUrl: "assets/imgs/conteo.png",
                title: "Conteo",
                color: Colors.grey,
                routeName: ""),
            const SizedBox(
              height: 50,
            ),
            ScholarshipCard(
                imageUrl: "assets/imgs/comparacion.png",
                title: "Comparación",
                color: Colors.lightBlue,
                routeName: ""),
            const SizedBox(
              height: 50,
            ),
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
          ],
        ),
      ),
    );
  }
}
