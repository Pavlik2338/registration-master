import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/blocs/trancation/trancation_bloc.dart';

import '../../models/month_year_model.dart';
import '../../resources/theme/custom_theme.dart';

class MonthView extends StatefulWidget {
  const MonthView({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => MonthViewState();
}

class MonthViewState extends State<MonthView> {
  MonthYear monthYear = MonthYear.fromDateTime(DateTime.now());
  PageController pageController = PageController(initialPage: 999);
  int pageChanged = 999;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33.h,
      // width: 150.w,
      alignment: Alignment.center,
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        IconButton(
            onPressed: () {
              pageController.animateToPage(--pageChanged,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.bounceInOut);
              monthYear -= 2;
              BlocProvider.of<TransactionBloc>(context)
                  .add(DateChanged(newDate: monthYear));
            },
            icon: const Icon(
              Icons.keyboard_arrow_left_outlined,
              color: Colors.white,
            )),
        SizedBox(
          width: 120.w,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                if (index < pageChanged) {
                  monthYear -= 1;
                } else {
                  monthYear += 1;
                }
                pageChanged = index;
              });
              BlocProvider.of<TransactionBloc>(context)
                  .add(DateChanged(newDate: monthYear));
            },
            itemBuilder: (context, index) {
              return Text(monthYear.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w700,
                      fontSize: 15.5));
            },
          ),
        ),
        IconButton(
            onPressed: () {
              pageController.animateToPage(++pageChanged,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.bounceInOut);
            },
            icon: const Icon(
              Icons.keyboard_arrow_right_outlined,
              color: Colors.white,
            )),
      ]),
    );
  }
}
