import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:registration/models/transaction_category.dart';
import '../../resources/constants/colors.dart';
import '../../resources/constants/enums.dart';

class DropDownField extends StatefulWidget {
  final TextEditingController? controller;
  final List dropItem;
  final void Function(TransactionCategory) callback;
  DropDownField(
      {required this.dropItem, this.controller, required this.callback});
  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  String selectedValue = '';
  TransactionCategory func(String string) {
    switch (string) {
      case ('salariesDev'):
        return TransactionCategory.salariesDev;
      case ('salariesMg'):
        return TransactionCategory.salariesMg;
      case ('internalHr'):
        return TransactionCategory.internalHr;
      case ('externalHr'):
        return TransactionCategory.externalHr;
      case ('credit'):
        return TransactionCategory.credit;
      case ('dividends'):
        return TransactionCategory.dividends;
      case ('bankCharges'):
        return TransactionCategory.bankCharges;
      case ('taxes'):
        return TransactionCategory.taxes;
      case ('awards'):
        return TransactionCategory.awards;
      case ('others'):
        return TransactionCategory.others;
    }
    return TransactionCategory.others;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64.h,
      width: 328.w,
      child: DropdownButtonFormField2(
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 4,
              color: Color.fromRGBO(117, 117, 117, 1),
            ),
          ),
        ),
        isExpanded: true,
        hint: const Text(
          'Category',
          style:
              TextStyle(fontSize: 14, color: Color.fromRGBO(27, 27, 27, 0.5)),
        ),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 30,
        buttonHeight: 58,
        buttonPadding: const EdgeInsets.only(left: 20, right: 10),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        items: widget.dropItem
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'Please select category.';
          }
        },
        onChanged: (value) {
          widget.callback(func(value.toString()));
        },
        onSaved: (value) {
          selectedValue = value.toString();
          widget.callback(func(value.toString()));
        },
      ),
    );
  }
}
