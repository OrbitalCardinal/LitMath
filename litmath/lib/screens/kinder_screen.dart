import 'package:flutter/material.dart';
import 'package:litmath/screens/couting_activity_screen.dart';
import 'package:litmath/screens/patterns_screen.dart';
import 'package:litmath/screens/substraction_screen.dart';
import 'package:litmath/screens/sum_screen.dart';
import 'package:litmath/widgets/scholarship_card.dart';
import 'drag_and_drop_screen.dart';

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
                routeName: CountingActivtyScreen.routeName),
            const SizedBox(
              height: 50,
            ),
            ScholarshipCard(
                imageUrl: "assets/imgs/patrones.png",
                title: "Patrones",
                color: Colors.lightBlue,
                routeName: PatternsScreen.routeName),
            const SizedBox(
              height: 50,
            ),
            ScholarshipCard(
                imageUrl: "assets/imgs/suma.png",
                title: "Sumas",
                color: Colors.orange,
                routeName: SumScreen.routeName),
            const SizedBox(
              height: 50,
            ),
            ScholarshipCard(
                imageUrl: "assets/imgs/resta.png",
                title: "Restas",
                color: Colors.red,
                routeName: SubstractionScreen.routeName),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
