import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/constants/colors.dart';
import '../../resources/theme/custom_theme.dart';

class SecuredTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String nameField;
  final String? errorText;
  final void Function(String) onChanged;
  final String? Function(String?) validator;
  const SecuredTextField(
      {Key? key,
      required this.nameField,
      required this.onChanged,
      this.errorText,
      this.controller,
      required this.validator})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => SecuredTextFieldState();
}

class SecuredTextFieldState extends State<SecuredTextField> {
  bool _obscureText = true;

  void _showText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 64.h,
        width: 328.w,
        child: TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          obscureText: _obscureText,
          cursorColor: AppColor.greyLight,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 23),
            label: Text(widget.nameField),
            labelStyle: CustomTheme.lightTheme.textTheme.labelMedium,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            errorText: widget.errorText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.purple),
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.remove_red_eye, size: 20),
              color: AppColor.greyDark,
              onPressed: _showText,
            ),
          ),
          onChanged: widget.onChanged,
        ));
  }
}
