import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/constants/colors.dart';
import '../../resources/theme/custom_theme.dart';

class MainButtonLight extends StatelessWidget {
  final String name;
  final void Function() onPressed;

  const MainButtonLight({Key? key, required this.name, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        primary: Colors.white,
        minimumSize: Size(328.w, 53.h),
      ),
      child: Text(name, style: CustomTheme.lightTheme.textTheme.button),
    );
  }
}

class MainButtonDark extends StatelessWidget {
  final String name;
  final void Function() onPressed;

  const MainButtonDark({Key? key, required this.name, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        primary: purple,
        minimumSize: Size(328.w, 53.h),
      ),
      child: Text(name,
          style: CustomTheme.lightTheme.textTheme.button
              ?.copyWith(color: Colors.white)),
    );
  }
}
