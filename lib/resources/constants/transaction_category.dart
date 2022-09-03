

import 'enums.dart';

extension ExtensionCategory on TransactionCategory {
  String get transactionCategory {
    switch (this) {
      case (TransactionCategory.salariesDev):
        return 'Salaries dev.';
      case (TransactionCategory.salariesMg):
        return 'Salaries mg.';
      case (TransactionCategory.internalHr):
        return 'Internal HR';
      case (TransactionCategory.externalHr):
        return 'External HR';
      case (TransactionCategory.credit):
        return 'Credit';
      case (TransactionCategory.dividends):
        return 'Dividends';
      case (TransactionCategory.bankCharges):
        return 'Bank Charges';
      case (TransactionCategory.taxes):
        return 'Taxes';
      case (TransactionCategory.awards):
        return 'Awards';
      case (TransactionCategory.others):
        return 'Others';
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
