

import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/views/widgets/appDrawer/custom_drawer.dart';
import 'package:new_hrms_flutter/views/widgets/common/drop_down_cards.dart';
import 'package:new_hrms_flutter/views/widgets/responsive/responsive.dart';
import 'package:new_hrms_flutter/views/widgets/sideMenu/side_menu.dart';


import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';


class AppBreakpoints {
  static const mobile = 600.0;
  static const tablet = 1024.0;
}

String selectedMenu = 'Orders';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final isMobile = width < AppBreakpoints.mobile;
        final isTablet =
            width >= AppBreakpoints.mobile && width < AppBreakpoints.tablet;
        final isDesktop = width >= AppBreakpoints.tablet;

        return Scaffold(
          backgroundColor: const Color(0xFFF8F8F8),

          drawer: isMobile ? Drawer(child: _buildSidebar()) : null,

          body: Row(
              children: [

                Container(
                  width: 60,
                  decoration: BoxDecoration(
                    color: AppColors.greySide,
                  ),
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [

                              const SizedBox(height: 20),
                              ...List.generate(
                                dashboardItems.length,
                                    (index) {
                                  final item = dashboardItems[index];
                                  return ListTile(
                                    leading: Icon(item.icon, size: 18),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Center(child: _iconButton(Icons.notifications)),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Column(
                    children: [

                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            if (isDesktop || isTablet)
                              SizedBox(width: 260, child: _buildSidebar()),

                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    _buildTopBar(isMobile),
                                    _buildHeaderBar(isMobile),
                                    _buildMainContent(width),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]
          ),
        );
      },
    );
  }


  Widget _buildTopBar(bool isMobile) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFE2E8F0))),
      ),
      child: Row(
        children: [
          if (isMobile)
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          if (!isMobile) _buildFilterTabs(),
          const Spacer(),
          _buildTopActions(),
        ],
      ),
    );
  }

  Widget _buildFilterTabs() {
    final tabs = ['POS', 'Orders', 'Kitchen', 'Reservation', 'Table'];
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: tabs
            .map(
              (e) => Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Text(
              e,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        )
            .toList(),
      ),
    );
  }

  Widget _buildTopActions() {
    return Row(
      children: [
        _button('Upgrade', primary: true),
        const SizedBox(width: 10),
        _iconButton(Icons.notifications),
      ],
    );
  }

  Widget _buildSidebar() {
    final menu = [
      'Dashboard',
      'POS',
      'Orders',
      'Kitchen',
      'Reservation'
    ];


    return Container(
      height: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border:  Border(
          top: BorderSide(color: Colors.black.withAlpha(
            (0.2 * 255).toInt(),
          ), width: 0.60),
          left: BorderSide(color: Colors.black.withAlpha(
            (0.2 * 255).toInt(),
          ), width: 0.60),
          right: BorderSide(color: Colors.black.withAlpha(
            (0.2 * 255).toInt(),
          ), width: 0.60),
        ),
        borderRadius: BorderRadius.circular(3),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            DropDownCards(
              value: selectedMenu,
              items: const [
                'New Order',
                'Order List',
                'Returns',
                'Reports',
              ],
              onChanged: (value) {
                setState(() {
                  selectedMenu = value;
                });
              },
              childBuilder: (value) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.shopping_cart, size: 18),
                    const SizedBox(width: 8),
                    Text(value),
                    const SizedBox(width: 6),
                    const Icon(Icons.keyboard_arrow_down, size: 18),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
            ...menu.map(_menuItem),
          ],),
      ),
    );
  }


  Widget _menuItem(String title) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(

        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            const Icon(Icons.dashboard, size: 18),
            const SizedBox(width: 10),
            Text(title),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderBar(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Dashboard',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          if (!isMobile)
            Row(
              children: [
                _button('Sync'),
                const SizedBox(width: 10),
                _button('Export'),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildMainContent(double width) {
    final crossAxisCount =
    width < 600 ? 1 : width < 1024 ? 2 : 4;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          /// KPI GRID
          GridView.count(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              _KpiCard('Orders', '6986'),
              _KpiCard('Sales', '\$7516'),
              _KpiCard('Avg Value', '\$25.36'),
              _KpiCard('Reservations', '496'),
            ],
          ),

          const SizedBox(height: 24),

          /// CHARTS STACK
          _section('Total Revenue', height: 220),
          const SizedBox(height: 20),
          _section('Top Selling Items', height: 200),
        ],
      ),
    );
  }

  Widget _section(String title, {double height = 180}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 16),
          Container(
            height: height,
            color: const Color(0xFFF1F5F9),
            alignment: Alignment.center,
            child: const Text('Placeholder'),
          ),
        ],
      ),
    );
  }

  Widget _button(String text, {bool primary = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: primary ? const Color(0xFF0C76E1) : Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: primary ? null : Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        text,
        style: TextStyle(color: primary ? Colors.white : Colors.black),
      ),
    );
  }

  Widget _iconButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Icon(icon, size: 18),
    );
  }}

class _KpiCard extends StatelessWidget {
  final String title;
  final String value;

  const _KpiCard(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value,
              style:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(title),
        ],
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const DashboardCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.15),
              radius: 32,
              child: Icon(
                icon,
                size: 30,
                color: color,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardItem {
  final String title;
  final IconData icon;
  final Color color;

  DashboardItem(this.title, this.icon, this.color);
}

class DashboardIcons {
  final IconData icon;
  final Color color;

  DashboardIcons( this.icon, this.color);
}

final List<DashboardItem> dashboardItems = [
  DashboardItem("Employees", Icons.people_alt_rounded, Colors.blue),
  DashboardItem("Attendance", Icons.access_time_filled, Colors.green),
  DashboardItem("Leave", Icons.calendar_month, Colors.orange),
  DashboardItem("Payroll", Icons.payments, Colors.pink),
  DashboardItem("Departments", Icons.business_center, Colors.purple),
  DashboardItem("Tasks", Icons.task, Colors.indigo),
  DashboardItem("Settings", Icons.settings, Colors.grey),
  DashboardItem("Reports", Icons.analytics_outlined, Colors.red),
];

final List<DashboardIcons> dashboardIcons = [
  DashboardIcons(Icons.people_alt_rounded, Colors.blue),
  DashboardIcons(Icons.access_time_filled, Colors.green),
  DashboardIcons( Icons.calendar_month, Colors.orange),
  DashboardIcons(Icons.payments, Colors.pink),
  DashboardIcons( Icons.business_center, Colors.purple),
  DashboardIcons( Icons.task, Colors.indigo),
  DashboardIcons( Icons.settings, Colors.grey),
  DashboardIcons( Icons.analytics_outlined, Colors.red),
];



