import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:registration/resources/validators/scale_of_grafic.dart';


import '../../resources/constants/colors.dart';


Widget leftTitleWidgets(double value, TitleMeta meta) {
  String text;

  switch (value.toInt()) {
    case 0:
      text = '0';
      break;
    case 1:
      text = '$scaleTitle K';
      break;
    case 3:
      text = '${3 *scaleTitle}K';
      break;
    case 5:
      text = '${5 * scaleTitle}k';
      break;
    default:
      return Container();
  }
  return Text(text,
      style: TextStyle(
          color: AppColor.black.withOpacity(0.5),
          fontWeight: FontWeight.w400,
          fontSize: 12,
          fontFamily: "Nunito"),
      textAlign: TextAlign.left);
}
