import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/blocs/trancation/trancation_bloc.dart';

class YearView extends StatefulWidget {
  const YearView({Key? key}) : super(key: key);

  @override
  State<YearView> createState() => _YearViewState();
}

class _YearViewState extends State<YearView> {
  int year = DateTime.now().year;
  PageController pageController = PageController(initialPage: 999);
  int pageChanged = 999;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33.h,
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {
                pageController.animateToPage(--pageChanged,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.bounceInOut);
                year -= 2;
                BlocProvider.of<TransactionBloc>(context)
                    .add(DateChanged(year: year));
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
                    year -= 1;
                  } else {
                    year += 1;
                  }
                  pageChanged = index;
                });
                BlocProvider.of<TransactionBloc>(context)
                    .add(DateChanged(year: year));
              },
              itemBuilder: (context, index) {
                return Text(year.toString(),
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
        ],
      ),
    );
  }
}
