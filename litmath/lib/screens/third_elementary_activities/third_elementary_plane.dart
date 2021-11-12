import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:litmath/providers/user_provider.dart';
import 'package:litmath/widgets/finished_activity_dialog.dart';
import 'dart:math';

class ThirdElementaryPlane extends StatefulWidget {
  const ThirdElementaryPlane({Key? key}) : super(key: key);
  static const routeName = "/ThirdElementaryPlane";
  @override
  _ThirdElementaryPlaneState createState() => _ThirdElementaryPlaneState();
}

class _ThirdElementaryPlaneState extends State<ThirdElementaryPlane> {
  String activity_name = 'Plano Cartesiano';
  Random rand = Random();
  int score = 0;
  int totalRounds = 9;
  int rounds = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int min = -10;
    int max = 10;
    int x = rand.nextInt(max - min) + min;
    int y = rand.nextInt(max - min) + min;

    List<int> answer = [x, y];
    List<List<int>> options = [
      answer,
      [rand.nextInt(max - min) + min, rand.nextInt(max - min) + min],
      [rand.nextInt(max - min) + min, rand.nextInt(max - min) + min],
      [rand.nextInt(max - min) + min, rand.nextInt(max - min) + min]
    ];

    options.shuffle();
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
          children: [
            const Text("¿Que coordenada muestra el siguiente plano?"),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: screenWidth,
              height: 250,
              margin: const EdgeInsets.all(10),
              child: CustomPaint(
                size: const Size(200, 200),
                painter: Plane(
                    width: screenWidth - 60,
                    height: 250,
                    x: x.toDouble(),
                    y: y.toDouble()),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ...options
                .map((option) => Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          if (option[0] == answer[0] &&
                              option[1] == answer[1]) {
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
                            double calif = (score * 100) / (totalRounds + 1);
                              UserProvider().sendReport(activity_name, calif.toStringAsFixed(0));
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            "(" +
                                option[0].toString() +
                                "," +
                                option[1].toString() +
                                ")",
                          ),
                        ),
                      ),
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}

class Plane extends CustomPainter {
  Plane(
      {required this.width,
      required this.height,
      required this.x,
      required this.y});
  double width;
  double height;
  double x;
  double y;
  @override
  void paint(Canvas canvas, Size size) {
    // Plane lines
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawLine(Offset(width / 2, height), Offset(width / 2, 0), paint);
    canvas.drawLine(Offset(0, height / 2), Offset(width, height / 2), paint);

    int guideLineLength = 3;
    double guideTextSize = 7;
    int n = 10;
    double trans = width / 2;
    double changeRate = trans / n;
    trans += changeRate;

    // Guide lines to right
    for (var i = 0; i < n; i++) {
      canvas.drawLine(Offset(0 + trans, (height / 2) - guideLineLength),
          Offset(0 + trans, (height / 2) + guideLineLength), paint);
      trans += changeRate;

      // Guide text
      TextPainter textPainter = TextPainter(
          text: TextSpan(
              text: (i + 1).toString(),
              style: TextStyle(color: Colors.black, fontSize: guideTextSize)),
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr)
        ..layout(maxWidth: size.width - 12.0 - 12.0);
      textPainter.paint(
          canvas,
          Offset(
              0 + trans - 2 - changeRate, (height / 2) - guideLineLength + 10));
    }

    trans = width / 2;
    trans -= changeRate;
    // Guide lines to left
    for (var i = 0; i < n; i++) {
      canvas.drawLine(Offset(0 + trans, (height / 2) - guideLineLength),
          Offset(0 + trans, (height / 2) + guideLineLength), paint);
      trans -= changeRate;

      // Guide text
      TextPainter textPainter = TextPainter(
          text: TextSpan(
              text: "-" + (i + 1).toString(),
              style: TextStyle(color: Colors.black, fontSize: guideTextSize)),
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr)
        ..layout(maxWidth: size.width - 12.0 - 12.0);
      textPainter.paint(
          canvas,
          Offset(
              0 + trans - 2 + changeRate, (height / 2) - guideLineLength + 10));
    }

    double transHeight = height / 2;
    double heightChangeRate = transHeight / n;
    transHeight += heightChangeRate;
    //Guide lines down
    for (var i = 0; i < n; i++) {
      canvas.drawLine(Offset((width / 2) - guideLineLength, transHeight),
          Offset((width / 2) + guideLineLength, transHeight), paint);
      transHeight += heightChangeRate;

      // Guide text
      TextPainter textPainter = TextPainter(
          text: TextSpan(
              text: "-" + (i + 1).toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: guideTextSize,
              )),
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr)
        ..layout(maxWidth: size.width - 12.0 - 12.0);
      textPainter.paint(
          canvas, Offset((width / 2) - 13, transHeight - 2 - heightChangeRate));
    }

    transHeight = height / 2;
    transHeight -= heightChangeRate;
    //Guide lines up
    for (var i = 0; i < n; i++) {
      canvas.drawLine(Offset((width / 2) - guideLineLength, transHeight),
          Offset((width / 2) + guideLineLength, transHeight), paint);
      transHeight -= heightChangeRate;

      // Guide text
      TextPainter textPainter = TextPainter(
          text: TextSpan(
              text: (i + 1).toString(),
              style: TextStyle(color: Colors.black, fontSize: guideTextSize)),
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl)
        ..layout(maxWidth: size.width - 12.0 - 12.0);
      textPainter.paint(
          canvas, Offset((width / 2) - 13, transHeight - 2 + heightChangeRate));

      canvas.drawCircle(
          Offset((width / 2) + (changeRate * x),
              (height / 2) + (heightChangeRate * (y * -1))),
          2,
          paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
