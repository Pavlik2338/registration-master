
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:registration/pages/grafic_page.dart';
import 'package:registration/pages/home_page.dart';
import 'package:registration/pages/budget/plan_budget_page.dart';
import 'package:registration/resources/constants/path_images.dart';
import 'package:registration/widgets/navigation_bar/icon_widget.dart';
import '../../pages/budget/finish_budget_plan.dart';
import '../../resources/constants/colors.dart';

class FloatingNavigationBar extends StatefulWidget {
  final int currentIndex;
  FloatingNavigationBar({required this.currentIndex});
  @override
  State<FloatingNavigationBar> createState() => _FloatingNavigationBarState();
}

class _FloatingNavigationBarState extends State<FloatingNavigationBar> {
  List<Image> iconList =  [
   Image.asset(PathImages.home),
  Image.asset(PathImages.calendar),
  Image.asset(PathImages.wallet),
  Image.asset(PathImages.grafic),
  ];

 
  void actionOnTap(index) {
    if (index == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    if (index == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const PlanPage()));
    }
    if (index == 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const FinishPlanBudget()));
    }
      if (index == 3) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const GraficPAge()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      tabBuilder: (int index, bool isActive) {
        final color =
            isActive ? const Color.fromRGBO(255, 255, 255, 0.2) :null ;
        return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconWidget(
               image: iconList[index],
    
                color: color,
              )
            ]);
      },
      backgroundColor: AppColor.purple,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      itemCount: iconList.length,
      splashColor: const Color.fromRGBO(255, 255, 255, 0.2),
      activeIndex: widget.currentIndex,
      onTap: (index) => setState(() {
        actionOnTap(index);
      }),

    );
  }
}
