import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/models/dashBoardModel/bar_chart_point.dart';

class GraphChartWidget extends StatefulWidget {
  final List<BarChartPoint> data;
  final Color highlightColor;
  final int highlightIndex;

  const GraphChartWidget({
    super.key,
    required this.data,
    this.highlightColor = Colors.blue,
    this.highlightIndex = -1,
  });

  @override
  State<GraphChartWidget> createState() => _GraphChartWidgetState();
}

class _GraphChartWidgetState extends State<GraphChartWidget> {
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    final maxY = widget.data.map((e) => e.value).reduce(max);

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: maxY + (maxY * 0.02),

        barTouchData: BarTouchData(
          enabled: true,
          touchCallback: (FlTouchEvent event, barTouchResponse) {
            setState(() {
              if (!event.isInterestedForInteractions ||
                  barTouchResponse == null ||
                  barTouchResponse.spot == null) {
                touchedIndex = null;
                return;
              }
              touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
            });
          },
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.grey[800],
            tooltipBorder: BorderSide(
              color: Colors.black.withAlpha(
                (0.2 * 255).toInt(),
              ),
              width: 1,
            ),
            tooltipRoundedRadius: 4,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              final index = group.x.toInt();

              if (index < 0 || index >= widget.data.length) {
                return null;
              }

              return BarTooltipItem(
                '',
                const TextStyle(),
                children: [
                  TextSpan(
                    text: '${widget.data[index].label}\n',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: '  ₹ ${(rod.toY / 1000).toStringAsFixed(1)}k  ',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          ),
        ),

        titlesData: FlTitlesData(
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),

          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1000,
              reservedSize: 12,
              getTitlesWidget: (value, meta) {
                return Text(
                  '${(value / 1000).toStringAsFixed(0)}k',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 10,
                  ),
                );
              },
            ),
          ),

          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1000,
              reservedSize: 22,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < 0 || index >= widget.data.length) {
                  return const SizedBox.shrink();
                }

                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    widget.data[index].label,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: maxY / 5,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.grey.withOpacity(0.3),
              strokeWidth: 1,
            );
          },
        ),

        borderData: FlBorderData(show: false),

        barGroups: List.generate(widget.data.length, (index) {
          final item = widget.data[index];
          final isTouched = touchedIndex == index;
          final isHighlighted = index == widget.highlightIndex;

          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: item.value,
                width: isTouched ? 45 : 40,
                color: isTouched || isHighlighted
                    ? widget.highlightColor
                    : Colors.grey.shade300,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
