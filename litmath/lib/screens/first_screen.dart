import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  static const routeName = "/FirstScreen";
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Primera Pantalla"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Ir a la Segunda Pantalla"),
            ElevatedButton(
              onPressed: () =>
                  {Navigator.of(context).pushReplacementNamed("/SecondScreen")},
              child: const Text("Go"),
            )
          ],
        ),
      ),
    );
  }
}
