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

class Shape {
  int id = 0;
  String shapeImg = '';

  Shape({required this.id, required this.shapeImg});
  
}
final shapes = [
  Shape(
    id: 0,
    shapeImg: 'assets/imgs/corazon.png',
  ),
  Shape(
    id: 1,
    shapeImg: 'assets/imgs/diamante.png',
  )
];

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
    List<int> options = [0, 1];
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
            const SizedBox(
              height: 50,
            ),
            //_buildDragTarget(),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: options.map(
                (shape) {
                  return Draggable<int>(
                    data: shape,
                    child: itemsMap[shape] ?? Container(),
                    feedback: Text(options[shape].toString()),
                    childWhenDragging: Container(
                      width: itemsSize,
                      height: itemsSize,
                      decoration: BoxDecoration(),
                    ),
                  );
                },
              ).toList(),
            )
          ],
        ),
      ),
    );
  }

  // Widget _buildDragTarget(item) {
  //   bool accepted = false;
  //   return DragTarget<int>(builder: (context, List<int?> candidateData, rejectedData){
  //     if(item == int) {
  //       return Text(item.toString());
  //     } else {
  //       return Container(
  //       width: 30,
  //       height: 30,
  //       decoration:
  //           BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
  //     );
  //     }
  //   },
  //   onWillAccept: (data) {
  //     if(data == item) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   },
  //   onAccept: (data) {
  //     accepted = true;
  //   },
  //   );
  // }


}
