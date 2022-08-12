// ignore: depend_on_referenced_packages
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import 'package:flutter/material.dart';

import 'package:registration/pages/home_page.dart';
import 'package:registration/pages/plan_budget_page.dart';
import 'package:registration/repositories/login_repository.dart';
import 'package:registration/repositories/transaction_repository.dart';

import '../pages/finish_budget_plan.dart';
import '../resources/constants/colors.dart';
import '../resources/constants/enums.dart';

class FloatingNavigationBar extends StatefulWidget {
  final int currentIndex;
  FloatingNavigationBar({required this.currentIndex});
  @override
  State<FloatingNavigationBar> createState() => _FloatingNavigationBarState();
}

class _FloatingNavigationBarState extends State<FloatingNavigationBar> {
  var iconList = const [
    Icons.home_outlined,
    Icons.calendar_month_outlined,
    Icons.wallet_sharp,
    Icons.verified_user_outlined,
  ];

  @override
  void initState() {
    super.initState();
  }

  void actionOnTap(index) {
    if (index == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    if (index == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PlanPage()));
    }
    if (index == 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FinishPlanBudget()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      tabBuilder: (int index, bool isActive) {
        final color =
            isActive ? Colors.white : const Color.fromRGBO(255, 255, 255, 0.2);
        return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 24,
                color: color,
              )
            ]);
      },
      backgroundColor: purple,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      itemCount: iconList.length,
      splashColor: const Color.fromRGBO(255, 255, 255, 0.2),
      activeIndex: widget.currentIndex,
      onTap: (index) => setState(() {
        actionOnTap(index);
      }),
      // hideAnimationController: _hideBottomBarAnimationController,
    );
  }
}
