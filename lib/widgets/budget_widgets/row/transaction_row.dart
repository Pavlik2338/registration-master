import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/widgets/budget_widgets/backgroud/color_of_card.dart';
import '../../../models/trancation_model.dart';

class TransactionRowElem extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionRowElem({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorMajor = transaction.getColorMajor();
    final colorCircle = transaction.getColorCircle();
    final colorMinor = transaction.getColorMinor();
    return Container(
      margin: EdgeInsets.only(right: 9.h),
      padding: EdgeInsets.only(left: 16.w),
      child: Stack(
        children: [
          ColorOfCard(
            colorMinor: colorMinor,
            colorMajor: colorMajor,
            colorCircle: colorCircle,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.toString(),
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: colorCircle),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text("₽${transaction.value.toString()}",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: colorCircle)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
