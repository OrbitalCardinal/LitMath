import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:litmath/screens/kinder_screen.dart';

class PatternsScreen extends StatefulWidget {
  const PatternsScreen({Key? key}) : super(key: key);
  static const routeName = "/patterns";

  @override
  _PatternsScreenState createState() => _PatternsScreenState();
}

class _PatternsScreenState extends State<PatternsScreen> {
  List<String> prompt = [
    "assets/imgs/patrones_screen_assets/patron_1.png",
    "assets/imgs/patrones_screen_assets/patron_2.png",
    "assets/imgs/patrones_screen_assets/patron_3.png",
    "assets/imgs/patrones_screen_assets/patron_4.png",
    "assets/imgs/patrones_screen_assets/patron_5.png"
  ];

  List<String> answer = [
    "assets/imgs/patrones_screen_assets/patron_1_correcto.png",
    "assets/imgs/patrones_screen_assets/patron_2_correcto.png",
    "assets/imgs/patrones_screen_assets/patron_3_correcto.png",
    "assets/imgs/patrones_screen_assets/patron_4_correcto.png",
    "assets/imgs/patrones_screen_assets/patron_5_correcto.png"
  ];

  List<String> option2 = [
    "assets/imgs/patrones_screen_assets/patron_1_opcion_2.png",
    "assets/imgs/patrones_screen_assets/patron_2_opcion_2.png",
    "assets/imgs/patrones_screen_assets/patron_3_opcion_2.png",
    "assets/imgs/patrones_screen_assets/patron_4_opcion_2.png",
    "assets/imgs/patrones_screen_assets/patron_5_opcion_2.png"
  ];

  List<String> option3 = [
    "assets/imgs/patrones_screen_assets/patron_1_opcion_3.png",
    "assets/imgs/patrones_screen_assets/patron_2_opcion_3.png",
    "assets/imgs/patrones_screen_assets/patron_3_opcion_3.png",
    "assets/imgs/patrones_screen_assets/patron_4_opcion_3.png",
    "assets/imgs/patrones_screen_assets/patron_5_opcion_3.png"
  ];

  int exercise = 0;
  int score = 0;
  int round = 0;

  @override
  Widget build(BuildContext context) {
    List<String> shuffleOptions = [
      answer[exercise],
      option2[exercise],
      option3[exercise]
    ];
    shuffleOptions.shuffle();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Patrones"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Completa el patrón"),
            const SizedBox(
              height: 30,
            ),
            Image(
              image: AssetImage(prompt[exercise]),
            ),
            const SizedBox(
              height: 30,
            ),
            ...shuffleOptions.map((option) {
              return AnswerButton(
                  imageUrl: option,
                  onPress: () {
                    if (option == answer[exercise]) {
                      setState(() {
                        score += 1;
                      });
                    }
                    if (round == 4) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: const Text("La actividad a finalizado"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        KinderScreen.routeName);
                                  },
                                  child: const Text("Ok"),
                                )
                              ],
                            );
                          });
                    } else {
                      setState(() {
                        round += 1;
                        exercise += 1;
                      });
                    }
                  });
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class AnswerButton extends StatelessWidget {
  const AnswerButton({Key? key, required this.imageUrl, required this.onPress})
      : super(key: key);

  final String imageUrl;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          onPress();
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 3,
        ),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: 80,
          height: 60,
          child: Image(
            image: AssetImage(
              imageUrl,
            ),
          ),
        ),
      ),
    );
  }
}
