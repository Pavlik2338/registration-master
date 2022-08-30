import 'dart:math';

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
          child: BlocBuilder<TransactionBloc, TransactionState>(
            builder: (context, state) {
              if (state is FetchLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is FetchState) {
                return Stack(children: [
                  const Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 28),
                        child: Divider(
                          height: 15,
                          color: Color.fromRGBO(138, 93, 165, 1),
                        ),
                      )),
                  LineChart(
                    LineChartData(
                        gridData: FlGridData(
                            show: true,
                            drawHorizontalLine: true,
                            drawVerticalLine: false,
                            horizontalInterval: 1),
                        titlesData: FlTitlesData(
                          show: true,
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          bottomTitles: AxisTitles(
                            drawBehindEverything: true,
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
                          show: false,
                        ),
                        lineTouchData: LineTouchData(
                            touchTooltipData: LineTouchTooltipData(
                                tooltipRoundedRadius: 12.5,
                                tooltipBgColor: purple)),
                        minX: 0,
                        maxX: 11,
                        minY: -1,
                        maxY: 6,
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
                  ),
                ]);
              } else {
                return Container();
              }
            },
          )),
    );
  }
}
