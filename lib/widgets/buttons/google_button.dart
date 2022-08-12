import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/theme/custom_theme.dart';

class GoogleButton extends StatelessWidget {
  final Function()? onPressed;
  // ignore: use_key_in_widget_constructors
  const GoogleButton({this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: InkWell(
        onTap: onPressed,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 0.1),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 5,
                    spreadRadius: 1)
              ],
            ),
            height: 53.h,
            width: 328.w,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(height: 40, width: 40, child: Image.asset("assets/images/google1.png")),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80.w),
                  child:  Text('Sign in with Google', style: CustomTheme.lightTheme.textTheme.button),
                )
              ],
            )),
      ),
    );
  }
}
