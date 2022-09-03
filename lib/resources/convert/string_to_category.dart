import 'package:registration/resources/constants/enums.dart';

class StringToCategory {
  final String? categoryName;
  StringToCategory({ this.categoryName});
  TransactionCategory func(String categoryName) {
    switch (categoryName) {
      case ('Salaries dev.'):
        return TransactionCategory.salariesDev;
      case ('Salaries mg.'):
        return TransactionCategory.salariesMg;
      case ('Internal HR'):
        return TransactionCategory.internalHr;
      case ('External HR'):
        return TransactionCategory.externalHr;
      case ('Credit'):
        return TransactionCategory.credit;
      case ('Dividends'):
        return TransactionCategory.dividends;
      case ('Bank Charges'):
        return TransactionCategory.bankCharges;
      case ('Taxes'):
        return TransactionCategory.taxes;
      case ('Awards'):
        return TransactionCategory.awards;
      case ('Others'):
        return TransactionCategory.others;
    }
    return TransactionCategory.others;
  }
}
