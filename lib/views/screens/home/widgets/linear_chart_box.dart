import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class ChartPoint {
  final String label;
  final double value;

  ChartPoint(this.label, this.value);
}

class LinearChartBox extends StatelessWidget {
  final List<ChartPoint> data;
  final Color lineColor;
  final double height;

  const LinearChartBox({
    super.key,
    required this.data,
    this.lineColor = Colors.blue,
    this.height = 260,
  });

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Center(child: Text('No data available'));
    }

    // Convert data → FlSpot
    final spots = data
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.value))
        .toList();

    // Calculate min/max dynamically
    final minY = data.map((e) => e.value).reduce(min);
    final maxY = data.map((e) => e.value).reduce(max);

    return SizedBox(
      height: height,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),

          /// ───── AXIS TITLES ─────
          titlesData: FlTitlesData(
            /// LEFT Y AXIS
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                reservedSize: 30,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toStringAsFixed(0),
                    style: const TextStyle(fontSize: 10),
                  );
                },
              ),
            ),

            /// BOTTOM X AXIS (DYNAMIC)
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  if (value % 1 != 0) {
                    return const SizedBox.shrink();
                  }

                  final index = value.toInt();
                  if (index < 0 || index >= data.length) {
                    return const SizedBox.shrink();
                  }

                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(
                      data[index].label,
                      style: const TextStyle(fontSize: 10),
                    ),
                  );
                },
              ),
            ),

            topTitles:
            AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
            AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),

          borderData: FlBorderData(show: false),

          /// ───── DYNAMIC RANGE ─────
          minX: 0,
          maxX: (data.length - 1).toDouble(),
          minY: minY - 0.5,
          maxY: maxY + 0.5,

          /// ───── LINE DATA ─────
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: lineColor,
              barWidth: 3,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: lineColor.withOpacity(0.12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
