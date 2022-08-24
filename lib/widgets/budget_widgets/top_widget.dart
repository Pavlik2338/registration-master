import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/blocs/trancation/trancation_bloc.dart';

import '../../repositories/transaction_repository.dart';
import '../../resources/theme/custom_theme.dart';
import 'month_view.dart';

class TopWidget extends StatelessWidget {
  final String title;
  final bool ready;
  TopWidget({required this.ready, required this.title});

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
          const MonthView(),
          Text(title, style: CustomTheme.lightTheme.textTheme.headline1),
          BlocBuilder<TrancationBloc, TrancationState>(
            builder: (context, state) {
              if (state is FetchState) {
                return Text(
                  TransactionRepository()
                      .resualtMoney2(list: state.transactions, ready: ready)
                      .toString(),
                  style: CustomTheme.lightTheme.textTheme.headline1
                      ?.copyWith(color: Colors.white, fontSize: 32),
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
