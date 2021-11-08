import 'package:flutter/material.dart';
import 'dart:math';

import 'package:litmath/screens/kinder_screen.dart';
import 'package:litmath/screens/selection_screen.dart';

class CountingActivtyScreen extends StatefulWidget {
  const CountingActivtyScreen({Key? key}) : super(key: key);
  static const routeName = "/conteoActividad";

  @override
  _CountingActivtyScreenState createState() => _CountingActivtyScreenState();
}

class _CountingActivtyScreenState extends State<CountingActivtyScreen> {
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
        title: const Text("Conteo"),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsetsDirectional.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("¿Cuantas focas hay?"),
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
                        rounds += 1;
                        if (rounds == 5) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content:
                                      const Text("La actividad ha terminado!"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushNamedAndRemoveUntil(
                                                  SelectionScreen.routeName,
                                                  (route) => false);
                                        },
                                        child: const Text("Continuar")),
                                  ],
                                );
                              });
                        } else {
                          if (answer == n) {
                            setState(() {
                              score += 1;
                              n = random.nextInt(10);
                            });
                          } else {
                            setState(() {
                              n = random.nextInt(10);
                            });
                          }
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
