import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:litmath/screens/kinder_screen.dart';
import 'package:litmath/screens/selection_screen.dart';
import 'package:litmath/widgets/finished_activity_dialog.dart';

class SubstractionScreen extends StatefulWidget {
  const SubstractionScreen({Key? key}) : super(key: key);
  static const routeName = "/subsctractionscreen";

  @override
  _SubstractionScreenState createState() => _SubstractionScreenState();
}

class _SubstractionScreenState extends State<SubstractionScreen> {
  TextStyle promptStyle = const TextStyle(fontSize: 45);
  Random rand = Random();
  int rounds = 0;
  int score = 0;
  int randInt = 0;
  @override
  Widget build(BuildContext context) {
    int range = 10;
    int firstNumber = rand.nextInt(range);
    int secondNumber = rand.nextInt(range);
    int result = firstNumber - secondNumber;
    int randInt = rand.nextInt(5);
    while (result < 0) {
      firstNumber = rand.nextInt(range);
      secondNumber = rand.nextInt(range);
      result = firstNumber - secondNumber;
    }

    List<int> options = [
      result,
      rand.nextInt(range) + randInt,
      rand.nextInt(range) + randInt,
      rand.nextInt(range) + randInt
    ];

    options.shuffle();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Restas"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Realiza la siguiente operación: "),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  firstNumber.toString(),
                  style: promptStyle,
                ),
                Text(
                  "-",
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
