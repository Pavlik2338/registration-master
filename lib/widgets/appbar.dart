import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../resources/constants/colors.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({Key? key})
      : super(
          key: key,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColor.purple,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
          toolbarHeight: 0.0,
        );
}


