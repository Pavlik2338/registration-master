import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:registration/resources/localization/english_localization.dart';

Widget bottomTitleWidgets(double value, TitleMeta meta) {

  String text;
  switch (value.toInt()) {
case 0:
      text = Localization.jan;
      break;
    case 1:
      text = Localization.feb;
      break;
    case 2:
      text =Localization.mar;
      break;
    case 3:
      text = Localization.apr;
      break;
    case 4:
      text =Localization.may;
      break;
    case 5:
      text = Localization.jun;
      break;
    case 6:
      text =Localization.jul;
      break;
    case 7:
      text =Localization.aug;
      break;
    case 8:
      text = Localization.sep;
      break;
    case 9:
      text = Localization.oct;
      break;
    case 10:
      text = Localization.nov;
      break;
    case 11:
      text = Localization.dec;
      break;
      default:
      return Container();
  }
  
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: Text(text),
    );
}
