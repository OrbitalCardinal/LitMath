import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Slide2Screen extends StatelessWidget {
  const Slide2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    if (mediaQueryData.orientation == Orientation.portrait) {
    return Container(
      padding: EdgeInsets.all(8.4.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Image(
            width: 32.5.w,
            image: AssetImage('assets/imgs/Slide2.png'),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Text(
            "¡Monitorea su desempeño!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.5.sp),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Text(
            "Con las métricas de desempeño de LitMath es fácil observar las fortalezas y debilidades de los niños. Además cuenta con un servicio de reportes de  automáticos para que siempre estés informado.",
            style: TextStyle(
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    ); 
    }
    {
      return Container(
      padding: EdgeInsets.all(8.4.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Image(
            width: 27.w,
            image: AssetImage('assets/imgs/Slide2.png'),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Text(
            "¡Monitorea su desempeño!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.5.sp),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Text(
            "Con las métricas de desempeño de LitMath es fácil observar las fortalezas y debilidades de los niños. Además cuenta con un servicio de reportes de  automáticos para que siempre estés informado.",
            style: TextStyle(
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    ); 
    }
  }
}
