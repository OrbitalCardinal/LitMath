import 'package:flutter/material.dart';
import 'package:litmath/screens/selection_screen.dart';

class FinishedActivityDialog extends StatelessWidget {
  const FinishedActivityDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text("La actividad a finalizado"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                SelectionScreen.routeName, (route) => false);
          },
          child: const Text("Ok"),
        )
      ],
    );
  }
}
