import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/core/constants/app_export.dart';
import 'package:new_hrms_flutter/views/screens/home/widgets/dashBoardWidgets/graph_chart_widget.dart';
import 'package:new_hrms_flutter/views/screens/home/widgets/dashBoardWidgets/trending_menu.dart';
import 'package:new_hrms_flutter/views/screens/home/widgets/linear_chart_box.dart';
import 'package:new_hrms_flutter/views/widgets/common/drop_down_cards.dart';
import 'package:new_hrms_flutter/views/widgets/dashboard/reservation_list.dart';
import 'package:new_hrms_flutter/views/widgets/responsive/responsive.dart';

import 'package:new_hrms_flutter/views/widgets/dashboard/active_order_list.dart';
import 'package:new_hrms_flutter/views/widgets/dashboard/dashboard_card.dart';
import '../../widgets/common/custom_checkbox.dart';
import '../../widgets/common/custom_container.dart';
import '../../widgets/common/custom_divider.dart';
import '../../widgets/common/custom_icon_contain.dart';
import '../../widgets/dashboard/category_statistics.dart';

import '../../../core/constants/app_colors.dart';
import '../../widgets/dashboard/sales_performance_card.dart';
import 'home_screen.dart';

class AppBreakpoints {
  static const mobile = 600.0;
  static const tablet = 1024.0;
}

