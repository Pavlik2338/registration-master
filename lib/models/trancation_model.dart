import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:registration/models/transaction_category.dart';

import '../resources/constants/colors.dart';
import '../resources/constants/enums.dart';

class TransactionModel {
  String? id;
  TransactionType type;
  bool ready;
  DateTime date;
  double value;
  TransactionCategory category;
  String? description;

  TransactionModel({
    required this.id,
    required this.type,
    required this.ready,
    required this.date,
    required this.category,
    required this.value,
    this.description,
  });

  Color getColorTitle() {
    switch (category) {
      case TransactionCategory.salariesDev:
        return salaryDevTitle;
      case TransactionCategory.salariesMg:
        return salaryMgTitle;
      case TransactionCategory.internalHr:
        return internalHrTitle;
      case TransactionCategory.externalHr:
        return externalHrTitle;
      case TransactionCategory.credit:
        return creditTitle;
      case TransactionCategory.dividends:
        return dividendsTitle;
      case TransactionCategory.bankCharges:
        return bankChargesTitle;
      case TransactionCategory.taxes:
        return taxesTitle;
      case TransactionCategory.awards:
        return awardsTitle;
      case TransactionCategory.others:
        return otherTitle;
    }
  }

  Color getColorMajor() {
    switch (category) {
      case TransactionCategory.salariesDev:
        return salaryDevMajor;
      case TransactionCategory.salariesMg:
        return salaryMgMajor;
      case TransactionCategory.internalHr:
        return internalHrMajor;
      case TransactionCategory.externalHr:
        return externalHrMajor;
      case TransactionCategory.credit:
        return creditMajor;
      case TransactionCategory.dividends:
        return dividendsMajor;
      case TransactionCategory.bankCharges:
        return bankChargesMajor;
      case TransactionCategory.taxes:
        return taxesMajor;
      case TransactionCategory.awards:
        return awardsMajor;
      case TransactionCategory.others:
        return otherMajor;
    }
  }

  Color getColorMinor() {
    switch (category) {
      case TransactionCategory.salariesDev:
        return salaryDevTitle;
      case TransactionCategory.salariesMg:
        return salaryMgTitle;
      case TransactionCategory.internalHr:
        return internalHrTitle;
      case TransactionCategory.externalHr:
        return externalHrTitle;
      case TransactionCategory.credit:
        return creditTitle;
      case TransactionCategory.dividends:
        return dividendsTitle;
      case TransactionCategory.bankCharges:
        return bankChargesTitle;
      case TransactionCategory.taxes:
        return taxesTitle;
      case TransactionCategory.awards:
        return awardsTitle;
      case TransactionCategory.others:
        return otherTitle;
    }
  }

  Color getColorCircle() {
    switch (category) {
      case TransactionCategory.salariesDev:
        return salaryDevCircle;
      case TransactionCategory.salariesMg:
        return salaryMgCircle;
      case TransactionCategory.internalHr:
        return internalHrCircle;
      case TransactionCategory.externalHr:
        return externalHrCircle;
      case TransactionCategory.credit:
        return creditCircle;
      case TransactionCategory.dividends:
        return dividendsCircle;
      case TransactionCategory.bankCharges:
        return bankChargesCircle;
      case TransactionCategory.taxes:
        return taxesCircle;
      case TransactionCategory.awards:
        return awardsCircle;
      case TransactionCategory.others:
        return otherCircle;
    }
  }

  @override
  String toString() {
    switch (category) {
      case TransactionCategory.salariesDev:
        return "Salaries dev.";
      case TransactionCategory.salariesMg:
        return "Salaries mg.";
      case TransactionCategory.internalHr:
        return "Internal HR";
      case TransactionCategory.externalHr:
        return "External HR";
      case TransactionCategory.credit:
        return "Credit";
      case TransactionCategory.dividends:
        return "Dividends";
      case TransactionCategory.bankCharges:
        return "Bank Charges";
      case TransactionCategory.taxes:
        return "Taxes";
      case TransactionCategory.awards:
        return "Awards";
      case TransactionCategory.others:
        return "Others";
    }
  }

  TransactionModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        type = FromStringToEnum().toEnumType(json['type']),
        category = FromStringToEnum().toEnum(json['category']),
        ready = json['ready'],
        value = json['value'],
        description = json['description'],
        date = json['date'].toDate();

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': Type(type).transactionType,
        'ready': ready,
        'date': date,
        'category': ExtensionCategory(category).transactionCategory,
        'value': value,
        'description': description
      };
}
