import 'package:flutter/material.dart';
import 'package:litmath/screens/selection_screen.dart';
import 'package:litmath/providers/user_provider.dart';

class NewFinishedActivityDialog extends StatelessWidget {
  NewFinishedActivityDialog({
    required this.score,
    required this.totalRounds,
    required this.activityName,
    Key? key,
  }) : super(key: key);

  int score;
  final int totalRounds;
  String activityName;
  @override
  Widget build(BuildContext context) {
    double calif = (score * 100) / (totalRounds + 1);
    UserProvider().sendReport(activityName,calif.toString());
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
