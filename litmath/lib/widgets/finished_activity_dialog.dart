import 'package:flutter/material.dart';
import 'package:litmath/screens/selection_screen.dart';

class FinishedActivityDialog extends StatelessWidget {
  FinishedActivityDialog({
    required this.score,
    required this.totalRounds,
    Key? key,
  }) : super(key: key);

  int score;
  final int totalRounds;

  @override
  Widget build(BuildContext context) {
    double calif = (score * 100) / (totalRounds + 1);
    return AlertDialog(
      content: Text("La actividad a finalizado\nCalificación: " +
          calif.toStringAsFixed(2)),
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
