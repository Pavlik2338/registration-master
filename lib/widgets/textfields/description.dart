import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/resources/constants/colors.dart';

import '../../resources/theme/custom_theme.dart';

class DescriptionField extends StatelessWidget {
  final TextEditingController? controller;
  final String nameField;
  final void Function(String) onChanged;
  DescriptionField(
      {Key? key,
      required this.nameField,
       this.controller,
      required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 328.w,
      height: 125.h,
      child: TextFormField(
        maxLines: 12,
        controller: controller,
        cursorColor: greyDark,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
          label: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(nameField),
            ),
          ),

        
          labelStyle: CustomTheme.lightTheme.textTheme.labelMedium,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            
            borderSide: const BorderSide(color: purple),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
