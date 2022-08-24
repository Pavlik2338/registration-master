import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../resources/theme/custom_theme.dart';

Widget leftTitleWidgets(double value, TitleMeta meta) {
  String text;
  if (value > 0 || value <= 5) {
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
           default:
        return Container();
    }
  } else if (value > 5 || value <= 11) {
    switch (value.toInt()) {
      case 6:
        text = '60K';
        break;
      case 8:
        text = '80k';
        break;
      case 11:
        text = '110k';
        break;
        default:
        return Container();
    }
  } else if (value > 11 || value <= 17) {
    switch (value.toInt()) {
      case 11:
        text = '110K';
        break;
      case 15:
        text = '150k';
        break;
      case 17:
        text = '170k';
        break;
       default:
        return Container();
    }
  } else if (value > 17 || value <= 25) {
    switch (value.toInt()) {
      case 17:
        text = '170K';
        break;
      case 20:
        text = '200k';
        break;
      case 25:
        text = '250k';
        break;
        default:
        return Container();
    }
  } else if (value > 25 || value <= 50) {
    switch (value.toInt()) {
      case 25:
        text = '250K';
        break;
      case 35:
        text = '350k';
        break;
      case 45:
        text = '450k';
        break;
      case 50:
        text = '500k';
        break;
      default:
        return Container();
    }
  }else{
    return Container();
  }

  return Text(text,
      style: CustomTheme.lightTheme.textTheme.headline3,
      textAlign: TextAlign.left);
}
