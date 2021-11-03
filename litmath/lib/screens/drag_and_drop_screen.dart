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
    Map<int, int> options = {0: 4, 1: 5};
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
              children: userAnswer.asMap().entries.map(
                (entry) {
                  int item = entry.value;
                  int index = entry.key;
                  if (item != 2) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: itemsMap[item] ?? Container(),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DragTarget<List>(
                        builder: (context, candidateItems, rejectedItems) {
                          return Container(
                            width: 50,
                            height: 50,
                            color: Colors.red,
                          );
                        },
                        onAccept: (data) {
                          print(data[0]);
                          setState(() {
                            userAnswer = [0, 1, 0, 1, 0, 0];
                          });
                          print(userAnswer);
                        },
                        onWillAccept: (data) {
                          return true;
                        },
                      ),
                      // child: itemsMap[item] ?? Container(),
                    );
                  }
                },
              ).toList(),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: options.entries.map((entry) {
                int index = entry.key;
                int item = entry.value;
                return Draggable<List>(
                  data: [item, index],
                  child: itemsMap[index] ?? Container(),
                  feedback: itemsMap[index] ?? Container(),
                  childWhenDragging: const SizedBox(
                    width: itemsSize,
                    height: itemsSize,
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDragTarget(item) {
    return DragTarget<int>(
      builder: (BuildContext context, List<int?> incoming, List rejected) {
        return Container(
          width: 30,
          height: 30,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
        );
      },
    );
  }
}
