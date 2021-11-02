//ACTIVIDAD COMPLETAR PATRONES\
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/foundation.dart';

class DragAndDropScreen extends StatefulWidget {
  const DragAndDropScreen({Key? key}) : super(key: key);
  static const routeName = "/DragAndDropScreen";

  @override
  _DragAndDropScreenState createState() => _DragAndDropScreenState();
}

class _DragAndDropScreenState extends State<DragAndDropScreen> {
  @override
  Widget build(BuildContext context) {
    final Map<String, bool> score = {'': true};

    final Map choices = {};

    List<String> activity = [
      'assets/imgs/corazon.png',
      'assets/imgs/diamante.png',
      'assets/imgs/corazon.png',
      'assets/imgs/diamante.png'
    ];

    List<int> answer = [0, 1, 0, 1, 0, 1];
    List<int> userAnswer = [0, 1, 0, 1, 2, 2];
    const double itemsSize = 30;
    Map<int, Widget> itemsMap = {
      0: const Image(
        image: AssetImage('assets/imgs/corazon.png'),
        width: itemsSize,
      ),
      1: const Image(
        image: AssetImage('assets/imgs/diamante.png'),
        width: itemsSize,
      ),
      2: Container(
        width: itemsSize,
        height: itemsSize,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
      )
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Nombre actividad"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: userAnswer.map(
                (item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: itemsMap[item] ?? Container(),
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
