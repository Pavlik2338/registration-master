import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:registration/models/user_model.dart';
import 'package:registration/pages/edit_transaction.dart';

import '../../models/trancation_model.dart';

class ChooseDialog {
  final BuildContext context;
  final TransactionModel transaction;
  ChooseDialog({required this.context, required this.transaction});
  void showSimpleDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Choose an Option'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditTransaction(
                            id: transaction.id!,
                            date: transaction.date,
                            value: transaction.value,
                            type: transaction.type,
                            category: transaction.category,
                            description: transaction.description,

                          )));
                },
                child: const Text('Change'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(thisUser.username)
                      .collection('transactions')
                      .doc(transaction.id)
                      .delete();
                },
                child: const Text('Delete'),
              ),
            ],
          );
        });
  }
}
