import 'dart:math' as math;

import 'package:flutter/material.dart';

class CategoryStatsBody extends StatelessWidget {
  final List<CategoryItem> data;

  const CategoryStatsBody({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: data.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: item.color,
                child: Icon(item.icon, size: 16, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Text(
                '${item.count} Orders',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF475569),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class CategoryItem {
  final String title;
  final int count;
  final Color color;
  final IconData icon;

  const CategoryItem(this.title, this.count, this.color, this.icon);
}

class ChartData {
  final double percentage;
  final Color color;
  final String label;

  ChartData({
    required this.percentage,
    required this.color,
    required this.label,
  });
}

class InteractiveDonutChart extends StatefulWidget {
  final List<ChartData> data;
  final double size;
  final double outerCircleWidth;
  final double outerCircleHeight;
  final double innerCircleWidth;
  final double innerCircleHeight;
  final double innerCircleTop;
  final double innerCircleLeft;

  const InteractiveDonutChart({
    super.key,
    required this.data,
    this.size = 300,
    this.outerCircleWidth = 200,
    this.outerCircleHeight = 200,
    this.innerCircleWidth = 160,
    this.innerCircleHeight = 158.44,
    this.innerCircleTop = 21,
    this.innerCircleLeft = 77.5,
  });

  @override
  State<InteractiveDonutChart> createState() => _InteractiveDonutChartState();
}

class _InteractiveDonutChartState extends State<InteractiveDonutChart> {
  int? hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: MouseRegion(
        onHover: (event) {
          final index = _getSegmentAtPosition(event.localPosition);
          if (index != hoveredIndex) {
            setState(() {
              hoveredIndex = index;
            });
          }
        },
        onExit: (_) {
          setState(() {
            hoveredIndex = null;
          });
        },
        child: CustomPaint(
          painter: DonutChartPainter(
            data: widget.data,
            outerCircleWidth: widget.outerCircleWidth,
            outerCircleHeight: widget.outerCircleHeight,
            innerCircleWidth: widget.innerCircleWidth,
            innerCircleHeight: widget.innerCircleHeight,
            innerCircleTop: widget.innerCircleTop,
            innerCircleLeft: widget.innerCircleLeft,
            hoveredIndex: hoveredIndex,
          ),
        ),
      ),
    );
  }

  int? _getSegmentAtPosition(Offset position) {
    final center = Offset(widget.size / 2, widget.size / 2);
    final dx = position.dx - center.dx;
    final dy = position.dy - center.dy;

    final distance = math.sqrt(dx * dx + dy * dy);
    final outerRadius = widget.outerCircleWidth / 2;
    final innerRadius = widget.innerCircleWidth / 2;

    if (distance < innerRadius || distance > outerRadius) {
      return null;
    }

    var angle = math.atan2(dy, dx);
    angle = (angle + math.pi / 2) % (2 * math.pi);
    if (angle < 0) angle += 2 * math.pi;

    double currentAngle = 0;
    for (int i = 0; i < widget.data.length; i++) {
      final sweepAngle = (widget.data[i].percentage / 100) * 2 * math.pi;
      if (angle >= currentAngle && angle < currentAngle + sweepAngle) {
        return i;
      }
      currentAngle += sweepAngle;
    }

    return null;
  }
}

class DonutChartPainter extends CustomPainter {
  final List<ChartData> data;
  final double outerCircleWidth;
  final double outerCircleHeight;
  final double innerCircleWidth;
  final double innerCircleHeight;
  final double innerCircleTop;
  final double innerCircleLeft;
  final int? hoveredIndex;

  DonutChartPainter({
    required this.data,
    required this.outerCircleWidth,
    required this.outerCircleHeight,
    required this.innerCircleWidth,
    required this.innerCircleHeight,
    required this.innerCircleTop,
    required this.innerCircleLeft,
    this.hoveredIndex,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // Calculate stroke width from outer and inner circle dimensions
    final outerRadius = outerCircleWidth / 2;
    final innerRadius = innerCircleWidth / 2;
    final strokeWidth = outerRadius - innerRadius;

    final radius = outerRadius - (strokeWidth / 2);
    final rect = Rect.fromCircle(center: center, radius: radius);

    // Draw outer white circle
    final outerWhiteCirclePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30;

    canvas.drawCircle(center, outerRadius + 4, outerWhiteCirclePaint);

    double startAngle = -math.pi / 2;

    for (int i = 0; i < data.length; i++) {
      final sweepAngle = (data[i].percentage / 100) * 2 * math.pi;

      final paint = Paint()
        ..color = data[i].color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.butt;

      canvas.drawArc(rect, startAngle, sweepAngle, false, paint);

      // Only draw percentage label when hovered
      if (hoveredIndex == i) {
        _drawPercentageLabel(
          canvas,
          center,
          radius,
          startAngle,
          sweepAngle,
          data[i],
        );
      }

      startAngle += sweepAngle;
    }

    // Draw inner white circle
    final innerWhiteCirclePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, innerRadius, innerWhiteCirclePaint);
  }

  void _drawPercentageLabel(
    Canvas canvas,
    Offset center,
    double radius,
    double startAngle,
    double sweepAngle,
    ChartData data,
  ) {
    final middleAngle = startAngle + sweepAngle / 2;
    final labelRadius = radius;
    var labelX = center.dx + labelRadius * math.cos(middleAngle);
    var labelY = center.dy + labelRadius * math.sin(middleAngle);

    // Adjust horizontal position based on angle
    // For angles in bottom-left (between 135° and 315°), move left
    // For angles in top-right (between 315° and 135°), move right
    final angleDegrees = (middleAngle * 180 / math.pi) % 360;
    final normalizedAngle = angleDegrees < 0 ? angleDegrees + 360 : angleDegrees;

    // Blue segment is around 90° to 162° (middle ~126°)
    if (normalizedAngle > 90 && normalizedAngle < 165) {
      // Blue segment - move very slightly down and left
      labelY += 3;
      labelX -= 3;
    } else if (normalizedAngle > 135 && normalizedAngle < 315) {
      // Bottom and left side - move left
      labelX -= 6;
    } else {
      // Top and right side - move right
      labelX += 6;
    }

    final textPainter = TextPainter(
      text: TextSpan(
        text: '${data.percentage.toInt()}%',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    // Fixed circle radius (no animation)
    const circleRadius = 20.0;

    final circlePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.1)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    canvas.drawCircle(
        Offset(labelX, labelY), circleRadius, shadowPaint);
    canvas.drawCircle(
        Offset(labelX, labelY), circleRadius, circlePaint);

    final borderPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawCircle(Offset(labelX, labelY), circleRadius, borderPaint);

    textPainter.paint(
      canvas,
      Offset(labelX - textPainter.width / 2, labelY - textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(DonutChartPainter oldDelegate) {
    return oldDelegate.data != data || oldDelegate.hoveredIndex != hoveredIndex;
  }
}
