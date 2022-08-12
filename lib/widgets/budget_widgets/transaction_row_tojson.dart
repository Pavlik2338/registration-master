import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/models/trancation_model.dart';
import 'package:registration/repositories/login_repository.dart';
import 'package:registration/widgets/budget_widgets/transaction_row.dart';

import '../../models/user_model.dart';

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
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(thisUser.username)
            .collection('transactions')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return const Text("Empty");
          }

          return ListView(
            padding: EdgeInsets.only(top: 24.h, bottom: 18.h),
            scrollDirection: Axis.horizontal,
            children: [
              if (widget.ready)
                for (var elem in snapshot.data!.docs
                    .map((DocumentSnapshot doc) =>
                        doc.data()! as Map<String, dynamic>)
                    .where((elem) => elem['ready'] == true))
                  TransactionRowElem(
                      transaction: TransactionModel.fromJson(elem))
              else
                for (var elem in snapshot.data!.docs.map(
                    (DocumentSnapshot doc) =>
                        doc.data()! as Map<String, dynamic>))
                  TransactionRowElem(
                      transaction: TransactionModel.fromJson(elem))
            ],
          );
        },
      ),
    );
  }
}
