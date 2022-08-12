import 'package:flutter/material.dart';
import 'package:registration/resources/constants/colors.dart';
import '../../resources/theme/custom_theme.dart';

class RegularTextButton extends StatelessWidget {
  final String name;
  final void Function() onPressed;
  const RegularTextButton(
      {Key? key, required this.onPressed, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(name,
          style: CustomTheme.lightTheme.textTheme.bodyText1
              ?.copyWith(color: purple)),
    );
  }
}
