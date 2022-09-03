import 'package:registration/resources/constants/transaction_category.dart';
import 'package:registration/resources/constants/enums.dart';
class CategoryList{
    List<String> dropItem = [
    ExtensionCategory(TransactionCategory.salariesMg).transactionCategory,
    ExtensionCategory(TransactionCategory.internalHr).transactionCategory,
    ExtensionCategory(TransactionCategory.externalHr).transactionCategory,
    ExtensionCategory(TransactionCategory.credit).transactionCategory,
    ExtensionCategory(TransactionCategory.dividends).transactionCategory,
    ExtensionCategory(TransactionCategory.bankCharges).transactionCategory,
    ExtensionCategory(TransactionCategory.taxes).transactionCategory,
    ExtensionCategory(TransactionCategory.awards).transactionCategory,
    ExtensionCategory(TransactionCategory.others).transactionCategory,
  ];
}