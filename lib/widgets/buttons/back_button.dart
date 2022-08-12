import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/constants/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: SizedBox(
        height: 44.h,
        width: 44.w,
        child: FloatingActionButton(
          hoverElevation: 0,
          elevation: 0,
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: purple.withOpacity(0.5),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
    );
  }
}