String selectedMenu = 'Orders';
String selectedPeriod = 'Weekly';
String selectedTopSelling = 'All';
bool isChecked = false;

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainHome> {
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
                decoration: BoxDecoration(color: AppColors.greySide),
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            ...List.generate(dashboardItems.length, (index) {
                              final item = dashboardItems[index];
                              return ListTile(
                                leading: Icon(item.icon, size: 18),
                              );
                            }),
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
            ],
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
          if (Responsive.isDesktop(context)) _buildFilterTabs(),
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
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
    final menu = ['Dashboard', 'POS', 'Orders', 'Kitchen', 'Reservation'];

    return Container(
      height: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.black.withAlpha((0.2 * 255).toInt()),
            width: 0.60,
          ),
          left: BorderSide(
            color: Colors.black.withAlpha((0.2 * 255).toInt()),
            width: 0.60,
          ),
          right: BorderSide(
            color: Colors.black.withAlpha((0.2 * 255).toInt()),
            width: 0.60,
          ),
        ),
        borderRadius: BorderRadius.circular(3),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropDownCards(
              value: selectedMenu,
              items: const ['New Order', 'Order List', 'Returns', 'Reports'],
              onChanged: (value) {
                setState(() {
                  selectedMenu = value;
                });
              },
              childBuilder: (value) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
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
          ],
        ),
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
    final crossAxisCount = width < 600
        ? 1
        : width < 1024
        ? 2
        : 4;

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
              MetricCard(
                title: 'Total Orders',
                value: '6986',
                percentageChange: '+12.5%',
                isPositive: true,
                iconColor: Color(0xFF9C27B0),
                icon: Icons.shopping_bag,
              ),
              MetricCard(
                title: 'Total Sales',
                value: '\$7516',
                percentageChange: '+12.5%',
                isPositive: true,
                iconColor: Color(0xFF2196F3),
                icon: Icons.attach_money,
              ),
              MetricCard(
                title: 'Average Value',
                value: '\$25.36',
                percentageChange: '-8.5%',
                isPositive: false,
                iconColor: Color(0xFFFF9800),
                icon: Icons.payments,
              ),
              MetricCard(
                title: 'Reservations',
                value: '496',
                percentageChange: '+12.7%',
                isPositive: true,
                iconColor: Color(0xFF4CAF50),
                icon: Icons.event_seat,
              ),
            ],
          ),

          const SizedBox(height: 24),

          RevenueCard(),

          if (!Responsive.isDesktop(context)) ...[
            const SizedBox(height: 24),
            const GraphChartPage(),
            const SizedBox(height: 24),
            TopSellingCard(),
            const SizedBox(height: 24),
            TrendingMenu(),
          ] else ...[
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(flex: 3, child: GraphChartPage()),
                const SizedBox(width: 24),
                Expanded(flex: 2, child: TopSellingCard()),
              ],
            ),
            const SizedBox(height: 24),
            TrendingMenu(),

          ],

          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: GridView.count(
              crossAxisCount: Responsive.isDesktop(context) ? 2 : 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.90,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                DashboardCard(
                  title: 'Category Statistics',
                  actionText: 'View All',
                  imagePath: 'assets/images/category_statistics.png',
                  body: Column(
                    children: [
                      InteractiveDonutChart(
                        data: [
                          ChartData(
                            percentage: 30,
                            color: Colors.green,
                            label: 'Category A',
                          ),
                          ChartData(
                            percentage: 20,
                            color: Colors.orange,
                            label: 'Category B',
                          ),
                          ChartData(
                            percentage: 20,
                            color: Colors.blue,
                            label: 'Category C',
                          ),
                          ChartData(
                            percentage: 35,
                            color: Colors.purple,
                            label: 'Category D',
                          ),
                        ],
                        size: 185,
                        outerCircleWidth: 170,
                        outerCircleHeight: 170,
                        innerCircleWidth: 100,
                        innerCircleHeight: 88.44,
                        innerCircleTop: 10,
                        innerCircleLeft: 77.5,
                      ),
                      const CategoryStatsBody(
                        data: [
                          CategoryItem(
                            'Take Away',
                            4898,
                            Colors.blue,
                            Icons.shopping_bag,
                          ),
                          CategoryItem(
                            'Reservation',
                            4587,
                            Colors.orange,
                            Icons.restaurant,
                          ),
                          CategoryItem(
                            'Delivery',
                            3565,
                            Colors.green,
                            Icons.delivery_dining,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                DashboardCard(
                  title: 'Active Orders',
                  actionText: 'Add New',
                  imagePath: 'assets/images/shopping_cart.png',
                  body: ActiveOrders(
                    orders: [
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
                    ],
                  ),
                ),
                const DashboardCard(
                  title: 'Sales Performance',
                  actionText: 'View Report',
                  imagePath: 'assets/images/sales_performance.png',
                  body: SalesPerformanceCard(
                    percentage: 40,
                    totalOrders: 6589,
                    totalSales: 56589,
                    ordersGrowth: 6,
                    salesGrowth: 12,
                  ),
                ),
                DashboardCard(
                  title: 'Reservations',
                  actionText: 'All Orders',
                  imagePath: 'assets/images/reservation.png',
                  body:ReservationsWidget(reservations: [
                    Reservation(
                      date: DateTime(2025, 11, 8),
                      customerName: 'Elijah Thompson',
                      status: ReservationStatus.booked,
                      time: '10:45',
                      tableNumber: '3',
                      guests: 2,
                    ),
                    Reservation(
                      date: DateTime(2025, 11, 12),
                      customerName: "Liam O'Connor",
                      status: ReservationStatus.booked,
                      time: '10:45',
                      tableNumber: '4',
                      guests: 5,
                    ),
                    Reservation(
                      date: DateTime(2025, 11, 6),
                      customerName: 'Michael Carter',
                      status: ReservationStatus.booked,
                      time: '10:45',
                      tableNumber: '8',
                      guests: 6,
                    ),
                    Reservation(
                      date: DateTime(2025, 11, 4),
                      customerName: 'James Smith',
                      status: ReservationStatus.paid,
                      time: '10:45',
                      tableNumber: '8',
                      guests: 5,
                    ),
                    Reservation(
                      date: DateTime(2025, 11, 2),
                      customerName: 'Walk in Customer',
                      status: ReservationStatus.cancelled,
                      time: '10:45',
                      tableNumber: '2',
                      guests: 5,
                    ),
                  ]),
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
  }
}

class RevenueCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.7,
        padding: EdgeInsets.only(top: 30, left: 14, right: 14),
        borderRadius: BorderRadius.circular(5),
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: Colors.black.withAlpha((0.2 * 255).toInt()), width: 0.50)
        ),
        onTap: () {
          print("Tapped");
        },
        child:Column(
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'Weekly',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
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
                      style: TextStyle(fontSize: 12, color: Colors.grey),
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
            Spacer(),
            SizedBox(
              height: 180,
              child: LinearChartBox(
                data: weeklyData,
                lineColor: Colors.blue,
                height: 260,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ));

  }
}


class TopSellingCard extends StatefulWidget {
  const TopSellingCard({super.key});

  @override
  State<TopSellingCard> createState() => _TopSellingCardState();
}

class _TopSellingCardState extends State<TopSellingCard> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.7,
        padding: EdgeInsets.only(top: 30, left: 14, right: 14),
        borderRadius: BorderRadius.circular(5),
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: Colors.black.withAlpha((0.2 * 255).toInt()), width: 0.50)
        ),
        onTap: () {
          print("Tapped");
        },
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomIconContainer(
                      width: 20,
                      height: 20,
                      iconSize: 12,
                      borderRadius: 4,
                      svgAsset: AppAssets.foodIcon,
                      onTap: () {},
                      borderColor: Colors.black.withAlpha((0.2 * 255).toInt()),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(width: 8),

                    Text(
                      'Top Selling Item',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),

                DropDownCards(
                  value: selectedTopSelling,
                  items: const ['Sea food', 'Pizza', 'Salads'],
                  onChanged: (value) {
                    setState(() {
                      selectedTopSelling = value;
                    });
                  },
                  childBuilder: (value) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          value,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                            fontSize: 12,
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(Icons.keyboard_arrow_down, size: 18),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            CustomDivider(
              thickness: 0.76,
              verticalPadding: 15,
              color: Colors.black.withAlpha((0.2 * 255).toInt()),
            ),

            CustomContainer(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.065,
              borderRadius: BorderRadius.circular(5),
              alignment: Alignment.center,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(color: AppColors.lightGg,),
              onTap: () {
                print("Tapped");
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\u{1F525}  ',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Most Ordered : Veggie Supreme Pizza',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            CustomContainer(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1,
              borderRadius: BorderRadius.circular(5),
              alignment: Alignment.center,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black.withAlpha((0.2 * 255).toInt()),
                  width: 0.65,
                ),
              ),
              onTap: () {
                print("Tapped");
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage('assets/pizza.png'),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
            ),

            Spacer(),
            ListView.builder(
              itemCount: menuList.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final item = menuList[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: MenuItem(
                    number: (index + 2).toString().padLeft(2, '0'),
                    name: item.name,
                    orders: item.orders,
                    color: item.color,
                  ),
                );
              },
            ),
          ],
        ));
  }
}

