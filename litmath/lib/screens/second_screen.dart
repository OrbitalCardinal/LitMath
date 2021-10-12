import 'package:flutter/material.dart';
import 'package:litmath/providers/second_screen_provider.dart';
// Provider

class SecondScreen extends StatefulWidget {
  // Nombre de la ruta
  static const routeName = "/SecondScreen";
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<SecondScreen> {
  // Variables de la pantalla
  int myNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Segunda pantalla"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Ir a la Primera Pantalla"),
            ElevatedButton(
              onPressed: () =>
                  {Navigator.of(context).pushReplacementNamed("/FirstScreen")},
              child: const Text("Go"),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(myNumber.toString()),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  myNumber = SecondScreenProvider().sumOne(myNumber);
                });
              },
              child: Text(
                "Sumar uno",
              ),
            )
          ],
        ),
      ),
    );
  }
}
