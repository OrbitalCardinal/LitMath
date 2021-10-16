import 'package:flutter/material.dart';

class Slide1Screen extends StatelessWidget {
  const Slide1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Image(
            width: 250,
            image: AssetImage('assets/imgs/Slide1.png'),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "¡Aprende con LitMath!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Aprender nunca había sido tan divertido. LitMath cuenta con actividades diseñadas para mejorar el pensamiento matemático de los niños.",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
