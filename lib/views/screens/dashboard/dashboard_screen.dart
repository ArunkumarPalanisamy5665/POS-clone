import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/views/screens/dashboard/widgets/dashboard_card.dart';
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
          children: const [
            DashboardCard(
              title: 'Category Statistics',
              actionText: 'View All',
              icon: Icons.pie_chart_outline,
              body: CategoryStatsBody(
                data: [
                  CategoryItem('Take Away', 4898, Colors.blue, Icons.shopping_bag),
                  CategoryItem('Reservation', 4587, Colors.orange, Icons.restaurant),
                  CategoryItem('Delivery', 3565, Colors.green, Icons.delivery_dining),
                ],
              ),
            ),
            DashboardCard(
              title: 'Active Orders',
              actionText: 'Add New',
              icon: Icons.shopping_cart_outlined,
              body: Center(child: Text('Active Orders List')),
            ),
            DashboardCard(
              title: 'Sales Performance',
              actionText: 'View Report',
              icon: Icons.bar_chart,
              body: Center(child: Text('Sales Chart')),
            ),
          ],
        ),
      ),
    );
  }
}
