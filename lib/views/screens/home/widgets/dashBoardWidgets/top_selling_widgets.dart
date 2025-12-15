import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String number;
  final String name;
  final int orders;
  final int maxOrders;
  final Color color;

  const MenuItem({
    super.key,
    required this.number,
    required this.name,
    required this.orders,
    required this.color,
    this.maxOrders = 520,
  });

  @override
  Widget build(BuildContext context) {
    final progress = (orders / maxOrders).clamp(0.0, 1.0);

    return Row(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 12),

        Expanded(
          child: Text(
            name,
            style: const TextStyle(fontSize: 12),
          ),
        ),

        SizedBox(
          width: 120,
          height: 6,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 6,
            ),
          ),
        ),

        const SizedBox(width: 8),

        Text(
          orders.toString(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
