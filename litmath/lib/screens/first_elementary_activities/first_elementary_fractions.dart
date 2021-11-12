import 'dart:math';

import 'package:flutter/material.dart';
import 'package:litmath/providers/user_provider.dart';
import 'package:litmath/widgets/finished_activity_dialog.dart';

class FirstElementaryFractions extends StatefulWidget {
  const FirstElementaryFractions({Key? key}) : super(key: key);
  static const routeName = "/FirstElementaryFractions";

  @override
  _FirstElementaryFractionsState createState() =>
      _FirstElementaryFractionsState();
}

class _FirstElementaryFractionsState extends State<FirstElementaryFractions> {
  String activity_name = 'Fracciones';
  Random rand = Random();
  int score = 0;
  int totalRounds = 9;
  int rounds = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int min = 2;
    int max = 12;
    int nFrac = rand.nextInt(max - min) + min;
    int rotation = rand.nextInt(20 - 2) + 2;
    String answer = "1 / " + nFrac.toString();
    List<String> options = [
      answer,
      "1 / " + (rand.nextInt(max - min) + min).toString(),
      "1 / " + (rand.nextInt(max - min) + min).toString(),
      "1 / " + (rand.nextInt(max - min) + min).toString()
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
            const Text("¿Que fracción representa la siguiente figura?"),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: screenWidth,
              height: 200,
              margin: const EdgeInsets.all(10),
              child: Transform.rotate(
                angle: pi * rotation,
                child: CustomPaint(
                  size: const Size(200, 100),
                  painter: CircleFraction(
                      width: screenWidth - 60, height: 200, n: nFrac),
                ),
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
                          if (option == answer) {
                            score += 1;
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
                            option.toString(),
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

class CircleFraction extends CustomPainter {
  CircleFraction({required this.width, required this.height, required this.n});
  double width;
  double height;
  int n;
  @override
  void paint(Canvas canvas, Size size) {
    // Circle
    var paint1 = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(Offset(width / 2, height / 2), height / 2, paint1);

    // Fraction

    var paint2 = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    double A = 0;
    // double n = 4;
    double finalAngle = 2 * pi;
    double rate = finalAngle / n;
    double r = height / 2;

    double x1 = width / 2;
    double y1 = height / 2;
    double x2 = 0;
    double y2 = 0;

    // Lines
    for (var i = 0; i < n; i++) {
      x2 = (r * cos(A)) + width / 2;
      y2 = (r * sin(A)) + height / 2;
      var x1y1 = Offset(x1, y1);
      var x2y2 = Offset(x2, y2);
      canvas.drawLine(x1y1, x2y2, paint2);

      A += rate;
    }

    //Fraction
    var triangleOffsets = [
      Offset(width / 2, height / 2),
      Offset(x2, y2),
      Offset(r + width / 2, r),
    ];

    var paintPath = Paint()
      ..color = const Color(0x550000ff)
      ..style = PaintingStyle.fill;

    var oval =
        Rect.fromCircle(center: Offset(width / 2, height / 2), radius: r);
    var path = Path()
      ..addPolygon(triangleOffsets, true)
      ..addArc(oval, 0, -pi / n * 2);
    canvas.drawPath(path, paintPath);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
