//ACTIVIDAD COMPLETAR PATRONES\
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:deep_collection/deep_collection.dart';

class DragAndDropScreen extends StatefulWidget {
  const DragAndDropScreen({Key? key}) : super(key: key);
  static const routeName = "/DragAndDropScreen";

  @override
  _DragAndDropScreenState createState() => _DragAndDropScreenState();
}

class _DragAndDropScreenState extends State<DragAndDropScreen> {
  final Map<String, bool> score = {'': true};

  final Map choices = {};

  Map<Image, int> images = {
    Image.asset('assets/imgs/corazon.png'): 0,
    Image.asset('assets/imgs/diamante.png'): 1
  };
  List<String> activity = [
    'assets/imgs/corazon.png',
    'assets/imgs/diamante.png',
    'assets/imgs/corazon.png',
    'assets/imgs/diamante.png'
  ];
  List<int> answer = [0, 1, 0, 1, 0, 1];
  List<int> userAnswer = [0, 1, 0, 1, 0, 1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 40.0),
      height: 50.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: activity.length,
        itemBuilder: (context, int index) {
          return new Padding(
            padding: new EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
            child: new Card(
              shadowColor: Colors.grey,
              shape: new RoundedRectangleBorder(
                  //borderRadius: new BorderRadius.circular(16.0),
                  ),
              child: new Row(
                children: <Widget>[
                  new Image.asset(activity[index],
                      fit: BoxFit.fill, height: 40),
                  //DragTarget(builder: builder)

                  SizedBox(
                    width: 42.0,
                    height: 42.0,
                    child: const DecoratedBox(
                      decoration: const BoxDecoration(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ));
  }
}
