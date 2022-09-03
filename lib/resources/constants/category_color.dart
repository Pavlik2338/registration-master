import 'package:flutter/material.dart';
import 'package:registration/resources/constants/colors.dart';
import 'package:registration/resources/constants/enums.dart';

class CategoryColor {
  TransactionCategory category;
  CategoryColor({required this.category});  
  Color getColorTitle() {
    switch (category) {
      case TransactionCategory.salariesDev:
        return AppColor.salaryDevTitle;
      case TransactionCategory.salariesMg:
        return AppColor.salaryMgTitle;
      case TransactionCategory.internalHr:
        return AppColor.internalHrTitle;
      case TransactionCategory.externalHr:
        return AppColor.externalHrTitle;
      case TransactionCategory.credit:
        return AppColor.creditTitle;
      case TransactionCategory.dividends:
        return AppColor.dividendsTitle;
      case TransactionCategory.bankCharges:
        return AppColor.bankChargesTitle;
      case TransactionCategory.taxes:
        return AppColor.taxesTitle;
      case TransactionCategory.awards:
        return AppColor.awardsTitle;
      case TransactionCategory.others:
        return AppColor.otherTitle;
    }
  }

  Color getColorMajor() {
    switch (category) {
      case TransactionCategory.salariesDev:
        return AppColor.salaryDevMajor;
      case TransactionCategory.salariesMg:
        return AppColor.salaryMgMajor;
      case TransactionCategory.internalHr:
        return AppColor.internalHrMajor;
      case TransactionCategory.externalHr:
        return AppColor.externalHrMajor;
      case TransactionCategory.credit:
        return AppColor.creditMajor;
      case TransactionCategory.dividends:
        return AppColor.dividendsMajor;
      case TransactionCategory.bankCharges:
        return AppColor.bankChargesMajor;
      case TransactionCategory.taxes:
        return AppColor.taxesMajor;
      case TransactionCategory.awards:
        return AppColor.awardsMajor;
      case TransactionCategory.others:
        return AppColor.otherMajor;
    }
  }

  Color getColorMinor() {
    switch (category) {
      case TransactionCategory.salariesDev:
        return AppColor.salaryDevTitle;
      case TransactionCategory.salariesMg:
        return AppColor.salaryMgTitle;
      case TransactionCategory.internalHr:
        return AppColor.internalHrTitle;
      case TransactionCategory.externalHr:
        return AppColor.externalHrTitle;
      case TransactionCategory.credit:
        return AppColor.creditTitle;
      case TransactionCategory.dividends:
        return AppColor.dividendsTitle;
      case TransactionCategory.bankCharges:
        return AppColor.bankChargesTitle;
      case TransactionCategory.taxes:
        return AppColor.taxesTitle;
      case TransactionCategory.awards:
        return AppColor.awardsTitle;
      case TransactionCategory.others:
        return AppColor.otherTitle;
    }
  }

  Color getColorCircle() {
    switch (category) {
      case TransactionCategory.salariesDev:
        return AppColor.salaryDevCircle;
      case TransactionCategory.salariesMg:
        return AppColor.salaryMgCircle;
      case TransactionCategory.internalHr:
        return AppColor.internalHrCircle;
      case TransactionCategory.externalHr:
        return AppColor.externalHrCircle;
      case TransactionCategory.credit:
        return AppColor.creditCircle;
      case TransactionCategory.dividends:
        return AppColor.dividendsCircle;
      case TransactionCategory.bankCharges:
        return AppColor.bankChargesCircle;
      case TransactionCategory.taxes:
        return AppColor.taxesCircle;
      case TransactionCategory.awards:
        return AppColor.awardsCircle;
      case TransactionCategory.others:
        return AppColor.otherCircle;
    }
  }
}
