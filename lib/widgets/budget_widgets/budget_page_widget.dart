import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/repositories/transaction_repository.dart';
import 'package:registration/widgets/budget_widgets/budget_list/transaction_list_json.dart';
import 'package:registration/widgets/budget_widgets/month_view.dart';
import 'package:registration/widgets/budget_widgets/row/transaction_row_tojson.dart';

import '../../../resources/theme/custom_theme.dart';
import '../../blocs/trancation/trancation_bloc.dart';
import '../../models/user_model.dart';

class BaseBudgetWidget extends StatelessWidget {
  final String title;
  // final List<TransactionModel> list;
  final String mounth;
  final bool ready;
  BaseBudgetWidget(
      {Key? key,
      required this.title,
      this.mounth = 'july',
      required this.ready})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
             
             const MonthView(),
              Text(title, style: CustomTheme.lightTheme.textTheme.headline1),
              StreamBuilder<Object>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(thisUser.username)
                      .collection('transactions')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<dynamic> snapshot) {
                    return Text(
                        TransactionRepository()
                            .resualtMoney(snap: snapshot,ready: ready)
                            .toString(),
                        style: CustomTheme.lightTheme.textTheme.headline1
                            ?.copyWith(color: Colors.white, fontSize: 32));
                  }),
            ])),
        TransactionRowWidget(
          ready: ready,
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: BlocProvider(
              create: (context) => TrancationBloc(repository: TransactionRepository()),
              child: TransactionListWidget(
                ready: ready,
              ),
            )),
      ],
    );
  }
}
