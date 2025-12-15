

import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/views/screens/home/widgets/dashBoardWidgets/graph_chart_widget.dart';
import 'package:new_hrms_flutter/views/screens/home/widgets/linear_chart_box.dart';
import 'package:new_hrms_flutter/views/widgets/appDrawer/custom_drawer.dart';
import 'package:new_hrms_flutter/views/widgets/common/drop_down_cards.dart';
import 'package:new_hrms_flutter/views/widgets/responsive/responsive.dart';
import 'package:new_hrms_flutter/views/widgets/sideMenu/side_menu.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import 'home_screen.dart';


class AppBreakpoints {
  static const mobile = 600.0;
  static const tablet = 1024.0;
}

String selectedMenu = 'Orders';
String selectedPeriod = 'Weekly';


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
          // RevenueCard(),
          // // _section('Total Revenue', height: 220),
          // const SizedBox(height: 20),
          // TopSellingCard(),

          // const SizedBox(height: 20),
          const GraphChartPage(),

          // _section('Top Selling Items', height: 200),
        ],
      ),
    );
  }

  // Widget _section(String title, {double height = 180}) {
  //   return Container(
  //     padding: const EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(6),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(title,
  //             style:
  //             const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
  //         const SizedBox(height: 16),
  //         Container(
  //           height: height,
  //           color: const Color(0xFFF1F5F9),
  //           alignment: Alignment.center,
  //           child: const Text('Placeholder'),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  //

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



class GraphChartPage extends StatefulWidget {
  const GraphChartPage({super.key});

  @override
  State<GraphChartPage> createState() => _GraphChartPageState();
}

