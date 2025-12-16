import 'package:flutter/material.dart';

import '../common/custom_divider.dart';

class NotificationItem {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final String title;
  final String timeAgo;

  NotificationItem({
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.title,
    required this.timeAgo,
  });
}

class NotificationsList extends StatelessWidget {
  const NotificationsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todayNotifications = [
      NotificationItem(
        icon: Icons.shopping_bag_outlined,
        iconColor: const Color(0xFF4A90E2),
        backgroundColor: const Color(0xFFE3F2FD),
        title: 'New order from Table #12 (3 items)',
        timeAgo: '20 min ago',
      ),
      NotificationItem(
        icon: Icons.shopping_cart_outlined,
        iconColor: const Color(0xFFFF6B35),
        backgroundColor: const Color(0xFFFFE8E0),
        title: 'Order #124 confirmed and sent to Chef.',
        timeAgo: '35 min ago',
      ),
      NotificationItem(
        icon: Icons.attach_money,
        iconColor: const Color(0xFF4CAF50),
        backgroundColor: const Color(0xFFE8F5E9),
        title: '\$850 received via UPI for Order #124.',
        timeAgo: '40 min ago',
      ),
    ];

    final yesterdayNotifications = [
      NotificationItem(
        icon: Icons.calendar_today_outlined,
        iconColor: const Color(0xFF4A90E2),
        backgroundColor: const Color(0xFFE3F2FD),
        title: 'Reservation Andrew Merkel 7:30 PM.',
        timeAgo: '40 hrs ago',
      ),
      NotificationItem(
        icon: Icons.info_outline,
        iconColor: const Color(0xFFFF6B35),
        backgroundColor: const Color(0xFFFFE8E0),
        title: 'Low stock: Cheese (5 units left).',
        timeAgo: '40 Hrs Ago',
      ),
    ];

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildSection('Today', todayNotifications),
        const SizedBox(height: 12),
        _buildSection('Yesterday', yesterdayNotifications),
      ],
    );
  }

  Widget _buildSection(String title, List<NotificationItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 20),
        ...items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isLast = index == items.length - 1;
          return _buildNotificationItem(item, isLast);
        }).toList(),
      ],
    );
  }

  Widget _buildNotificationItem(NotificationItem item, bool isLast) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: item.backgroundColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: item.iconColor,
                  width: 1,
                ),
              ),
              child: Icon(
                item.icon,
                color: item.iconColor,
                size: 16,
              ),
            ),
            if (!isLast)
              DashedVerticalLine(
                dashGap: 1,
                thickness: 0.5,
                height: 30,
                color: Colors.grey.shade400,
              )

          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1.4,
                    ),
                    children: _parseTitle(item.title),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 16,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      item.timeAgo,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<TextSpan> _parseTitle(String title) {
    final boldPatterns = [
      RegExp(r'Table #\d+'),
      RegExp(r'Order #\d+'),
      RegExp(r'\$\d+'),
      RegExp(r'Andrew Merkel'),
      RegExp(r'\d+:\d+ PM'),
      RegExp(r'Cheese'),
      RegExp(r'\(\d+ units left\)'),
      RegExp(r'\(\d+ items\)'),
    ];

    List<TextSpan> spans = [];
    String remaining = title;
    int lastIndex = 0;

    while (remaining.isNotEmpty) {
      RegExpMatch? earliestMatch;
      RegExp? matchedPattern;

      for (var pattern in boldPatterns) {
        var match = pattern.firstMatch(remaining);
        if (match != null) {
          if (earliestMatch == null || match.start < earliestMatch.start) {
            earliestMatch = match;
            matchedPattern = pattern;
          }
        }
      }

      if (earliestMatch != null) {
        if (earliestMatch.start > 0) {
          spans.add(TextSpan(
            text: remaining.substring(0, earliestMatch.start),
            style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 14),
          ));
        }

        spans.add(TextSpan(
          text: earliestMatch.group(0),
          style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 14),
        ));

        remaining = remaining.substring(earliestMatch.end);
      } else {
        spans.add(TextSpan(
          text: remaining,
          style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 14),
        ));
        break;
      }
    }

    return spans;
  }
}