import 'package:flutter/material.dart';
import '../../resources/constants/colors.dart';
import '../../widgets/budget_widgets/budget_page_widget.dart';
import '../../widgets/navigation_bar.dart';
import '../add_transaction/add_lisiner.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: purple,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddTransactionPage()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: FloatingNavigationBar(
        currentIndex: 1,
      ),
      body: BaseBudgetWidget(
        title: "Profit",
        ready: false,
      ),
    );
  }
}