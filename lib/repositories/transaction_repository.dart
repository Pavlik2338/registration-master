import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:registration/models/user_model.dart';
import 'package:registration/resources/validators/scale_of_grafic.dart';
import 'dart:async';
import '../models/month_year_model.dart';
import '../models/trancation_model.dart';
import '../resources/constants/enums.dart';

int scale = 10000;

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
    bool success = false;
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
      return success = true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return success = false;
    }
  }

  double resualtMoney2(
      {required List<TransactionModel> list, required bool ready}) {
    double sum = 0;
    if (ready) {
      for (var elem in list.where((elem) => elem.ready == true)) {
        var transaction = elem;
        if (transaction.type == TransactionType.profit) {
          sum += transaction.value;
        } else {
          sum -= transaction.value;
        }
      }
    } else {
      for (var elem in list) {
        var transaction = elem;
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
    bool success = false;
    try {
      transaction.ready = !transaction.ready;
      final docChange = FirebaseFirestore.instance
          .collection('users')
          .doc(thisUser.username)
          .collection('transactions')
          .doc(transaction.id);
      docChange.set(transaction.toJson());
      return success = true;
    } on FirebaseAuthException catch (e) {
      return success = false;
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

  bool compareDate(DateTime date, MonthYear selectedDate) {
    if (date.year == selectedDate.year) {
      if (date.month == selectedDate.month) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  bool fieldsFill(
      double? value, DateTime? date, TransactionCategory? category) {
    if (value == null && date == null && category == null) {
      return true;
    } else {
      return false;
    }
  }

  List<FlSpot> spotsGrafic({required List<TransactionModel> tranc}) {
    List<FlSpot> spots = [];
    List<double> sumOfMonth = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    double maxSum = 0;
    for (var transaction in tranc.where((element) => element.ready == true)) {
      if (transaction.type == TransactionType.profit) {
        sumOfMonth[transaction.date.month - 1] += transaction.value;
      } else {
        sumOfMonth[transaction.date.month - 1] -= transaction.value;
      }
    }
    for (int i = 0; i < 12; i++) {
      if (sumOfMonth[i] > maxSum) {
        maxSum = sumOfMonth[i];
      }
    }
    int divide = Scale().chooseScale(maxSum);
    scale = divide;
    for (int i = 0; i < 12; i++) {
      spots.add(FlSpot(
        i.toDouble(),
        sumOfMonth[i] / (divide / 10),
      ));
    }
    print(maxSum);
    return spots;
  }
}
