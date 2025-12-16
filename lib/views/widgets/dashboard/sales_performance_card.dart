import 'package:flutter/material.dart';
import 'dart:math' as math;

// Main reusable component
class SalesPerformanceCard extends StatelessWidget {
  final double percentage;
  final int totalOrders;
  final double totalSales;
  final double ordersGrowth;
  final double salesGrowth;

  const SalesPerformanceCard({
    Key? key,
    required this.percentage,
    required this.totalOrders,
    required this.totalSales,
    required this.ordersGrowth,
    required this.salesGrowth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Speedometer Indicator Section
        const SpeedometerIndicator(percentage: 80),

        const SizedBox(height: 20),
        // Stats Cards
        StatCard(
          imagePath: 'assets/images/shopping_cart.png',
          iconColor: Colors.blue,
          title: 'Total Orders',
          value: totalOrders.toString(),
          growth: ordersGrowth,
          backgroundImage: 'assets/images/stats_card.png',
        ),
        const SizedBox(height: 2),
        StatCard(
          imagePath: 'assets/images/verified_check.png',
          iconColor: Colors.green,
          title: 'Total Sales',
          value: '\$${totalSales.toStringAsFixed(0)}',
          growth: salesGrowth,
          backgroundImage: 'assets/images/stats_card.png',
        ),
      ],
    );
  }
}

// Speedometer indicator widget - half circle from left to right with centered text
class SpeedometerIndicator extends StatelessWidget {
  final double percentage;

  const SpeedometerIndicator({Key? key, required this.percentage})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 180,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Speedometer bars
          CustomPaint(
            size: const Size(250, 200),
            painter: IndicatorPainter(percentage: percentage),
          ),
          // Percentage text in the center
          Positioned(
            top: 90,
            bottom: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${percentage.toInt()}%',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Sales This Month',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.4),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IndicatorPainter extends CustomPainter {
  final double percentage;

  IndicatorPainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    const barCount = 22;
    final centerX = size.width / 2;
    final centerY = size.height * 0.90;
    final center = Offset(centerX, centerY);
    final radius = size.width * 0.35;

    // Half circle from left to right (bottom semicircle)
    const startAngle = math.pi; // Start from left (180 degrees)
    const sweepAngle = math.pi; // Sweep 180 degrees to right

    final activeBarCount = (barCount * (percentage / 100)).ceil();

    for (int i = 0; i < barCount; i++) {
      final angle = startAngle + (i * sweepAngle / (barCount - 1));
      final isActive = i < activeBarCount;

      // Calculate bar dimensions with spacing
      final barHeight = radius * 0.65;
      final barWidth = radius * 0.16;
      final startRadius = radius * 1.3;

      // Calculate bar position
      final x = center.dx + math.cos(angle) * (startRadius + barHeight / 2);
      final y = center.dy + math.sin(angle) * (startRadius + barHeight / 2);

      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(angle + math.pi / 2);

      // Draw bar with shadow effect for active bars
      if (isActive) {
        final shadowPaint = Paint()
          ..color = Colors.orange.withOpacity(0.3)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

        final shadowRect = RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: const Offset(0, 2),
            width: barWidth,
            height: barHeight,
          ),
          Radius.circular(barWidth / 2),
        );
        canvas.drawRRect(shadowRect, shadowPaint);
      }

      // Draw main bar
      final paint = Paint()
        ..color = isActive ? const Color(0xFFFFA726) : Colors.grey[200]!
        ..style = PaintingStyle.fill;

      final rect = RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset.zero,
          width: barWidth,
          height: barHeight,
        ),
        Radius.circular(barWidth / 2),
      );

      canvas.drawRRect(rect, paint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(IndicatorPainter oldDelegate) {
    return oldDelegate.percentage != percentage;
  }
}

// Stat card widget

// Stat card widget with background image
class StatCard extends StatelessWidget {
  final String imagePath;
  final IconData? icon;
  final Color iconColor;
  final String title;
  final String value;
  final double growth;
  final String? backgroundImage; // Optional background image path

  const StatCard({
    Key? key,
    required this.imagePath,
    this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
    required this.growth,
    this.backgroundImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        if (backgroundImage != null)
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(backgroundImage!, fit: BoxFit.cover),
            ),
          ),

        // Content
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: backgroundImage == null
                ? Colors.grey[50]
                : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: iconColor,
                  shape: BoxShape.circle,
                  boxShadow: backgroundImage != null
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: Image.asset(imagePath, height: 16, width: 16,color: Colors.white,),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        color: backgroundImage != null
                            ? Colors.grey[600]
                            : Colors.grey[600],
                        fontWeight: backgroundImage != null
                            ? FontWeight.w500
                            : FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: backgroundImage != null
                            ? Colors.black
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: backgroundImage != null
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Text(
                  '+${growth.toInt()}%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
