import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget bottomTitleWidgets(double value, TitleMeta meta) {

  String text;
  switch (value.toInt()) {
case 0:
      text = "Jan";
      break;
    case 1:
      text = "Feb";
      break;
    case 2:
      text = "Mar";
      break;
    case 3:
      text = "Apr";
      break;
    case 4:
      text = "May";
      break;
    case 5:
      text = "Jun";
      break;
    case 6:
      text = "Jul";
      break;
    case 7:
      text = "Aug";
      break;
    case 8:
      text = "Sep";
      break;
    case 9:
      text = "Oct";
      break;
    case 10:
      text = "Nov";
      break;
    case 11:
      text = "Dec";
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
