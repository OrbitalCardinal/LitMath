import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class Slide1Screen extends StatelessWidget {
  const Slide1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Image(
            width: 55.w,
            image: AssetImage('assets/imgs/Slide1.png'),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Text(
            "¡Aprende con LitMath!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            "Aprender nunca había sido tan divertido. LitMath cuenta con actividades diseñadas para mejorar el pensamiento matemático de los niños.",
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
