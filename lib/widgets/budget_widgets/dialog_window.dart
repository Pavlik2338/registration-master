import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/models/user_model.dart';
import 'package:registration/pages/edit_transaction.dart';
import 'package:registration/repositories/transaction_repository.dart';

import '../../blocs/trancation/trancation_bloc.dart';
import '../../models/trancation_model.dart';

class ChooseDialog {
  final BuildContext contexta;
  final TransactionModel transaction;
  ChooseDialog({required this.contexta, required this.transaction});
  void showSimpleDialog() {
    showDialog(
        context: contexta,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Choose an Option'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlocProvider(
                                create: (context) => TransactionBloc(
                                    repository: TransactionRepository()),
                                child: EditTransaction(
                                  id: transaction.id!,
                                  status: transaction.ready,
                                  date: transaction.date,
                                  value: transaction.value,
                                  type: transaction.type,
                                  category: transaction.category,
                                  description: transaction.description,
                                ),
                              )));
                },
                child: const Text('Change'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  contexta
                      .read<TransactionBloc>()
                      .add(DeleteTransactionEvent(transaction: transaction));
                  Navigator.pop(context);
                },
                child: const Text('Delete'),
              ),
            ],
          );
        });
  }
}
