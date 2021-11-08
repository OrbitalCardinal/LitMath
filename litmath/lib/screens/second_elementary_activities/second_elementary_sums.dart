import 'package:flutter/material.dart';
import 'package:litmath/widgets/finished_activity_dialog.dart';
import 'dart:math';

class SecondElementarySums extends StatefulWidget {
  const SecondElementarySums({Key? key}) : super(key: key);
  static const routeName = "/SecondElementarySums";

  @override
  _SecondElementarySumsState createState() => _SecondElementarySumsState();
}

class _SecondElementarySumsState extends State<SecondElementarySums> {
  TextStyle promptStyle = const TextStyle(fontSize: 45);
  Random rand = Random();
  int totalRounds = 9;
  int rounds = 0;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    int range = 50;
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
        title: Text("Ronda " +
            (rounds + 1).toString() +
            " de " +
            (totalRounds + 1).toString()),
      ),
      body: SizedBox(
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
