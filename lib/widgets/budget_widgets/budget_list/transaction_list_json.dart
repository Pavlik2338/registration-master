import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                children: [
                  if (widget.ready)
                    for (var elem in snapshot.data!.docs
                        .map((DocumentSnapshot doc) =>
                            doc.data()! as Map<String, dynamic>)
                        .where((elem) => elem['ready'] == true))
                      TransactionListElem(
                          transaction: TransactionModel.fromJson(elem))
                  else
                    for (var elem in snapshot.data!.docs.map(
                        (DocumentSnapshot doc) =>
                            doc.data()! as Map<String, dynamic>))
                      TransactionListElem(
                          transaction: TransactionModel.fromJson(elem))
                ],
              );
            }));
  }
}
