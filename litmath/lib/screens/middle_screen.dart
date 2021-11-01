import 'package:flutter/material.dart';
import 'package:litmath/widgets/scholarship_card.dart';

class MiddleScreen extends StatelessWidget {
  const MiddleScreen({Key? key}) : super(key: key);
  static const routeName = "/secundaria";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Primaria 2"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScholarshipCard(
                imageUrl: "assets/imgs/series.png",
                title: "Series",
                color: Colors.deepOrange,
                routeName: ""),
            const SizedBox(
              height: 50,
            ),
            ScholarshipCard(
                imageUrl: "assets/imgs/geometria.png",
                title: "Geometria",
                color: Colors.blue,
                routeName: ""),
            const SizedBox(
              height: 50,
            ),
            ScholarshipCard(
                imageUrl: "assets/imgs/ecuaciones.png",
                title: "Ecuaciones",
                color: Colors.pinkAccent,
                routeName: ""),
            const SizedBox(
              height: 50,
            ),
            ScholarshipCard(
                imageUrl: "assets/imgs/reglatres.png",
                title: "Regla de tres",
                color: Colors.green.shade600,
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
