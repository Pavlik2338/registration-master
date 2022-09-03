import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/blocs/trancation/trancation_bloc.dart';
import 'package:registration/resources/localization/english_localization.dart';
import 'package:registration/widgets/budget_widgets/budget_list/transaction_list.dart';

class TransactionListWidget extends StatefulWidget {
  final bool ready;
  const TransactionListWidget({Key? key, required this.ready})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => TransactionListWidgetState();
}

class TransactionListWidgetState extends State<TransactionListWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 400.h,
        child: BlocBuilder<TransactionBloc, TransactionState>(
          builder: (context, state) {
            if (state is FetchLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is FetchState) {
              return ListView(
                padding: EdgeInsets.only(top: 24.h, bottom: 18.h),
                children: [
                  if (widget.ready)
                    for (var elem in state.transactions
                        .where((elem) => elem.ready == true))
                      TransactionListElem(transaction: elem)
                  else
                    for (var elem in state.transactions)
                      TransactionListElem(transaction: elem)
                ],
              );
            }
            return const Text(Localization.noTransaction);
          },
        ));
  }
}
