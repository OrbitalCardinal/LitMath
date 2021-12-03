import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class ScholarshipCard extends StatelessWidget {
  String imageUrl;
  String title;
  Color color;
  String routeName;
  ScholarshipCard(
      {required this.imageUrl,
      required this.title,
      required this.color,
      required this.routeName,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Stack(
        children: [
          Positioned(
            left: 8.w,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(routeName);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: color),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 75.w,
                //width: 75.w,
                height: 13.h,
                //width: 300,
                //height: 100,
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 15.sp, color: color),
                  ),
                ),
              ),
            ),
          ),
          Image(
            image: AssetImage(imageUrl),
            width: 13.h,
            height: 13.h,
          ),
        ],
      ),
    );
  }
}
