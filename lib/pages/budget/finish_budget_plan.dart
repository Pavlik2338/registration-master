import 'package:flutter/material.dart';
import '../../resources/constants/colors.dart';
import '../../resources/localization/english_localization.dart';
import '../../widgets/budget_widgets/budget_page_widget.dart';
import '../../widgets/navigation_bar/navigation_bar.dart';
import '../add_transaction/add_lisiner.dart';

class FinishPlanBudget extends StatelessWidget {
  const FinishPlanBudget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.purple,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTransactionPage()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: FloatingNavigationBar(
        currentIndex: 2,
      ),
      body: BaseBudgetWidget(
        title: Localization.profit,
        ready: true,
      ),
    );
  }
}
