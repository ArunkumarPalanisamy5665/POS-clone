import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/views/widgets/dashboard/active_order_list.dart';
import 'package:new_hrms_flutter/views/widgets/dashboard/dashboard_card.dart';

import '../../widgets/dashboard/category_statistics.dart';


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
          childAspectRatio: 0.90,
          children: [
            DashboardCard(
              title: 'Category Statistics',
              actionText: 'View All',
             imagePath: 'assets/images/category_statistics.png',
              body: Column(
                children: [
                  InteractiveDonutChart(
                    data: [
                      ChartData(percentage: 30, color: Colors.green, label: 'Category A'),
                      ChartData(percentage: 20, color: Colors.orange, label: 'Category B'),
                      ChartData(percentage: 20, color: Colors.blue, label: 'Category C'),
                      ChartData(percentage: 35, color: Colors.purple, label: 'Category D'),
                    ],
                    size: 185,
                    outerCircleWidth: 170,
                    outerCircleHeight: 170,
                    innerCircleWidth: 100,
                    innerCircleHeight:88.44,
                    innerCircleTop: 10,
                    innerCircleLeft: 77.5,
                  ),
                  const CategoryStatsBody(
                    data: [
                      CategoryItem('Take Away', 4898, Colors.blue, Icons.shopping_bag),
                      CategoryItem('Reservation', 4587, Colors.orange, Icons.restaurant),
                      CategoryItem('Delivery', 3565, Colors.green, Icons.delivery_dining),
                    ],
                  ),
                ],
              ),
            ),
            DashboardCard(
              title: 'Active Orders',
              actionText: 'Add New',
              imagePath: 'assets/images/shopping_cart.png',
              body: ActiveOrders(orders: [
                ActiveOrderList(
                  name: "Maria Gonzalez",
                  type: "Dine In",
                  status: "In Kitchen",
                  showTableNo: true,
                  tableNo: "3",
                ),
                ActiveOrderList(
                  name: "Andrew Fletcher",
                  type: "Reservation",
                  status: "Cancelled",
                ),
                ActiveOrderList(
                  name: "Morgan Evans",
                  type: "Take Away",
                  status: "Served",
                ),
                ActiveOrderList(
                  name: "Walk in Customer",
                  type: "Dine In",
                  status: "In Kitchen",
                  showTableNo: true,
                  tableNo: "5",
                ),
                ActiveOrderList(
                  name: "Walk in Customer",
                  type: "Reservation",
                  status: "Cancelled",
                ),
              ]),
            ),
            const DashboardCard(
              title: 'Sales Performance',
              actionText: 'View Report',
              imagePath: 'assets/images/sales_performance.png',
              body: Center(child: Text('Sales Chart')),
            ),
            const DashboardCard(
              title: 'Reservations',
              actionText: 'All Orders',
              imagePath: 'assets/images/reservation.png',
              body: Center(child: Text('Active Orders List')),
              showDropdown: true,

            ),
            const DashboardCard(
              title: 'Tables Available',
              actionText: 'View All',
              imagePath: 'assets/images/tables_available.png',
              body: Center(child: Text('Sales Chart')),
            ),
            const DashboardCard(
              title: 'Notifications',
              actionText: 'View All',
              imagePath: 'assets/images/notifications.png',
              body: Center(child: Text('Active Orders List')),
            ),

          ],
        ),
      ),
    );
  }
}
