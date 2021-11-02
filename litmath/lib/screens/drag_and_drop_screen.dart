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
  final Map<String, bool> score = {'': true};

  final Map choices = {};

  Map<int, Widget> itemsMap = {
    0: Image.asset('assets/imgs/corazon.png'),
    1: Image.asset('assets/imgs/diamante.png'),
    2: Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
    )
  };

  // Map<Image, int> images = {
  //   Image.asset('assets/imgs/corazon.png'): 0,
  //   Image.asset('assets/imgs/diamante.png'): 1
  // }

  List<String> activity = [
    'assets/imgs/corazon.png',
    'assets/imgs/diamante.png',
    'assets/imgs/corazon.png',
    'assets/imgs/diamante.png'
  ];

  @override
  Widget build(BuildContext context) {
    List<int> answer = [0, 1, 0, 1, 0, 1];
    List<int> userAnswer = [0, 1, 0, 1, 2, 2];
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(top: 40.0),
      height: 30,
      child: Row(
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
    ));
  }
}