class GraphChartPage extends StatefulWidget {
  const GraphChartPage({super.key});

  @override
  State<GraphChartPage> createState() => _GraphChartPageState();
}

class _GraphChartPageState extends State<GraphChartPage> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.7,
      padding: EdgeInsets.only(top: 30, left: 14, right: 14),
      borderRadius: BorderRadius.circular(5),
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: Colors.black.withAlpha((0.2 * 255).toInt()), width: 0.50)
      ),
      onTap: () {
        print("Tapped");
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIconContainer(
                      width: 20,
                      height: 20,
                      iconSize: 12,
                      borderRadius: 4,
                      svgAsset: AppAssets.dollarIcon,
                      onTap: () {},
                      borderColor: Colors.black.withAlpha((0.2 * 255).toInt()),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(width: 8),

                    Text(
                      'Total Revenue',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),

                DropDownCards(
                  value: selectedPeriod,
                  items: const ['Weekly', 'Monthly', 'yearly'],
                  onChanged: (value) {
                    setState(() {
                      selectedPeriod = value;
                    });
                  },
                  childBuilder: (value) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(value, style: const TextStyle(fontSize: 12)),
                        const SizedBox(width: 6),
                        const Icon(Icons.keyboard_arrow_down, size: 18),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          CustomDivider(
            thickness: 0.76,
            verticalPadding: 5,
            color: Colors.black.withAlpha((0.2 * 255).toInt()),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.arrow_upward_outlined,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Revenue',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontSize: 12,
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      const Text(
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

              CustomCheckbox(
                value: isChecked,
                width: 18,
                height: 18,
                label: 'Revenue',
                labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 14,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                ),
                isCircular: false,
                borderRadius: 4,
                borderColor: AppColors.primaryColor,
                onChanged: (val) {
                  setState(() => isChecked = val);
                },
              ),
            ],
          ),
          const SizedBox(height: 14),

          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.330,
              child: GraphChartWidget(
                data: graphWeeklyData,
                // highlightIndex: 2, // day highlighted
              ),
            ),
          ),
        ],
      ),
    );

  }
}

class DashboardItemCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const DashboardItemCard({
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
              child: Icon(icon, size: 30, color: color),
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

  DashboardIcons(this.icon, this.color);
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
  DashboardIcons(Icons.calendar_month, Colors.orange),
  DashboardIcons(Icons.payments, Colors.pink),
  DashboardIcons(Icons.business_center, Colors.purple),
  DashboardIcons(Icons.task, Colors.indigo),
  DashboardIcons(Icons.settings, Colors.grey),
  DashboardIcons(Icons.analytics_outlined, Colors.red),
];

class MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String percentageChange;
  final bool isPositive;
  final Color iconColor;
  final IconData icon;

  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    required this.percentageChange,
    required this.isPositive,
    required this.iconColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          Positioned(
            top: 0,
            right: 70,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: isPositive
                    ? const Color(0xFF10B981)
                    : const Color(0xFFEF4444),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                percentageChange,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [iconColor.withOpacity(0.8), iconColor],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: iconColor.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(icon, color: Colors.white, size: 28),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
