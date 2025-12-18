import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/core/constants/app_export.dart';
import 'package:new_hrms_flutter/views/screens/home/widgets/dashBoardWidgets/graph_chart_widget.dart';
import 'package:new_hrms_flutter/views/screens/home/widgets/dashBoardWidgets/trending_menu.dart';
import 'package:new_hrms_flutter/views/screens/home/widgets/linear_chart_box.dart';
import 'package:new_hrms_flutter/views/screens/home/widgets/metric_card.dart';
import 'package:new_hrms_flutter/views/widgets/common/drop_down_cards.dart';
import 'package:new_hrms_flutter/views/widgets/dashboard/notification_list.dart';
import 'package:new_hrms_flutter/views/widgets/dashboard/reservation_list.dart';
import 'package:new_hrms_flutter/views/widgets/responsive/responsive.dart';
import 'package:new_hrms_flutter/views/widgets/dashboard/active_order_list.dart';
import 'package:new_hrms_flutter/views/widgets/dashboard/dashboard_card.dart';
import '../../../domain/models/dashBoardModel/dash_board_metric_item.dart';
import '../../../domain/models/dashBoardModel/dashboard_item.dart';
import '../../widgets/common/custom_checkbox.dart';
import '../../widgets/common/custom_container.dart';
import '../../widgets/common/custom_divider.dart';
import '../../widgets/common/custom_icon_contain.dart';
import '../../widgets/common/custom_text.dart';
import '../../widgets/dashboard/category_statistics.dart';
import '../../../core/constants/app_colors.dart';
import '../../widgets/dashboard/sales_performance_card.dart';
import '../../widgets/dashboard/tables_available_list.dart';
import '../../widgets/orders/order_status_card.dart';
import 'home_screen.dart';

class AppBreakpoints {
  static const mobile = 600.0;
  static const tablet = 1024.0;
}

String selectedMenu = 'Orders';
String selectedPeriod = 'Weekly';
String selectedTopSelling = 'All';
bool isChecked = false;

DashboardItem? selectedDashboardMenu = dashboardMenuitems.isNotEmpty
    ? dashboardMenuitems.first
    : null;

