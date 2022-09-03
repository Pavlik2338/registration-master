import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconWidget extends StatelessWidget {
  final Color? color;
  final Image image;
  IconWidget( {required this.color, required this.image});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
            height: 40.h,
            width: 40.w,
            child: Stack(children: [
              Container(
                height: 40.h,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: color),
              ),
              Center(
                child: image,
              ),
            ]),
          );
  }
}
