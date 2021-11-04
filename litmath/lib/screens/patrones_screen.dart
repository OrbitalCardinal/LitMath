import 'package:flutter/material.dart';

class PatronesScreen extends StatefulWidget {
  const PatronesScreen({Key? key}) : super(key: key);
  static const routeName = "/PatronesScreen";

  @override
  _PatronesScreenState createState() => _PatronesScreenState();
}

class _PatronesScreenState extends State<PatronesScreen> {
  @override
  Widget build(BuildContext context) {
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
        width: 30,
        height: 30,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
      )
    };

    List<int> shapeList = [0, 1, 0, 1, 2, 2];

    List<int> answer1 = [0,1];
    List<int> answer2 = [1,0];

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
              children: shapeList.map(
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
Text('Que figuras completan la serie?'),
const SizedBox(
              height: 50,
            ),
            Card(
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
              answer1.map(
                (item) {
                  return GestureDetector(
                    onTap: () {
                setState(() {
                  // Toggle light when tapped.
                  //_lightIsOn = !_lightIsOn;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Respuesta correcta')));
                });
              },
                    child: 
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: itemsMap[item] ?? Container(),),
                    
                  );
                },
              ).toList(),
            ),

            ),
            
            Card(
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
              answer2.map(
                (item) {
                  return GestureDetector(
                    onTap: () {
                setState(() {
                  // Toggle light when tapped.
                  //_lightIsOn = !_lightIsOn;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Respuesta incorrecta')));
                });
              },
                    child: 
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: itemsMap[item] ?? Container(),),
                    
                  );
                },
              ).toList(),
            ),

            ),
            
            
          ],
        ),
      ),
    );
  }
}
