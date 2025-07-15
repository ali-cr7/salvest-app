// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:salvest_app/utility/app_colors.dart';

// class DoubleLineChartCard extends StatelessWidget {
//   const DoubleLineChartCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: 345,
//             height: 200,
//             decoration: ShapeDecoration(
//               gradient: AppColors.purple2Gradient,
//           //    color: const Color(0xFF9A8AEC),
//               shape: RoundedRectangleBorder(
//                 side: BorderSide(width: 1, color: const Color(0x7F9A8AEC)),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//             ),

//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: LineChart(
//                 LineChartData(
//                   backgroundColor: Colors.transparent,
//                   minY: 10,
//                   maxY: 70,
//                   gridData: FlGridData(
//                     show: true,
//                     drawHorizontalLine: true,
//                     horizontalInterval: 15,
//                     getDrawingHorizontalLine:
//                         (value) => FlLine(color: Colors.black38, strokeWidth: 1),
//                     drawVerticalLine: false,
//                   ),
//                   titlesData: FlTitlesData(
//                     bottomTitles: AxisTitles(
//                       sideTitles: SideTitles(showTitles: false),
//                     ),
//                     rightTitles: AxisTitles(
//                       sideTitles: SideTitles(showTitles: false),
//                     ),
//                     topTitles: AxisTitles(
//                       sideTitles: SideTitles(showTitles: false),
//                     ),
//                     leftTitles: AxisTitles(
//                       sideTitles: SideTitles(
//                         showTitles: true,
//                         reservedSize: 32,
//                         interval: 10,
//                         getTitlesWidget:
//                             (value, _) => Text(
//                               '${value.toInt()}%',
//                               style: const TextStyle(
//                                 color: Colors.black45,
//                                 fontSize: 10,
//                               ),
//                             ),
//                       ),
//                     ),
//                   ),
//                   borderData: FlBorderData(show: false),
//                   lineBarsData: [
//                     // Profits Line
//                     LineChartBarData(
//                       isCurved: true,
//                       color: Colors.white,
//                       barWidth: 3,
//                       isStrokeCapRound: true,
//                       dotData: FlDotData(show: false),
//                       spots: const [
//                         //  FlSpot(0, 10),
//                         FlSpot(1, 30),
//                         FlSpot(2, 40),
//                         FlSpot(3, 35),
//                         FlSpot(4, 50),
//                         FlSpot(5, 60),
//                         FlSpot(6, 45),
//                         FlSpot(7, 30),
//                         FlSpot(8, 25),
//                       ],
//                     ),
//                     // Investments Line
//                     LineChartBarData(
//                       isCurved: true,
//                       color: Colors.black.withOpacity(0.5),
//                       barWidth: 3,
//                       isStrokeCapRound: true,
//                       dotData: FlDotData(show: false),
//                       spots: const [
//                         //     FlSpot(0, 15),
//                         FlSpot(1, 25),
//                         FlSpot(2, 20),
//                         FlSpot(3, 30),
//                         FlSpot(4, 65),
//                         FlSpot(5, 50),
//                         FlSpot(6, 55),
//                         FlSpot(7, 60),
//                         FlSpot(8, 70),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             // Legend
//             Padding(
//               padding: const EdgeInsets.only(left: 20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   LegendItem(color: Colors.white, label: 'profits'),
//                   const SizedBox(width: 16),
//                   LegendItem(color: Colors.black54, label: 'Investments'),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class LegendItem extends StatelessWidget {
//   const LegendItem({super.key, required this.color, required this.label});
//   final Color color;
//   final String label;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           width: 10,
//           height: 10,
//           decoration: BoxDecoration(color: color, shape: BoxShape.circle),
//         ),
//         const SizedBox(width: 4),
//         Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
//       ],
//     );
//   }
// }
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salvest_app/business_logic/lines%20chart%20bloc/lines_chart_bloc.dart';
import 'package:salvest_app/business_logic/lines%20chart%20bloc/lines_chart_event.dart';
import 'package:salvest_app/business_logic/lines%20chart%20bloc/lines_chart_state.dart';

import 'package:salvest_app/utility/app_colors.dart';

class DoubleLineChartCard extends StatelessWidget {
  final int year;
  const DoubleLineChartCard({Key? key, required this.year}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<LinesChartBloc>().add(FetchLinesChartEvent(year: year));

    return BlocBuilder<LinesChartBloc, LinesChartState>(
      builder: (context, state) {
        if (state is LinesChartLoading || state is LinesChartInitial) {
          print("state is loading");
          return Container(
            width: 345,
            height: 200,
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        }
        if (state is LinesChartError) {
          print("state is LinesChartError ");
          return Container(
            width: 345,
            height: 200,
            alignment: Alignment.center,
            child: Text(state.message),
          );
        }
        // LinesChartLoaded
        final data = (state as LinesChartLoaded).data;
        // نحول الـ Map إلى قائمة من FlSpot على محور X من 1 إلى 12
        final spotsInvest = <FlSpot>[];
        final spotsProfit = <FlSpot>[];
        for (var i = 1; i <= 12; i++) {
          final inv =
              data.investmentPercentages?.toJson()['$i']?.toDouble() ?? 0.0;
          final prf = data.profitPercentages?.toJson()['$i']?.toDouble() ?? 0.0;
          spotsInvest.add(FlSpot(i.toDouble(), inv));
          spotsProfit.add(FlSpot(i.toDouble(), prf));
        }

        return Container(
          width: 345,
          height: 200,
          decoration: ShapeDecoration(
            gradient: AppColors.purple2Gradient,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: const Color(0x7F9A8AEC)),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: LineChart(
                    LineChartData(
                      backgroundColor: Colors.transparent,
                      minY: 0,
                      maxY: 100,
                      gridData: FlGridData(
                        show: true,
                        drawHorizontalLine: true,
                        horizontalInterval: 20,
                        getDrawingHorizontalLine:
                            (v) =>
                                FlLine(color: Colors.black38, strokeWidth: 1),
                        drawVerticalLine: false,
                      ),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 1,
                            getTitlesWidget:
                                (value, _) => Text(
                                  value.toInt().toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 20,
                            getTitlesWidget:
                                (v, _) => Text(
                                  '${v.toInt()}%',
                                  style: const TextStyle(
                                    color: Colors.white54,
                                    fontSize: 10,
                                  ),
                                ),
                          ),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        // خط الاستثمار
                        LineChartBarData(
                          isCurved: true,
                          color: Colors.white,
                          barWidth: 3,
                          isStrokeCapRound: true,
                          dotData: FlDotData(show: false),
                          spots: spotsInvest,
                        ),
                        // خط الأرباح
                        LineChartBarData(
                          isCurved: true,
                          color: Colors.black54,
                          barWidth: 3,
                          isStrokeCapRound: true,
                          dotData: FlDotData(show: false),
                          spots: spotsProfit,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Legend
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    _LegendItem(color: Colors.white, label: 'Investment %'),
                    SizedBox(width: 16),
                    _LegendItem(color: Colors.black54, label: 'Profit %'),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}
