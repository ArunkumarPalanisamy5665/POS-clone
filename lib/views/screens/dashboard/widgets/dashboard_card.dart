import 'package:flutter/material.dart';

/// DASHBOARD CARD
class DashboardCard extends StatelessWidget {
  final String title;
  final String actionText;
  final IconData icon;
  final Widget body;

  const DashboardCard({
    super.key,
    required this.title,
    required this.actionText,
    required this.icon,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          _Header(icon: icon, title: title, actionText: actionText),
          const _Divider(),
          Expanded(child: body),
        ],
      ),
    );
  }
}

/// HEADER
class _Header extends StatelessWidget {
  final IconData icon;
  final String title;
  final String actionText;

  const _Header({
    required this.icon,
    required this.title,
    required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(actionText),
        ),
      ],
    );
  }
}

/// DIVIDER
class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Divider(thickness: 1),
    );
  }
}

/// CATEGORY BODY
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
              Text(item.title),
              const Spacer(),
              Text(
                '${item.count} Orders',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

/// DATA MODEL
class CategoryItem {
  final String title;
  final int count;
  final Color color;
  final IconData icon;

  const CategoryItem(this.title, this.count, this.color, this.icon);
}
