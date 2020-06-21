import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SessionLengthChart extends StatefulWidget {
  @override
  _SessionLengthChartState createState() => _SessionLengthChartState();
}

class _SessionLengthChartState extends State<SessionLengthChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Session Length',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('Total session minutes recorded in a single day',
              style: TextStyle(color: Colors.white)),
          BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 20,
              barTouchData: BarTouchData(
                enabled: false,
                touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: Colors.transparent,
                  tooltipPadding: const EdgeInsets.all(0),
                  tooltipBottomMargin: 8,
                  getTooltipItem: (
                    BarChartGroupData group,
                    int groupIndex,
                    BarChartRodData rod,
                    int rodIndex,
                  ) {
                    return BarTooltipItem(
                      rod.y.round().toString(),
                      TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: SideTitles(
                  showTitles: true,
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                  margin: 20,
                  getTitles: (double value) {
                    switch (value.toInt()) {
                      case 0:
                        return 'Mn';
                      case 1:
                        return 'Te';
                      case 2:
                        return 'Wd';
                      case 3:
                        return 'Tu';
                      case 4:
                        return 'Fr';
                      case 5:
                        return 'St';
                      case 6:
                        return 'Sn';
                      default:
                        return '';
                    }
                  },
                ),
                leftTitles: SideTitles(showTitles: false),
              ),
              borderData: FlBorderData(
                show: false,
              ),
              barGroups: [
                BarChartGroupData(x: 0, barRods: [
                  BarChartRodData(
                      y: 8, color: Theme.of(context).primaryColorLight)
                ], showingTooltipIndicators: [
                  0
                ]),
                BarChartGroupData(x: 1, barRods: [
                  BarChartRodData(
                      y: 10, color: Theme.of(context).primaryColorLight)
                ], showingTooltipIndicators: [
                  0
                ]),
                BarChartGroupData(x: 2, barRods: [
                  BarChartRodData(
                      y: 14, color: Theme.of(context).primaryColorLight)
                ], showingTooltipIndicators: [
                  0
                ]),
                BarChartGroupData(x: 3, barRods: [
                  BarChartRodData(
                      y: 15, color: Theme.of(context).primaryColorLight)
                ], showingTooltipIndicators: [
                  0
                ]),
                BarChartGroupData(x: 3, barRods: [
                  BarChartRodData(
                      y: 13, color: Theme.of(context).primaryColorLight)
                ], showingTooltipIndicators: [
                  0
                ]),
                BarChartGroupData(x: 3, barRods: [
                  BarChartRodData(
                      y: 10, color: Theme.of(context).primaryColorLight)
                ], showingTooltipIndicators: [
                  0
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
