import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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

  Future<Stream?> foundTransaction({
    required int month,
    required int year,
  }) async {
    DateTime date = DateTime(year, month, 1);
    bool success = false;
    try {
      final allDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(thisUser.username)
          .collection('transactions')
          .where('date', isGreaterThanOrEqualTo: date)
          .snapshots();
      success = true;
      return allDoc;
    } on FirebaseAuthException catch (e) {
      success = false;
      return null;
    }
  }

  Future<bool> editTransaction(
      {required String id,
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
          .doc(id);

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

  double resualtMoney(
      {required AsyncSnapshot<dynamic> snap, required bool ready}) {
    double sum = 0;
    if (ready) {
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
    } else {
      for (var elem in snap.data!.docs
          .map((DocumentSnapshot doc) => doc.data()! as Map<String, dynamic>)) {
        var transaction = TransactionModel.fromJson(elem);
        if (transaction.type == TransactionType.profit) {
          sum += transaction.value;
        } else {
          sum -= transaction.value;
        }
      }
    }
    return sum;
  }

  Future<bool> changeReadiness({required TransactionModel transaction}) async {
    try {
      transaction.ready = !transaction.ready;
      final docChange = FirebaseFirestore.instance
          .collection('users')
          .doc(thisUser.username)
          .collection('transactions')
          .doc(transaction.id);
      docChange.set(transaction.toJson());
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

  Future<void> delete({required TransactionModel transaction}) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(thisUser.username)
        .collection('transactions')
        .doc(transaction.id)
        .delete();
  }
}
