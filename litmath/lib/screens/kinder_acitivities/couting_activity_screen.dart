import 'package:flutter/material.dart';
import 'package:litmath/providers/user_provider.dart';
import 'dart:math';

import 'package:litmath/screens/activities_selection_screens/kinder_screen.dart';
import 'package:litmath/screens/selection_screen.dart';
import 'package:litmath/widgets/finished_activity_dialog.dart';

class CountingActivtyScreen extends StatefulWidget {
  const CountingActivtyScreen({Key? key}) : super(key: key);
  static const routeName = "/conteoActividad";

  @override
  _CountingActivtyScreenState createState() => _CountingActivtyScreenState();
}

class _CountingActivtyScreenState extends State<CountingActivtyScreen> {
  String activity_name = 'Conteo';
  int totalRounds = 3;
  int rounds = 0;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int n = random.nextInt(15);
    List<Widget> elements = [];
    List<int> answers = [
      n,
      random.nextInt(10),
      random.nextInt(10),
      random.nextInt(10)
    ];

    answers.shuffle();

    for (var i = 0; i < n; i++) {
      elements.add(
        const Image(
          image: AssetImage("assets/imgs/resta.png"),
          width: 100,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Ronda " +
            (rounds + 1).toString() +
            " de " +
            (totalRounds + 1).toString()),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsetsDirectional.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("¿Cuantas personajes hay?"),
            const SizedBox(
              height: 50,
            ),
            Wrap(
              children: elements.toList(),
            ),
            const SizedBox(
              height: 50,
            ),
            Wrap(
              children: [
                ...answers.map(
                  (answer) => Container(
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        if (answer == n) {
                          score += 1;
                        }

                        if (rounds != totalRounds) {
                          setState(() {
                            rounds += 1;
                          });
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return FinishedActivityDialog(
                                  score: score,
                                  totalRounds: totalRounds,
                                );
                              });
                              //rounds+=1;
                              double calif = (score * 100) / (totalRounds + 1);
                              UserProvider().sendReport(activity_name, calif.toStringAsFixed(0));
                        }
                      },
                      child: Text(answer.toString()),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
