
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/resources/localization/english_localization.dart';

import 'package:registration/widgets/budget_widgets/row/transaction_row.dart';

import '../../../blocs/trancation/trancation_bloc.dart';


class TransactionRowWidget extends StatefulWidget {
  final bool ready;
  const TransactionRowWidget({Key? key, required this.ready}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TransactionRowWidgetState();
}

class TransactionRowWidgetState extends State<TransactionRowWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 145.h,
        child: BlocBuilder<TransactionBloc, TransactionState>(
          builder: (context, state) {
            if (state is FetchLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is FetchState) {
              return ListView(
                padding: EdgeInsets.only(top: 24.h, bottom: 18.h),
                scrollDirection: Axis.horizontal,
                children: [
                  if (widget.ready)
                    for (var elem in state.transactions
                        .where((elem) => elem.ready == true))
                      TransactionRowElem(transaction: elem)
                  else
                    for (var elem in state.transactions)
                      TransactionRowElem(transaction: elem)
                ],
              );
            }
            return const Text(Localization.haventTransaction);
          },
        ));
  }
}
