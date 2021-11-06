import 'package:flutter/material.dart';
import 'dart:math';

import 'package:litmath/screens/kinder_screen.dart';

class SumScreen extends StatefulWidget {
  const SumScreen({Key? key}) : super(key: key);
  static const routeName = "/sumscreen";

  @override
  _SumScreenState createState() => _SumScreenState();
}

class _SumScreenState extends State<SumScreen> {
  TextStyle promptStyle = const TextStyle(fontSize: 45);
  Random rand = Random();
  int rounds = 0;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    int range = 20;
    int firstNumber = rand.nextInt(range);
    int secondNumber = rand.nextInt(range);
    int result = firstNumber + secondNumber;

    List<int> options = [
      result,
      rand.nextInt(range),
      rand.nextInt(range),
      rand.nextInt(range)
    ];

    options.shuffle();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sumas"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Realiza la siguiente operación: "),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  firstNumber.toString(),
                  style: promptStyle,
                ),
                Text(
                  "+",
                  style: promptStyle,
                ),
                Text(
                  secondNumber.toString(),
                  style: promptStyle,
                ),
                Text(
                  "=",
                  style: promptStyle,
                ),
                Text(
                  "?",
                  style: promptStyle,
                )
              ],
            ),
            Wrap(
              children: [
                ...options
                    .map(
                      (option) => Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            if (option == result) {
                              score += 1;
                              print(score);
                            }
                            if (rounds != 9) {
                              setState(() {
                                rounds += 1;
                              });
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const FinishedActivityDialog();
                                },
                              );
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              option.toString(),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FinishedActivityDialog extends StatelessWidget {
  const FinishedActivityDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text("La actividad a finalizado"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(KinderScreen.routeName);
          },
          child: const Text("Ok"),
        )
      ],
    );
  }
}
