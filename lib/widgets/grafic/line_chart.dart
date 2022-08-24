import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/blocs/trancation/trancation_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:registration/repositories/transaction_repository.dart';

import '../../resources/constants/colors.dart';
import 'bottom_title_line_chart.dart';
import 'left_title_line_chart.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({Key? key}) : super(key: key);

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.70,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: BlocBuilder<TrancationBloc,TrancationState>(
            builder: (context, state) {
              if (state is FetchLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is FetchState) {
                return LineChart(
                  LineChartData(
                      gridData: FlGridData(
                        show: true,
                        drawHorizontalLine: true,
                        horizontalInterval: 1,
                        verticalInterval: 1,
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            interval: 1,
                            getTitlesWidget: bottomTitleWidgets,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 1,
                            getTitlesWidget: leftTitleWidgets,
                            reservedSize: 42,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: true,
                      ),
                      minX: 0,
                      maxX: 11,
                      minY: 0,
                      maxY: 5,
                      lineBarsData: [
                        LineChartBarData(
                          spots: TransactionRepository()
                              .spotsGrafic(tranc: state.transactions),
                          isCurved: true,
                          gradient: const LinearGradient(
                            colors: [
                              Colors.white,
                              purple,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          barWidth: 5,
                          isStrokeCapRound: true,
                          dotData: FlDotData(
                            show: false,
                          ),
                          belowBarData: BarAreaData(show: false),
                        ),
                      ]),
                );
              }else {
            return Container();
          }
            },
          )),
    );
  }
}