DashboardItem? selectedTopSellingItem = topSellingList.isNotEmpty
    ? topSellingList.first
    : null;

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

        final isMobile = Responsive.isMobile(context);
        return CustomDrawer(
          backgroundColor: const Color(0xFFF8F8F8),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildHeaderBar(isMobile),
                      _buildMainContent(width),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeaderBar(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                'Dashboard',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SvgPicture.asset(
                  AppAssets.refreshIcon,
                  width: 40,
                  height: 40,
                ),
              ),
            ],
          ),
          if (!isMobile)
            Row(
              children: [
                _button('Sync Data', AppAssets.syncIcon, isBold: true),
                const SizedBox(width: 10),
                _button('Export', AppAssets.exportFileIcon, suffixIcon: false),
                const SizedBox(width: 10),
                _button(
                  '15 Nov 25 - 15 Dec 25',
                  AppAssets.calendarIcon,
                  suffixIcon: false,
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildMainContent(double width) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width <= 650
                  ? 1
                  : MediaQuery.of(context).size.width <= 1200
                  ? 2
                  : 4,
              mainAxisSpacing: 1,
              crossAxisSpacing: 20,
              childAspectRatio: MediaQuery.of(context).size.width <= 900
                  ? 2
                  : 2,
            ),
            itemCount: dashboardMetrics.length,
            itemBuilder: (context, index) {
              return MetricCard(item: dashboardMetrics[index]);
            },
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
                  body: ReservationsWidget(
                    reservations: [
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
                    ],
                  ),
                  showDropdown: true,
                ),
                const DashboardCard(
                  title: 'Tables Available',
                  actionText: 'View All',
                  imagePath: 'assets/images/tables_available.png',
                  body: TableGridView(),
                ),
                const DashboardCard(
                  title: 'Notifications',
                  actionText: 'View All',
                  imagePath: 'assets/images/notifications.png',
                  body: NotificationsList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _button(
    String text,
    String svgIcon, {
    bool primary = false,
    bool suffixIcon = false,
        bool isBold = false,
  }) {
    return CustomContainer(
      onTap: () {},
      isNeedHover: true,
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
      borderRadius: BorderRadius.circular(5),
      decoration: BoxDecoration(
        color: primary ? const Color(0xFF0C76E1) : Colors.white,
        border: primary ? null : Border.all(color: Colors.grey.shade300, width: 0.75),
      ),
      child: Row(
        children: [
          SvgPicture.asset(svgIcon, width: 16, height: 16),
          SizedBox(width: 6),
          CustomText(
            text,

            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: primary ? Colors.white : Colors.black,
              fontWeight:isBold ? FontWeight.w500 : FontWeight.w400,
              fontSize: 14,
              letterSpacing: 0
            ),
          ),
          suffixIcon
              ? const Icon(Icons.keyboard_arrow_down_rounded, size: 20)
              : SizedBox(),
        ],
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
      padding: const EdgeInsets.only(top: 30, left: 14, right: 14),
      borderRadius: BorderRadius.circular(5),
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: Colors.black.withAlpha((0.2 * 255).toInt()),
          width: 0.50,
        ),
      ),
      onTap: () {
        print("Tapped");
      },
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
      ),
    );
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
        border: Border.all(
          color: Colors.black.withAlpha((0.2 * 255).toInt()),
          width: 0.50,
        ),
      ),
      onTap: () {
        print("Tapped");
      },
      child: Column(
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

                  CustomText(
                    'Top Selling Item',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

              DropDownCards<DashboardItem?>(
                value: selectedTopSellingItem,
                items: topSellingList,
                onChanged: (module) {
                  setState(() => selectedTopSellingItem = module);
                },
                childBuilder: (module) => Row(
                  children: [
                    Text("${module?.title}"),
                    const Icon(Icons.keyboard_arrow_down),
                  ],
                ),
                itemBuilder: (module, isSelected) => Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        "${module?.title}",
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ],
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
            decoration: BoxDecoration(color: AppColors.lightGg),
            onTap: () {
              print("Tapped");
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    '\u{1F525}  ',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    child: CustomText(
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
                        const CustomText(
                          'Veggie Supreme Pizza',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        CustomText(
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
      ),
    );
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
        border: Border.all(
          color: Colors.black.withAlpha((0.2 * 255).toInt()),
          width: 0.50,
        ),
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

                DropDownCards<DashboardItem?>(
                  value: selectedDashboardMenu,
                  items: dashboardMenuitems,
                  onChanged: (module) {
                    setState(() => selectedDashboardMenu = module);
                  },
                  childBuilder: (module) => Row(
                    children: [
                      if (module?.svgIcon != null)
                        Image.asset(
                          module!.svgIcon!,
                          width: 16,
                          height: 16,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.image_not_supported,
                              size: 16,
                            );
                          },
                        ),
                      const SizedBox(width: 8),
                      Text("${module?.title}"),
                      const Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                  itemBuilder: (module, isSelected) => Row(
                    children: [
                      if (module?.svgIcon != null)
                        Image.asset(
                          module!.svgIcon!,
                          width: 16,
                          height: 16,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.image_not_supported,
                              size: 16,
                            );
                          },
                        ),
                      const SizedBox(width: 8),
                      Expanded(child: Text("${module?.title}")),
                    ],
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

final List<DashboardItem> dashboardIcons = [
  DashboardItem(svgIcon: AppAssets.mainMenuIcon),
  DashboardItem(svgIcon: AppAssets.manageIcon),
  DashboardItem(svgIcon: AppAssets.operationIcon),
  DashboardItem(svgIcon: AppAssets.adminIcon),
  DashboardItem(svgIcon: AppAssets.authIcon),
  DashboardItem(svgIcon: AppAssets.settingsIcon),
];

final List<DashboardItem> dashboardMenuitems = [
  DashboardItem(title: 'Total Sales', svgIcon: AppAssets.dropMenu2),
  DashboardItem(title: 'Total Sales', svgIcon: AppAssets.dropMenu2),
  DashboardItem(title: 'Total Sales', svgIcon: AppAssets.dropMenu2),
  DashboardItem(title: 'Total Sales', svgIcon: AppAssets.dropMenu2),
];

final List<DashboardItem> topSellingList = [
  DashboardItem(title: 'All Items'),
  DashboardItem(title: 'Sea Food'),
  DashboardItem(title: 'Pizza'),
  DashboardItem(title: 'Salads'),
];

final List<DashboardMetricItem> dashboardMetrics = [
  DashboardMetricItem(
    title: 'Total Orders',
    value: '6986',
    percentage: '+12.5%',
    isPositive: true,
    svgIcon: AppAssets.orderDashIcon,
    gradient: [Color(0xFF8B5CF6), Color(0xFF6D28D9)],
  ),
  DashboardMetricItem(
    title: 'Total Sales',
    value: '\$7516',
    percentage: '+12.5%',
    isPositive: true,
    svgIcon: AppAssets.salesIcon,
    gradient: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
  ),
  DashboardMetricItem(
    title: 'Average Value',
    value: '\$25.36',
    percentage: '-8.5%',
    isPositive: false,
    svgIcon: AppAssets.averageIcon,
    gradient: [Color(0xFFF97316), Color(0xFFEA580C)],
  ),
  DashboardMetricItem(
    title: 'Reservations',
    value: '496',
    percentage: '-12.7%',
    isPositive: false,
    svgIcon: AppAssets.reservationIcon,
    gradient: [Color(0xFF22C55E), Color(0xFF16A34A)],
  ),
];
