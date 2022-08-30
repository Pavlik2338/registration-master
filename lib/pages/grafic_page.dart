import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:registration/blocs/trancation/trancation_bloc.dart';
import 'package:registration/repositories/transaction_repository.dart';
import 'package:registration/resources/constants/enums.dart';
import 'package:registration/widgets/top_widget/top_widget.dart';
import 'package:registration/widgets/grafic/line_chart.dart';

import '../resources/constants/colors.dart';
import '../widgets/navigation_bar/navigation_bar.dart';
import 'add_transaction/add_lisiner.dart';

class GraficPAge extends StatelessWidget {
  const GraficPAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: purple,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>const AddTransactionPage()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: FloatingNavigationBar(
        currentIndex: 3,
      ),
      body: BlocProvider(
        create: (context) =>
            TransactionBloc(repository: TransactionRepository())
              ..add(const FetchEvent(onlyYear: true)),
        child: ListView(
          children: [
            Column(
              children: [
                TopWidget(
                  ready: true,
                  title: 'Your total expenses',
                  topWidgetType: TopWidgetType.years,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: SizedBox(
                    height: 540.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        LineChartWidget(),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
