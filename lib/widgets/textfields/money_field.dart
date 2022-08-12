import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/services.dart';
import '../../resources/constants/colors.dart';
import '../../resources/theme/custom_theme.dart';
import '../../resources/thousands_formatter.dart';

class MoneyField extends StatelessWidget {
  final TextEditingController? controller;
  final String nameField;
  final String? errorText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  const MoneyField(
      {Key? key,
      required this.nameField,
      this.onChanged,
      this.errorText,
      this.controller,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 64.h,
        width: 328.w,
        child: TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [],
          validator: validator,
          controller: controller,
          cursorColor: greyLight,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 23),
            label: Text(nameField),
            labelStyle: CustomTheme.lightTheme.textTheme.labelMedium,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            errorText: errorText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: purple),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: onChanged,
        ));
  }
}