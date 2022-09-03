import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/widgets/budget_widgets/backgroud/color_of_card.dart';
import 'package:registration/widgets/budget_widgets/description_dialog.dart';
import '../../../models/trancation_model.dart';
import '../../../resources/constants/category_color.dart';
import '../../../resources/constants/enums.dart';

class TransactionRowElem extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionRowElem({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorMajor = CategoryColor(category: transaction.category).getColorMajor();
    final colorCircle = CategoryColor(category: transaction.category).getColorCircle();
    final colorMinor = CategoryColor(category: transaction.category).getColorMinor();
     String sumWithMinusOnCard(double value,TransactionType type) {
    if (type == TransactionType.loss) {
      return "₽-$value";
    } else {
      return "₽$value";
    }
  }

    return Container(
      margin: EdgeInsets.only(right: 9.h),
      padding: EdgeInsets.only(left: 16.w),
      child: GestureDetector(
        onTap: () {
          DiscriptionDialog(contexta: context, transaction: transaction).dialog();
        },
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
                    child: Text(sumWithMinusOnCard(transaction.value,transaction.type),
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
      ),
    );
  }
}
