import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:registration/models/transaction_category.dart';
import 'package:registration/models/user_model.dart';
import 'package:registration/repositories/login_repository.dart';
import 'dart:async';
import '../models/trancation_model.dart';
import '../resources/constants/enums.dart';

class TransactionRepository {
  Future<bool> addTransaction(
      {String? id,
      required String userName,
      required TransactionType type,
      required bool ready,
      required DateTime date,
      required TransactionCategory category,
      required double value,
      String? description}) async {
    try {
      final docTransaction = FirebaseFirestore.instance
          .collection('users')
          .doc(thisUser.username)
          .collection('transactions')
          .doc();
      String id = docTransaction.id;
      final transToJson = TransactionModel(
              id: id,
              type: type,
              ready: ready,
              date: date,
              category: category,
              value: value,
              description: description)
          .toJson();

      docTransaction.set(transToJson);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
  }

  double resualtMoney({required AsyncSnapshot<dynamic> snap}) {
    double sum = 0;
    for (var elem in snap.data!.docs
        .map((DocumentSnapshot doc) => doc.data()! as Map<String, dynamic>)
        .where((elem) => elem['ready'] == true)) {
      var transaction = TransactionModel.fromJson(elem);
      if (transaction.type == TransactionType.profit) {
        sum += transaction.value;
      } else {
        sum -= transaction.value;
      }
    }
    return sum;
  }
}
