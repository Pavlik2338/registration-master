import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/widgets/budget_widgets/background.dart';

class ColorOfCard extends StatelessWidget {
  final Color colorMinor;
  final Color colorMajor;
  final Color colorCircle;
  ColorOfCard(
      {super.key,
      required this.colorMinor,
      required this.colorMajor,
      required this.colorCircle});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            colorMinor,
            colorMajor,
          ]),
        ),
        height: 103.h,
        width: 153.w,
        child: CustomPaint(
          painter: CirclePainter(colorCircle),
        ),
      ),
    );
  }
}
