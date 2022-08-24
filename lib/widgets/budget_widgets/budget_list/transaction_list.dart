import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:registration/widgets/budget_widgets/dialog_window.dart';
import '../../../blocs/trancation/trancation_bloc.dart';
import '../../../models/trancation_model.dart';
import '../../../resources/constants/enums.dart';
import '../../../resources/theme/custom_theme.dart';

class TransactionListElem extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionListElem({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = transaction.getColorTitle();
    return Container(
      margin: EdgeInsets.only(top: 11.h),
      child: Row(children: [
        BlocListener<TrancationBloc, TrancationState>(
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
                    .read<TrancationBloc>()
                    .add(ChangeReadinessEvent(transaction: transaction));
              },
              child: transaction.ready
                  ? SizedBox(
                      height: 24.h,
                      width: 24.w,
                      child: Image.asset('assets/images/ok.png'),
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
            Text(DateFormat('yyyy-MM-dd').format(transaction.date),
                style: CustomTheme.lightTheme.textTheme.bodyText2
                    ?.copyWith(fontSize: 12))
          ],
        ),
        const Spacer(),
        Text(
          transaction.value.toString(),
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
    );
  }
}
