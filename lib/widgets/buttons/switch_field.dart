import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:toggle_switch/toggle_switch.dart';

import '../../resources/constants/enums.dart';

class SwitchField extends StatefulWidget {
  final String firstLebel;
  final String secondLebel;
  final String switchTitle;
  final bool? type;
  final void Function(TransactionType)? saveType;
  final void Function(bool)? saveStatus;
  final int index;
  SwitchField(
      {required this.firstLebel,
      required this.secondLebel,
      required this.switchTitle,
      this.saveType,
      this.saveStatus,
      this.type,
      this.index=0});
  @override
  State<SwitchField> createState() => _SwitchFieldState();
}

class _SwitchFieldState extends State<SwitchField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            widget.switchTitle,
            style: const TextStyle(
              color: Color.fromRGBO(27, 27, 27, 0.5),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        ToggleSwitch(
      
          minWidth: 164.w,
          minHeight: 64.h,
          cornerRadius: 10.0,
          activeBgColors: const [
            [Color.fromRGBO(138, 93, 165, 0.5)],
            [Color.fromRGBO(138, 93, 165, 0.5)]
          ],
          borderColor: const [
            Color.fromRGBO(138, 93, 165, 1),
          ],
          borderWidth: 0.5,
          activeFgColor: const Color.fromRGBO(138, 93, 165, 1),
          inactiveFgColor: const Color.fromRGBO(138, 93, 165, 1),
          inactiveBgColor: Colors.white,
          initialLabelIndex: widget.index,
          totalSwitches: 2,
          labels: [widget.firstLebel, widget.secondLebel],
          radiusStyle: true,
          onToggle: (index) {
            if (index == 0) {
              TransactionType type = TransactionType.profit;
              bool status = true;
              (widget.saveType == null)
                  ? widget.saveStatus!(status)
                  : widget.saveType!(type);
            } else {
              TransactionType type = TransactionType.loss;
              bool status = false;
              (widget.saveType == null)
                  ? widget.saveStatus!(status)
                  : widget.saveType!(type);
            }
          },
        ),
      ],
    );
  }
}
