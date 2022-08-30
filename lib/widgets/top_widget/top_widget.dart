import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/blocs/trancation/trancation_bloc.dart';
import 'package:registration/resources/constants/enums.dart';
import 'package:registration/widgets/top_widget/year_view.dart';

import '../../repositories/transaction_repository.dart';
import '../../resources/theme/custom_theme.dart';
import 'month_view.dart';

class TopWidget extends StatelessWidget {
  final String title;
  final bool ready;
  final TopWidgetType topWidgetType;
  TopWidget(
      {required this.ready, required this.title, required this.topWidgetType});
  String titleOfWidget(double sum) {
    if (sum < 0) {
      return 'Loss';
    } else {
      return 'Profit';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 144.h,
      width: 363.w,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(60.0),
            bottomLeft: Radius.circular(60.0)),
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(138, 93, 165, 1),
            Color.fromRGBO(25, 152, 207, 1),
          ],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          (topWidgetType == TopWidgetType.month)
              ? const MonthView()
              : const YearView(),
          BlocBuilder<TransactionBloc, TransactionState>(
            builder: (context, state) {
              if (state is FetchState) {
                return Column(
                  children: [
                    Text(
                        titleOfWidget(TransactionRepository().resualtMoney2(
                            list: state.transactions, ready: ready)),
                        style: CustomTheme.lightTheme.textTheme.headline1),
                    Text(
                      TransactionRepository()
                          .resualtMoney2(list: state.transactions, ready: ready)
                          .toString(),
                      style: CustomTheme.lightTheme.textTheme.headline1
                          ?.copyWith(color: Colors.white, fontSize: 32),
                    ),
                  ],
                );
              }
              return const Text("You haven't transaction on this month");
            },
          )
        ],
      ),
    );
  }
}
