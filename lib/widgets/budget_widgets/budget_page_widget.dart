
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/repositories/transaction_repository.dart';
import 'package:registration/resources/constants/enums.dart';
import 'package:registration/widgets/budget_widgets/budget_list/transaction_list_json.dart';

import 'package:registration/widgets/budget_widgets/row/transaction_row_tojson.dart';
import 'package:registration/widgets/top_widget/top_widget.dart';


import '../../blocs/trancation/trancation_bloc.dart';


class BaseBudgetWidget extends StatelessWidget {
  final String title;
  // final List<TransactionModel> list;

  final bool ready;
  BaseBudgetWidget(
      {Key? key,
      required this.title,
  
      required this.ready})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionBloc(repository: TransactionRepository())
        ..add(const FetchEvent()),
      child: Column(
        children: [
          TopWidget(
            ready: ready,
            title: title,
            topWidgetType: TopWidgetType.month,
          ),
          TransactionRowWidget(
            ready: ready,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: TransactionListWidget(
              ready: ready,
            ),
          ),
        ],
      ),
    );
  }
}
