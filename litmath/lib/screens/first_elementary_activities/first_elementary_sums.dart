import 'package:flutter/material.dart';
import 'package:litmath/providers/user_provider.dart';
import 'dart:math';

import 'package:litmath/widgets/finished_activity_dialog.dart';

class FirstElementarySums extends StatefulWidget {
  const FirstElementarySums({Key? key}) : super(key: key);
  static const routeName = "/FirstElementarySums";

  @override
  _FirstElementarySumsState createState() => _FirstElementarySumsState();
}

class _FirstElementarySumsState extends State<FirstElementarySums> {
  String activity_name = 'Sumas 1° Primaria';
  TextStyle promptStyle = const TextStyle(fontSize: 45);
  Random rand = Random();
  int totalRounds = 9;
  int rounds = 0;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    {
      int range = 30;
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
                                rounds+=1;
                                UserProvider().sendReport(activity_name, score.toString(), rounds.toString());
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
}
