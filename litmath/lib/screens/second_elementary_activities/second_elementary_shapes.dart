import 'package:flutter/material.dart';
import 'package:litmath/providers/user_provider.dart';
import 'package:litmath/widgets/finished_activity_dialog.dart';
import 'dart:math';

class SecondElementaryShapes extends StatefulWidget {
  const SecondElementaryShapes({Key? key}) : super(key: key);
  static const routeName = "/SecondElementaryShapes";

  @override
  _SecondElementaryShapesState createState() => _SecondElementaryShapesState();
}

class _SecondElementaryShapesState extends State<SecondElementaryShapes> {
  String activity_name = 'Figuras';
  TextStyle promptStyle = const TextStyle(fontSize: 45);
  Random rand = Random();
  int totalRounds = 9;
  int rounds = 0;
  int score = 0;

  List<String> shapes = [
    "circulo",
    "cuadrado",
    "decagono",
    "heptagono",
    "hexagono",
    "octagono",
    "pentagono",
    "rectangulo",
    "triangulo"
  ];

  @override
  Widget build(BuildContext context) {
    shapes.shuffle();

    String shapeName = shapes[0];

    List<String> shapeOptions = [shapes[0], shapes[1], shapes[2], shapes[3]];
    Map<int, String> options = {
      1: shapes[0],
      2: shapes[1],
      3: shapes[2],
      4: shapes[3]
    };

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
            Text("¿Cual de las siguientes figuras es un " +
                shapeName.toString() +
                "?"),
            Wrap(
              children: [
                ...shapeOptions.asMap().entries.map((shapeOption) {
                  int index = shapeOption.key;
                  String name = shapeOption.value;
                  return Container(
                    margin: const EdgeInsets.all(8),
                    child: Stack(
                      children: [
                        Image(
                          width: 150,
                          image: AssetImage(
                            "assets/imgs/shapes/" + name + ".png",
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              (index + 1).toString(),
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                        color: Colors.black,
                                        offset: Offset(1, 1),
                                        blurRadius: 2)
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList()
              ],
            ),
            Wrap(
              children: [
                ...options.entries.map(
                  (option) {
                    int index = option.key;
                    String shape = option.value;
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          if (shape == shapeName) {
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
                            index.toString(),
                          ),
                        ),
                      ),
                    );
                  },
                ).toList()
              ],
            )
          ],
        ),
      ),
    );
  }
}
