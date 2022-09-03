import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:registration/resources/constants/category_color.dart';
import 'package:registration/resources/constants/path_images.dart';
import 'package:registration/widgets/budget_widgets/dialog_window.dart';
import '../../../blocs/trancation/trancation_bloc.dart';
import '../../../models/trancation_model.dart';
import '../../../resources/constants/enums.dart';
import '../../../resources/theme/custom_theme.dart';
import '../description_dialog.dart';

class TransactionListElem extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionListElem({Key? key, required this.transaction})
      : super(key: key);
  String sumWithMinus(double value, TransactionType type) {
    if (type == TransactionType.loss) {
      return "-$value";
    } else {
      return "+$value";
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = CategoryColor(category: transaction.category).getColorTitle();
    return Container(
      margin: EdgeInsets.only(top: 11.h),
      child: GestureDetector(
        onDoubleTap: () {
          DiscriptionDialog(contexta: context, transaction: transaction)
              .dialog();
        },
        child: Row(children: [
          BlocListener<TransactionBloc, TransactionState>(
            listener: (context, state) {},
            child: Container(
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: InkWell(
                onTap: () {
                  context
                      .read<TransactionBloc>()
                      .add(ChangeReadinessEvent(transaction: transaction));
                },
                child: transaction.ready
                    ? SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: Image.asset(PathImages.ok),
                      )
                    : Container(),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.toString(),
                style: CustomTheme.lightTheme.textTheme.bodyText2
                    ?.copyWith(color: color),
              ),
              Text(DateFormat('d MMMM y').format(transaction.date),
                  style: CustomTheme.lightTheme.textTheme.bodyText2
                      ?.copyWith(fontSize: 12))
            ],
          ),
          const Spacer(),
          Text(
            sumWithMinus(transaction.value, transaction.type),
            style: TextStyle(
                color: transaction.type == TransactionType.profit
                    ? Colors.green
                    : Colors.red),
          ),
          SizedBox(width: 29.w),
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_right_rounded),
            splashRadius: 5,
            color: color,
            onPressed: () {
              ChooseDialog(contexta: context, transaction: transaction)
                  .showSimpleDialog();
            },
          ),
        ]),
      ),
    );
  }
}
