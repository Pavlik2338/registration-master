import 'package:registration/models/trancation_model.dart';

import '../resources/constants/enums.dart';

extension ExtensionCategory on TransactionCategory {
  String get transactionCategory {
    switch (this) {
      case (TransactionCategory.salariesDev):
        return 'salariesDev';
      case (TransactionCategory.salariesMg):
        return 'salariesMg';
      case (TransactionCategory.internalHr):
        return 'internalHr';
      case (TransactionCategory.externalHr):
        return 'externalHr';
      case (TransactionCategory.credit):
        return 'credit';
      case (TransactionCategory.dividends):
        return 'dividends';
      case (TransactionCategory.bankCharges):
        return 'bankCharges';
      case (TransactionCategory.taxes):
        return 'taxes';
      case (TransactionCategory.awards):
        return 'awards';
      case (TransactionCategory.others):
        return 'others';
    }
    return '';
  }
}

extension Type on TransactionType {
  String get transactionType {
    switch (this) {
      case (TransactionType.loss):
        return 'loss';
      case (TransactionType.profit):
        return 'profit';
    }
    return '';
  }
}

class FromStringToEnum {
  TransactionCategory toEnum(String str) {
    switch (str) {
      case "Salaries dev.":
        return TransactionCategory.salariesDev;
      case "Salaries mg.":
        return TransactionCategory.salariesMg;
      case "Internal HR":
        return TransactionCategory.internalHr;
      case "External HR":
        return TransactionCategory.externalHr;
      case "Credit":
        return TransactionCategory.credit;
      case "Dividends":
        return TransactionCategory.dividends;
      case "Bank Charges":
        return TransactionCategory.bankCharges;
      case "Taxes":
        return TransactionCategory.taxes;
      case "Awards":
        return TransactionCategory.awards;
      case "Others":
        return TransactionCategory.others;
      // case "Profit":
      //   return TransactionCategory.profit;
      default:
        return TransactionCategory.others;
    }
  }

  TransactionType toEnumType(String str) {
    switch (str) {
      case "profit":
        return TransactionType.profit;
      case "loss":
        return TransactionType.loss;
      default:
        return TransactionType.loss;
    }
  }
}