class _GraphChartPageState extends State<GraphChartPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 300,
      padding: const EdgeInsets.only(top: 30, left: 14, right: 14),
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

          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Revenue',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),


                DropDownCards(
                  value: selectedPeriod,
                  items: const [
                    'Weekly',
                    'Monthly',
                    'yearly',
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedPeriod = value;
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
                        Text(value, style: const TextStyle(fontSize: 12)),
                        const SizedBox(width: 6),
                        const Icon(Icons.keyboard_arrow_down, size: 18),
                      ],
                    ),
                  ),
                ),


                // DropdownButton<String>(
                //   value: selectedPeriod,
                //   padding: EdgeInsets.zero,
                //   itemHeight: 48,
                //   borderRadius: BorderRadius.all(Radius.circular(10)),
                //   items: const [
                //     DropdownMenuItem(value: 'Weekly', child: Text('Weekly', style: TextStyle(fontSize: 12),)),
                //     DropdownMenuItem(value: 'Monthly', child: Text('Monthly',  style: TextStyle(fontSize: 12))),
                //     DropdownMenuItem(value: 'Yearly', child: Text('Yearly',  style: TextStyle(fontSize: 12))),
                //   ],
                //   onChanged: (value) {
                //     setState(() => selectedPeriod = value!);
                //   },
                // ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          /// CHART CARD
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withOpacity(0.05),
                //     blurRadius: 8,
                //     offset: const Offset(0, 2),
                //   ),
                // ],
              ),
              child: GraphChartWidget(
                data: graphWeeklyData,
                highlightIndex: 2, // Wed highlighted
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// class GraphChartPage extends StatefulWidget {
//   const GraphChartPage({Key? key}) : super(key: key);
//
//   @override
//   State<GraphChartPage> createState() => _GraphChartPagePageState();
// }
//
// class _GraphChartPagePageState extends State<GraphChartPage> {
//   String selectedPeriod = 'Weekly';
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 900,
//       width: 1000,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Header
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     width: 40,
//                     height: 40,
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: const Icon(Icons.attach_money,
//                         color: Colors.black54, size: 24),
//                   ),
//                   const SizedBox(width: 12),
//                   const Text(
//                     'Total Revenue',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                 ],
//               ),
//               // Dropdown
//               PopupMenuButton<String>(
//                 child: Container(
//                   padding:
//                   const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey[300]!),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Row(
//                     children: [
//                       Text(
//                         selectedPeriod,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       const Icon(Icons.expand_more,
//                           color: Colors.black54, size: 20),
//                     ],
//                   ),
//                 ),
//                 onSelected: (value) {
//                   setState(() {
//                     selectedPeriod = value;
//                   });
//                 },
//                 itemBuilder: (BuildContext context) => [
//                   const PopupMenuItem(
//                     value: 'Weekly',
//                     child: Text('Weekly'),
//                   ),
//                   const PopupMenuItem(
//                     value: 'Monthly',
//                     child: Text('Monthly'),
//                   ),
//                   const PopupMenuItem(
//                     value: 'Yearly',
//                     child: Text('Yearly'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(height: 24),
//           Divider(color: Colors.grey[300]),
//           const SizedBox(height: 24),
//           // Revenue Info
//           Row(
//             children: [
//               Container(
//                 width: 50,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: const Icon(Icons.trending_up,
//                     color: Colors.white, size: 28),
//               ),
//               const SizedBox(width: 16),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Total Revenue',
//                     style: TextStyle(
//                       fontSize: 13,
//                       color: Colors.grey[600],
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   const Text(
//                     '\$3989',
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(height: 32),
//           // Chart
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 8,
//                     offset: const Offset(0, 2),
//                   ),
//                 ],
//               ),
//               padding: const EdgeInsets.all(24),
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: BarChart(
//                       BarChartData(
//                         alignment: BarChartAlignment.spaceAround,
//                         maxY: 4000,
//                         barTouchData: BarTouchData(
//                           enabled: true,
//                           touchTooltipData: BarTouchTooltipData(
//                             tooltipBgColor: Colors.grey[800]!,
//
//                             // getTooltipColor: (group) => Colors.grey[800]!,
//                             tooltipRoundedRadius: 8,
//                             getTooltipItem: (group, groupIndex, rod, rodIndex) {
//                               return BarTooltipItem(
//                                 'Revenue: ${(rod.toY / 1000).toStringAsFixed(1)}k',
//                                 const TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                         titlesData: FlTitlesData(
//                           show: true,
//                           topTitles: AxisTitles(
//                             sideTitles: SideTitles(showTitles: false),
//                           ),
//                           rightTitles: AxisTitles(
//                             sideTitles: SideTitles(showTitles: false),
//                           ),
//                           leftTitles: AxisTitles(
//                             sideTitles: SideTitles(
//                               showTitles: true,
//                               reservedSize: 40,
//                               getTitlesWidget: (value, meta) {
//                                 return Text(
//                                   '${(value / 1000).toStringAsFixed(0)}k',
//                                   style: TextStyle(
//                                     color: Colors.grey[600],
//                                     fontSize: 12,
//                                   ),
//                                   textAlign: TextAlign.right,
//                                 );
//                               },
//                             ),
//                           ),
//                           bottomTitles: AxisTitles(
//                             sideTitles: SideTitles(
//                               showTitles: true,
//                               getTitlesWidget: (value, meta) {
//                                 const days = [
//                                   'Mon',
//                                   'Tue',
//                                   'Wed',
//                                   'Thu',
//                                   'Fri',
//                                   'Sat',
//                                   'Sun'
//                                 ];
//                                 return Padding(
//                                   padding: const EdgeInsets.only(top: 8),
//                                   child: Text(
//                                     days[value.toInt()],
//                                     style: TextStyle(
//                                       color: Colors.grey[600],
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                         gridData: FlGridData(
//                           show: true,
//                           drawHorizontalLine: true,
//                           horizontalInterval: 1000,
//                           getDrawingHorizontalLine: (value) {
//                             return FlLine(
//                               color: AppColors.grey,
//                               strokeWidth: 1,
//                             );
//                           },
//                           drawVerticalLine: false,
//                         ),
//                         borderData: FlBorderData(show: false),
//                         barGroups: [
//                           BarChartGroupData(
//                             x: 0,
//                             barRods: [
//                               BarChartRodData(
//                                 toY: 1800,
//                                 color: Colors.grey[300],
//                                 width: 40,
//                                 borderRadius: const BorderRadius.vertical(
//                                   top: Radius.circular(6),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           BarChartGroupData(
//                             x: 1,
//                             barRods: [
//                               BarChartRodData(
//                                 toY: 1600,
//                                 color: Colors.grey[300],
//                                 width: 40,
//                                 borderRadius: const BorderRadius.vertical(
//                                   top: Radius.circular(6),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           BarChartGroupData(
//                             x: 2,
//                             barRods: [
//                               BarChartRodData(
//                                 toY: 3500,
//                                 color: Colors.blue,
//                                 width: 40,
//                                 borderRadius: const BorderRadius.vertical(
//                                   top: Radius.circular(6),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           BarChartGroupData(
//                             x: 3,
//                             barRods: [
//                               BarChartRodData(
//                                 toY: 1900,
//                                 color: Colors.grey[300],
//                                 width: 40,
//                                 borderRadius: const BorderRadius.vertical(
//                                   top: Radius.circular(6),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           BarChartGroupData(
//                             x: 4,
//                             barRods: [
//                               BarChartRodData(
//                                 toY: 1700,
//                                 color: Colors.grey[300],
//                                 width: 40,
//                                 borderRadius: const BorderRadius.vertical(
//                                   top: Radius.circular(6),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           BarChartGroupData(
//                             x: 5,
//                             barRods: [
//                               BarChartRodData(
//                                 toY: 1500,
//                                 color: Colors.grey[300],
//                                 width: 40,
//                                 borderRadius: const BorderRadius.vertical(
//                                   top: Radius.circular(6),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           BarChartGroupData(
//                             x: 6,
//                             barRods: [
//                               BarChartRodData(
//                                 toY: 1400,
//                                 color: Colors.grey[300],
//                                 width: 40,
//                                 borderRadius: const BorderRadius.vertical(
//                                   top: Radius.circular(6),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 24),
//           // Tooltip/Legend
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//             decoration: BoxDecoration(
//               color: Colors.grey[100],
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(color: Colors.grey[300]!),
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   width: 12,
//                   height: 12,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[600],
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 const Text(
//                   'Revenue: 3.5k',
//                   style: TextStyle(
//                     fontSize: 13,
//                     color: Colors.black87,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

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



