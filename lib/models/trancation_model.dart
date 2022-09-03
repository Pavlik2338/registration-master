
import 'package:flutter/material.dart';
import 'package:registration/resources/constants/transaction_category.dart';

import '../resources/constants/colors.dart';
import '../resources/constants/enums.dart';
import '../resources/localization/english_localization.dart';

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


  @override
  String toString() {
    switch (category) {
      case TransactionCategory.salariesDev:
        return Localization.salariesDev;
      case TransactionCategory.salariesMg:
        return Localization.salariesMg;
      case TransactionCategory.internalHr:
        return Localization.internalHr;
      case TransactionCategory.externalHr:
        return Localization.externalHr;
      case TransactionCategory.credit:
        return Localization.credit;
      case TransactionCategory.dividends:
        return Localization.dividends;
      case TransactionCategory.bankCharges:
        return Localization.bankCharges;
      case TransactionCategory.taxes:
        return Localization.taxes;
      case TransactionCategory.awards:
        return Localization.awards;
      case TransactionCategory.others:
        return Localization.others;
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
