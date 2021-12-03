import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class Slide1Screen extends StatelessWidget {
  const Slide1Screen({Key? key}) : super(key: key);
  
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
            //width: 250,
            image: AssetImage('assets/imgs/Slide1.png'),
          ),
          SizedBox(
            height: 1.5.h,
            //height: 20,
          ),
          Text(
            "¡Aprende con LitMath!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.5.sp),
          ),
          SizedBox(
            height: 1.5.h,
            //height: 20,
          ),
          Text(
            "Aprender nunca había sido tan divertido. LitMath cuenta con actividades diseñadas para mejorar el pensamiento matemático de los niños.",
            style: TextStyle(
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
    }
    return
    Container(
      padding: EdgeInsets.all(8.4.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Image(
            width: 27.w,
            //width: 250,
            image: AssetImage('assets/imgs/Slide1.png'),
          ),
          SizedBox(
            height: 1.5.h,
            //height: 20,
          ),
          Text(
            "¡Aprende con LitMath!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.5.sp),
          ),
          SizedBox(
            height: 1.5.h,
            //height: 20,
          ),
          Text(
            "Aprender nunca había sido tan divertido. LitMath cuenta con actividades diseñadas para mejorar el pensamiento matemático de los niños.",
            style: TextStyle(
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }
}
