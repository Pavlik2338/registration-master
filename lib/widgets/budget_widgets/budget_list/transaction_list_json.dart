import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/blocs/trancation/trancation_bloc.dart';
import 'package:registration/models/user_model.dart';
import 'package:registration/widgets/budget_widgets/budget_list/transaction_list.dart';
import '../../../models/trancation_model.dart';

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
        height: 360.h,
        child: BlocBuilder<TrancationBloc,TrancationState>(
          builder: (context,state){
            if(state is FetchLoadingState){
              return const Center(child: CircularProgressIndicator(),);
            }
            if(state is FetchState){
             return ListView(
                padding: EdgeInsets.only(top: 24.h, bottom: 18.h),
                children: [
                  if (widget.ready)
                    for (var elem in state.transactions
                        .where((elem) => elem.ready == true))
                      TransactionListElem(
                          transaction: elem)
                  else
                     for (var elem in state.transactions)
                    TransactionListElem(transaction: elem)
                ],
              );
            }
             return const Text("Nothing here...");
          },
        ));
        
            }
  }

