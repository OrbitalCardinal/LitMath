import 'package:flutter/material.dart';
import 'dart:math';
import 'package:litmath/providers/user_provider.dart';

import 'package:litmath/widgets/finished_activity_dialog.dart';

class FirstElementaryCompare extends StatefulWidget {
  const FirstElementaryCompare({Key? key}) : super(key: key);
  static const routeName = "/FirstElementaryCompare";
  @override
  _FirstElementaryCompareState createState() => _FirstElementaryCompareState();
}

class _FirstElementaryCompareState extends State<FirstElementaryCompare> {
  String activity_name = 'Comparación';
  TextStyle promptStyle = const TextStyle(fontSize: 45);
  Random rand = Random();
  int totalRounds = 9;
  int rounds = 0;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    int firstNumber = rand.nextInt(10);
    int secondNumber = rand.nextInt(10);
    String answer;
    List<String> comparadores = ["<", ">", "=", "!="];
    if (firstNumber < secondNumber) {
      answer = comparadores[0];
    } else if (firstNumber > secondNumber) {
      answer = comparadores[1];
    } else if (firstNumber == secondNumber) {
      answer = comparadores[2];
    } else {
      answer = comparadores[3];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Ronda " +
            (rounds + 1).toString() +
            " de " +
            (totalRounds + 1).toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Complete la siguiente expresión"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  firstNumber.toString(),
                  style: promptStyle,
                ),
                Text(
                  " ? ",
                  style: promptStyle,
                ),
                Text(
                  secondNumber.toString(),
                  style: promptStyle,
                ),
              ],
            ),
            Wrap(
              children: [
                ...comparadores
                    .map((option) => Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              if (option == answer) {
                                score += 1;
                                print(score);
                              }
                              if (rounds == totalRounds) {
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
                              } else {
                                setState(() {
                                  rounds += 1;
                                });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                option.toString(),
                              ),
                            ),
                          ),
                        ))
                    .toList()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
