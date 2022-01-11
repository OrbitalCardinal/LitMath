import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:litmath/providers/user_provider.dart';
import 'dart:math';

import 'package:litmath/widgets/finished_activity_dialog.dart';

class FirstElementarySubstraction extends StatefulWidget {
  const FirstElementarySubstraction({Key? key}) : super(key: key);
  static const routeName = "/FirstElementarySubstraction";

  @override
  _FirstElementarySubstractionState createState() =>
      _FirstElementarySubstractionState();
}

class _FirstElementarySubstractionState
    extends State<FirstElementarySubstraction> {
  String activity_name = 'Restas 1° Primaria';
  TextStyle promptStyle = const TextStyle(fontSize: 45);
  var _controller = TextEditingController();
  Random rand = Random();
  int totalRounds = 9;
  int rounds = 0;
  int score = 0;
  int randInt = 0;
  @override
  Widget build(BuildContext context) {
    int range = 20;
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
                ),
              ],
            ),
            TextField(
              controller: _controller,
              
              autofocus: true,
              style: promptStyle,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onSubmitted: (value) {
                print(value);

                if (int.parse(value) == result) {
                  score += 1;
                  
                }

                  if (rounds != totalRounds) {
                            setState(() {
                              rounds += 1;
                              _controller.clear();
                              
                            });
                  
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return FinishedActivityDialog(
                                  score: score,
                                  totalRounds: totalRounds, activityName: activity_name,
                                );
                              },
                            );
                            
                          }
              
                
              },onEditingComplete: () {},
            )

            // Wrap(
            //   children: [
            //     ...options
            //         .map(
            //           (option) => Container(
            //             margin: const EdgeInsets.symmetric(
            //                 horizontal: 10, vertical: 10),
            //             child:
            //             TextField(keyboardType: TextInputType.number,inputFormatters: [FilteringTextInputFormatter.digitsOnly],)
            //             // ElevatedButton(
            //             //   onPressed: () {
            //             //     if (option == result) {
            //             //       score += 1;
            //             //       print(score);
            //             //     }
            //             //     if (rounds != totalRounds) {
            //             //       setState(() {
            //             //         rounds += 1;
            //             //       });
            //             //     } else {
            //             //       showDialog(
            //             //         context: context,
            //             //         builder: (context) {
            //             //           return FinishedActivityDialog(
            //             //             score: score,
            //             //             totalRounds: totalRounds, activityName: activity_name,
            //             //           );
            //             //         },
            //             //       );

            //             //     }
            //             //   },
            //             //   child: Container(
            //             //     padding: const EdgeInsets.all(20),
            //             //     child: Text(
            //             //       option.toString(),

            //             //     ),
            //             //   ),
            //             // ),
            //           ),
            //         )
            //         .toList()

            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
