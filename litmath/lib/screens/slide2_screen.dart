import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Slide2Screen extends StatelessWidget {
  const Slide2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Image(
            width: 55.w,
            image: AssetImage('assets/imgs/Slide2.png'),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Text(
            "¡Monitorea su desempeño!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            "Con las métricas de desempeño de LitMath es fácil observar las fortalezas y debilidades de los niños. Además cuenta con un servicio de reportes de  automáticos para que siempre estés informado.",
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
