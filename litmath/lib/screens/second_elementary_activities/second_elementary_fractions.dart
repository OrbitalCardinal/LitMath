import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:litmath/widgets/finished_activity_dialog.dart';
import 'dart:math';

class SecondElementaryFractions extends StatefulWidget {
  const SecondElementaryFractions({Key? key}) : super(key: key);
  static const routeName = "/SecondElementaryFractions";

  @override
  _SecondElementaryFractionsState createState() =>
      _SecondElementaryFractionsState();
}

class _SecondElementaryFractionsState extends State<SecondElementaryFractions> {
  TextStyle promptStyle = const TextStyle(fontSize: 45);
  Random rand = Random();
  int totalRounds = 9;
  int rounds = 0;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    // Fraction initializer
    int max = 10;
    int min = 1;
    int numerator = 1;
    int firstNumber = rand.nextInt(max - min) + min;
    int secondNumber = rand.nextInt(max - min) + min;

    double firstFraction = numerator / firstNumber;
    double secondFraction = numerator / secondNumber;

    int numeratorResult = firstNumber + secondNumber;
    int denominatorResult = firstNumber * secondNumber;

    List<List<int>> options = [
      [numeratorResult, denominatorResult],
      [rand.nextInt(max - min) + min, rand.nextInt(max - min) + min],
      [rand.nextInt(max - min) + min, rand.nextInt(max - min) + min],
      [rand.nextInt(max - min) + min, rand.nextInt(max - min) + min]
    ];

    options.shuffle();

    // List<int> options = [
    //   result,
    //   rand.nextInt(max - min) + min,
    //   rand.nextInt(max - min) + min,
    //   rand.nextInt(max - min) + min
    // ];

    // options.shuffle();

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
            const Text("Realiza la siguiente operación de fracciones: "),
            TeXView(
              child: TeXViewDocument(r""" $$ \frac{""" +
                  numerator.toString() +
                  r"""}{ """ +
                  firstNumber.toString() +
                  r"""} +  \frac{""" +
                  numerator.toString() +
                  r"""}{""" +
                  secondNumber.toString() +
                  r"""} = ?$$ """),
              style: TeXViewStyle(fontStyle: TeXViewFontStyle(fontSize: 28)),
            ),
            Wrap(
              children: [
                ...options
                    .map(
                      (option) => Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Stack(
                          children: [
                            Container(
                              height: 115,
                              width: 115,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: TeXView(
                                child: TeXViewDocument(r""" $$ \frac{""" +
                                    option[0].toString() +
                                    r"""}{""" +
                                    option[1].toString() +
                                    r"""} $$ """),
                                style: TeXViewStyle(
                                  backgroundColor: Colors.red[400],
                                  contentColor: Colors.white,
                                  fontStyle: TeXViewFontStyle(fontSize: 26),
                                ),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  primary: Colors.transparent),
                              onPressed: () {
                                if (option[0] == numeratorResult &&
                                    option[1] == denominatorResult) {
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
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20))),
                            )
                          ],
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
