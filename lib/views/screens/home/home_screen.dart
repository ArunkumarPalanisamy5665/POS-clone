import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:new_hrms_flutter/views/screens/home/widgets/linear_chart_box.dart';

import '../../../domain/models/dashBoardModel/bar_chart_point.dart';
import '../../../domain/models/dashBoardModel/menu_data.dart';



final weeklyData = [
  ChartPoint('Mon', 2),
  ChartPoint('Tue', 2.5),
  ChartPoint('Wed', 3.5),
  ChartPoint('Thu', 3),
  ChartPoint('Fri', 2.8),
  ChartPoint('Sat', 3.2),
  ChartPoint('Sun', 2.5),
];

final List<MenuData> menuList = [
  MenuData('Chicken Burger', 420, Colors.orange),
  MenuData('Veg Pizza', 310, Colors.green),
  MenuData('Pasta', 260, Colors.blue),
  MenuData('French Fries', 180, Colors.purple),
];


String selectedPeriod = 'Weekly';

final graphWeeklyData = [
  BarChartPoint('Mon', 1800),
  BarChartPoint('Tue', 1600),
  BarChartPoint('Wed', 3500),
  BarChartPoint('Thu', 1900),
  BarChartPoint('Fri', 1700),
  BarChartPoint('Sat', 1500),
  BarChartPoint('Sun', 1400),
];


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.store, color: Colors.white),
            ),
            const SizedBox(width: 12),
            const Text(
              'Streak House',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.sync, color: Colors.black87),
            label: const Text(
              'Sync Data',
              style: TextStyle(color: Colors.black87),
            ),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () {},
            child: const Text('Export'),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () {},
            child: const Text('9 Dec 25 - 15 Dec 25'),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 24),
            // Stats Cards
            Row(
              children: [
                Expanded(
                  child: StatsCard(
                    title: 'Total Orders',
                    value: '6986',
                    percentage: '+12.5%',
                    iconColor: Colors.purple,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: StatsCard(
                    title: 'Total Sales',
                    value: '\$7516',
                    percentage: '+12.5%',
                    iconColor: Colors.blue,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: StatsCard(
                    title: 'Average Value',
                    value: '\$25.36',
                    percentage: '-8.5%',
                    isNegative: true,
                    iconColor: Colors.orange,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: StatsCard(
                    title: 'Reservations',
                    value: '496',
                    percentage: '+12.5%',
                    iconColor: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            // Charts Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: RevenueCard(),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TopSellingCard(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final String percentage;
  final Color iconColor;
  final bool isNegative;

  const StatsCard({
    Key? key,
    required this.title,
    required this.value,
    required this.percentage,
    required this.iconColor,
    this.isNegative = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.shopping_bag,
                  color: iconColor,
                  size: 22,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isNegative
                  ? Colors.red.withOpacity(0.1)
                  : Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              percentage,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isNegative ? Colors.red : Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RevenueCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Revenue',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'Weekly',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.trending_up, color: Colors.white),
              ),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Revenue',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '\$3989',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 180,
            child: LinearChartBox(
              data: weeklyData,
              lineColor: Colors.blue,
              height: 260,
            ),
          ),
        ],
      ),
    );
  }
}

class TopSellingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Top Selling Item',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'All',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/pizza.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.orange.withOpacity(0.1),
                    ),
                    child: const Icon(
                      Icons.local_pizza,
                      color: Colors.orange,
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Most Ordered : Veggie Supreme Pizza',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Veggie Supreme Pizza',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                       Text(
                        'No of Orders : 520',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            itemCount: menuList.length,
            shrinkWrap: true,
            physics:const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final item = menuList[index];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: MenuItem(
                  number: (index + 1).toString().padLeft(2, '0'),
                  name: item.name,
                  orders: item.orders,
                  color: item.color,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String number;
  final String name;
  final int orders;
  final Color color;

  const MenuItem({
    Key? key,
    required this.number,
    required this.name,
    required this.orders,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '#${number}',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black.withOpacity(0.675),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          width: 120,
          height: 6,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(3),
          ),
          child: Stack(
            children: [
              Container(
                width: 120 * (orders / 520),
                height: 6,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Text(
          orders.toString(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}