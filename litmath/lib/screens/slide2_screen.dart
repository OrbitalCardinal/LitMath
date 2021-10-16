import 'package:flutter/material.dart';

class Slide2Screen extends StatelessWidget {
  const Slide2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Image(
            width: 250,
            image: AssetImage('assets/imgs/Slide2.png'),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "¡Monitorea su desempeño!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Con las métricas de desempeño de LitMath es fácil observar las fortalezas y debilidades de los niños. Además cuenta con un servicio de reportes de  automáticos para que siempre estés informado.",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
