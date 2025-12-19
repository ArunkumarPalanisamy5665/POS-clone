// import 'package:flutter/material.dart';
//
// import '../../../core/constants/app_export.dart';
// import '../../widgets/common/custom_container.dart';
// import '../../widgets/orders/order_item_widget.dart';
// import '../../widgets/orders/order_status_card.dart';
// import '../../widgets/orders/order_status_tab.dart';
// import '../../widgets/orders/search_order_toggle.dart';
//
// class OrderScreen extends StatefulWidget {
//   const OrderScreen({super.key});
//
//   @override
//   State<OrderScreen> createState() => _OrderScreenState();
// }
//
// class _OrderScreenState extends State<OrderScreen> {
//   final List<Widget> _orderCards = [
//     const OrderStatusCard(
//       status: 'Confirmed',
//       count: 98,
//       icon: Icons.bookmark,
//       iconColor: Colors.orange,
//       backgroundColor: Color(0xFFFFF3E0),
//     ),
//     const OrderStatusCard(
//       status: 'Pending',
//       count: 32,
//       icon: Icons.access_time,
//       iconColor: Colors.blue,
//       backgroundColor: Color(0xFFE3F2FD),
//     ),
//     const OrderStatusCard(
//       status: 'Processing',
//       count: 66,
//       icon: Icons.autorenew,
//       iconColor: Colors.orange,
//       backgroundColor: Color(0xFFFFF3E0),
//     ),
//     const OrderStatusCard(
//       status: 'Out For Delivery',
//       count: 45,
//       icon: Icons.pedal_bike,
//       iconColor: Colors.purple,
//       backgroundColor: Color(0xFFF3E5F5),
//     ),
//     const OrderStatusCard(
//       status: 'Delivered',
//       count: 69,
//       icon: Icons.send,
//       iconColor: Colors.green,
//       backgroundColor: Color(0xFFE8F5E9),
//     ),
//     const OrderStatusCard(
//       status: 'Cancelled',
//       count: 18,
//       icon: Icons.person_off,
//       iconColor: Colors.red,
//       backgroundColor: Color(0xFFFFEBEE),
//     ),
//   ];
//
//   int selectedIndex = 0;
//
//   final List<Map<String, dynamic>> _allOrders = [
//     {
//       'orderId': '#56988',
//       'orderType': 'Dine In',
//       'tableNo': '3',
//       'tokenNo': 24,
//       'time': '06:24 PM',
//       'items': [
//         {'name': 'Grilled Chicken', 'quantity': 1, 'isVeg': false},
//         {
//           'name': 'Chicken Taco - Medium',
//           'quantity': 1,
//           'isVeg': false,
//           'note': 'Extra Spicy'
//         },
//         {'name': 'Lobster Thermidor', 'quantity': 1, 'isVeg': false},
//         {'name': 'Caesar Salad', 'quantity': 1, 'isVeg': true},
//         {'name': 'Tiramisu', 'quantity': 2, 'isVeg': true},
//       ],
//       'billingStatus': 'Billed',
//       'orderStatus': 'Pending',
//     },
//     {
//       'orderId': '#57001',
//       'orderType': 'Take Away',
//       'tokenNo': 25,
//       'time': '06:45 PM',
//       'items': [
//         {'name': 'Vegan Burger', 'quantity': 2, 'isVeg': true},
//         {
//           'name': 'Sweet Potato Fries',
//           'quantity': 1,
//           'isVeg': true,
//           'note': 'Extra Fried'
//         },
//         {'name': 'Caesar Salad', 'quantity': 1, 'isVeg': true},
//       ],
//       'billingStatus': 'Billed',
//       'orderStatus': 'Completed',
//     },
//     {
//       'orderId': '#57002',
//       'orderType': 'Delivery',
//       'tokenNo': 26,
//       'time': '07:00 PM',
//       'items': [
//         {'name': 'Margherita Pizza', 'quantity': 1, 'isVeg': true},
//         {'name': 'Pasta Primavera', 'quantity': 1, 'isVeg': true},
//         {'name': 'Chocolate Lava Cake', 'quantity': 2, 'isVeg': true},
//       ],
//       'billingStatus': 'Billed',
//       'orderStatus': 'Preparing',
//     },
//     {
//       'orderId': '#57004',
//       'orderType': 'Take Away',
//       'tokenNo': 28,
//       'time': '07:30 PM',
//       'items': [
//         {'name': 'Margherita Pizza', 'quantity': 2, 'isVeg': true},
//         {
//           'name': 'Caesar Salad',
//           'quantity': 1,
//           'isVeg': true,
//           'note': 'Extra Spicy'
//         },
//         {'name': 'Cheesecake', 'quantity': 1, 'isVeg': true},
//       ],
//       'billingStatus': 'Paid',
//       'orderStatus': 'Cancelled',
//     },
//     {
//       'orderId': '#57003',
//       'orderType': 'Dine In',
//       'tableNo': '7',
//       'tokenNo': 27,
//       'time': '07:15 PM',
//       'items': [
//         {'name': 'Steak Frites', 'quantity': 1, 'isVeg': false},
//         {'name': 'Mushroom Risotto', 'quantity': 1, 'isVeg': true},
//         {'name': 'Tiramisu', 'quantity': 2, 'isVeg': true},
//         {'name': 'Chocolate Mousse', 'quantity': 1, 'isVeg': true},
//       ],
//       'billingStatus': 'Billed',
//       'orderStatus': 'Delivered',
//     },
//     {
//       'orderId': '#57005',
//       'orderType': 'Dine In',
//       'tableNo': '9',
//       'tokenNo': 29,
//       'time': '07:45 PM',
//       'items': [
//         {'name': 'Lobster Pasta', 'quantity': 1, 'isVeg': false},
//         {'name': 'Garlic Bread', 'quantity': 2, 'isVeg': true},
//         {'name': 'Chocolate Mousse', 'quantity': 1, 'isVeg': true},
//       ],
//       'billingStatus': 'Paid',
//       'orderStatus': 'In Progress',
//     },
//   ];
//
//   List<Map<String, dynamic>> _getFilteredOrders() {
//     // Tab indices: 0=All Orders, 1=Pending, 2=In Progress, 3=Completed, 4=Cancelled
//     switch (selectedIndex) {
//       case 0:
//         return _allOrders; // All Orders
//       case 1:
//         return _allOrders
//             .where((order) => order['orderStatus'] == 'Pending')
//             .toList();
//       case 2:
//         return _allOrders
//             .where((order) => order['orderStatus'] == 'In Progress')
//             .toList();
//       case 3:
//         return _allOrders
//             .where((order) => order['orderStatus'] == 'Completed')
//             .toList();
//       case 4:
//         return _allOrders
//             .where((order) => order['orderStatus'] == 'Cancelled')
//             .toList();
//       default:
//         return _allOrders;
//     }
//   }
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return LayoutBuilder(
//   //     builder: (context, constraints) {
//   //       final width = constraints.maxWidth;
//   //
//   //       final isMobile = Responsive.isMobile(context);
//   //       return CustomDrawer(
//   //         backgroundColor: const Color(0xFFF8F8F8),
//   //
//   //         child: Row(
//   //           crossAxisAlignment: CrossAxisAlignment.start,
//   //           children: [
//   //             Expanded(
//   //               child: SingleChildScrollView(
//   //                 child: Column(
//   //                   children: [
//   //                     _buildOrderHeaderBar(isMobile),
//   //                     _buildOrderContent(width),
//   //                   ],
//   //                 ),
//   //               ),
//   //             ),
//   //           ],
//   //         ),
//   //       );
//   //     },
//   //   );
//   // }
//   //
//   // Widget _buildOrderHeaderBar(bool isMobile) {
//   //   return Padding(
//   //     padding: const EdgeInsets.all(20),
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //       children: [
//   //         Row(
//   //           children: [
//   //             const Text(
//   //               'Orders',
//   //               style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
//   //             ),
//   //             const SizedBox(width: 10),
//   //             CustomContainer(
//   //               onTap: () {},
//   //               isNeedHover: true,
//   //               padding: const EdgeInsets.all(8),
//   //               borderRadius: BorderRadius.circular(50),
//   //               child: Image.asset(
//   //                 'assets/images/refresh_icon.png',
//   //                 height: 16,
//   //                 width: 16,
//   //               ),
//   //             ),
//   //           ],
//   //         ),
//   //         if (!isMobile)
//   //           Row(
//   //             children: [
//   //               const CustomSmallCard(
//   //                 text: 'Today',
//   //                 isNeedHover: true,
//   //                 suffixIcon: true,
//   //               ),
//   //               const SizedBox(width: 10),
//   //               CustomSmallCard(
//   //                 text: 'Add New',
//   //                 textStyle: const TextStyle(color: Colors.white),
//   //                 backgroundColor: const Color(0xFF1E88E5),
//   //                 onTap: () {},
//   //                 isNeedHover: false,
//   //                 assetImage: 'assets/images/circle_plus.png',
//   //                 prefixIcon: true,
//   //               ),
//   //             ],
//   //           ),
//   //       ],
//   //     ),
//   //   );
//   // }
//   //
//   // Widget _buildOrderContent(double width) {
//   //   final double width = MediaQuery.of(context).size.width;
//   //
//   //   final int crossAxisCount = width < 600
//   //       ? 1
//   //       : width < 1100
//   //       ? 3
//   //       : 6;
//   //
//   //   return SingleChildScrollView(
//   //     child: Column(
//   //       crossAxisAlignment: CrossAxisAlignment.start,
//   //       children: [
//   //         // Grid View for status cards
//   //         Padding(
//   //           padding: const EdgeInsets.all(16),
//   //           child: GridView.builder(
//   //             shrinkWrap: true,
//   //             physics: const NeverScrollableScrollPhysics(),
//   //             itemCount: _orderCards.length,
//   //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//   //               crossAxisCount: crossAxisCount,
//   //               mainAxisSpacing: 16,
//   //               crossAxisSpacing: 16,
//   //               mainAxisExtent: 80,
//   //             ),
//   //             itemBuilder: (_, index) => _orderCards[index],
//   //           ),
//   //         ),
//   //
//   //         // Add other content below here if needed
//   //         OrderStatusTab(
//   //           selectedIndex: selectedIndex,
//   //           onTabSelected: (index) {
//   //             setState(() {
//   //               selectedIndex = index;
//   //             });
//   //           },
//   //         ),
//   //
//   //         const SearchOrderToggle(),
//   //       ],
//   //     ),
//   //   );
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final width = constraints.maxWidth;
//         final isMobile = Responsive.isMobile(context);
//
//         return CustomDrawer(
//           backgroundColor: const Color(0xFFF8F8F8),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       _buildOrderHeaderBar(isMobile),
//                       _buildOrderContent(width),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildOrderHeaderBar(bool isMobile) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               const Text(
//                 'Orders',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
//               ),
//               const SizedBox(width: 10),
//               CustomContainer(
//                 onTap: () {},
//                 isNeedHover: true,
//                 padding: const EdgeInsets.all(8),
//                 borderRadius: BorderRadius.circular(50),
//                 child: Image.asset(
//                   'assets/images/refresh_icon.png',
//                   height: 16,
//                   width: 16,
//                 ),
//               ),
//             ],
//           ),
//           if (!isMobile)
//             Row(
//               children: [
//                 const CustomSmallCard(
//                   text: 'Today',
//                   isNeedHover: true,
//                   suffixIcon: true,
//                 ),
//                 const SizedBox(width: 10),
//                 CustomSmallCard(
//                   text: 'Add New',
//                   textStyle: const TextStyle(color: Colors.white),
//                   backgroundColor: const Color(0xFF1E88E5),
//                   onTap: () {},
//                   isNeedHover: false,
//                   assetImage: 'assets/images/circle_plus.png',
//                   prefixIcon: true,
//                 ),
//               ],
//             ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildOrderContent(double width) {
//     final int crossAxisCount = width < 600
//         ? 1
//         : width < 1100
//         ? 3
//         : 6;
//
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Grid View for status cards
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: GridView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: _orderCards.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: crossAxisCount,
//                 mainAxisSpacing: 16,
//                 crossAxisSpacing: 16,
//                 mainAxisExtent: 80,
//               ),
//               itemBuilder: (_, index) => _orderCards[index],
//             ),
//           ),
//
//           // Order Status Tabs
//           OrderStatusTab(
//             selectedIndex: selectedIndex,
//             onTabSelected: (index) {
//               setState(() {
//                 selectedIndex = index;
//               });
//             },
//           ),
//
//           // Search Order Toggle
//           const SearchOrderToggle(),
//
//           // Order Items Grid
//           _buildOrderItemsGrid(width),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildOrderItemsGrid(double width) {
//     final filteredOrders = _getFilteredOrders();
//
//     final int crossAxisCount = width < 900
//         ? 1
//         : width < 1400
//         ? 2
//         : 3;
//
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: filteredOrders.isEmpty
//           ? Center(
//         child: Padding(
//           padding: const EdgeInsets.all(40),
//           child: Text(
//             'No orders found',
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.grey[600],
//             ),
//           ),
//         ),
//       )
//           : GridView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemCount: filteredOrders.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: crossAxisCount,
//           mainAxisSpacing: 16,
//           crossAxisSpacing: 16,
//           childAspectRatio: 1.2,
//         ),
//         itemBuilder: (_, index) {
//           final order = filteredOrders[index];
//           return OrderItemWidget(
//             orderId: order['orderId'],
//             orderType: order['orderType'],
//             tableNo: order['tableNo'],
//             tokenNo: order['tokenNo'],
//             time: order['time'],
//             items: (order['items'] as List)
//                 .map((item) => OrderItem(
//               name: item['name'],
//               quantity: item['quantity'],
//               isVeg: item['isVeg'],
//               note: item['note'],
//             ))
//                 .toList(),
//             billingStatus: order['billingStatus'],
//             orderStatus: order['orderStatus'],
//             onMenuTap: () {
//               // Handle menu tap
//             },
//           );
//         },
//       ),
//     );
//   }
//
//
// }


import 'package:flutter/material.dart';

import '../../../core/constants/app_export.dart';
import '../../widgets/common/custom_container.dart';
import '../../widgets/orders/order_status_card.dart';
import '../../widgets/orders/order_status_tab.dart';
import '../../widgets/orders/search_order_toggle.dart';
import '../../widgets/orders/order_item_widget.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final List<Widget> _orderCards = [
    const OrderStatusCard(
      status: 'Confirmed',
      count: '98',
      icon: Icons.bookmark,
      iconColor: Colors.orange,
      backgroundColor: Color(0xFFFFF3E0),
    ),
    const OrderStatusCard(
      status: 'Pending',
      count: '32',
      icon: Icons.access_time,
      iconColor: Colors.blue,
      backgroundColor: Color(0xFFE3F2FD),
    ),
    const OrderStatusCard(
      status: 'Processing',
      count: '66',
      icon: Icons.autorenew,
      iconColor: Colors.orange,
      backgroundColor: Color(0xFFFFF3E0),
    ),
    const OrderStatusCard(
      status: 'Out For Delivery',
      count: '45',
      icon: Icons.pedal_bike,
      iconColor: Colors.purple,
      backgroundColor: Color(0xFFF3E5F5),
    ),
    const OrderStatusCard(
      status: 'Delivered',
      count: '69',
      icon: Icons.send,
      iconColor: Colors.green,
      backgroundColor: Color(0xFFE8F5E9),
    ),
    const OrderStatusCard(
      status: 'Cancelled',
      count: '18',
      icon: Icons.person_off,
      iconColor: Colors.red,
      backgroundColor: Color(0xFFFFEBEE),
    ),
  ];

  int selectedIndex = 0;

  // Sample order data
  final List<Map<String, dynamic>> _allOrders = [
    {
      'orderId': '#56988',
      'orderType': 'Dine In',
      'tableNo': '3',
      'tokenNo': 24,
      'time': '06:24 PM',
      'items': [
        {'name': 'Grilled Chicken', 'quantity': 1, 'isVeg': false},
        {
          'name': 'Chicken Taco - Medium',
          'quantity': 1,
          'isVeg': false,
          'note': 'Extra Spicy'
        },
        {'name': 'Lobster Thermidor', 'quantity': 1, 'isVeg': false},
        {'name': 'Caesar Salad', 'quantity': 1, 'isVeg': true},
        {'name': 'Tiramisu', 'quantity': 2, 'isVeg': true},
      ],
      'billingStatus': 'Billed',
      'orderStatus': 'Pending',
    },
    {
      'orderId': '#57001',
      'orderType': 'Take Away',
      'tokenNo': 25,
      'time': '06:45 PM',
      'items': [
        {'name': 'Vegan Burger', 'quantity': 2, 'isVeg': true},
        {
          'name': 'Sweet Potato Fries',
          'quantity': 1,
          'isVeg': true,
          'note': 'Extra Fried'
        },
        {'name': 'Caesar Salad', 'quantity': 1, 'isVeg': true},
      ],
      'billingStatus': 'Billed',
      'orderStatus': 'Completed',
    },
    {
      'orderId': '#57002',
      'orderType': 'Delivery',
      'tokenNo': 26,
      'time': '07:00 PM',
      'items': [
        {'name': 'Margherita Pizza', 'quantity': 1, 'isVeg': true},
        {'name': 'Pasta Primavera', 'quantity': 1, 'isVeg': true},
        {'name': 'Chocolate Lava Cake', 'quantity': 2, 'isVeg': true},
      ],
      'billingStatus': 'Billed',
      'orderStatus': 'Preparing',
    },
    {
      'orderId': '#57004',
      'orderType': 'Take Away',
      'tokenNo': 28,
      'time': '07:30 PM',
      'items': [
        {'name': 'Margherita Pizza', 'quantity': 2, 'isVeg': true},
        {
          'name': 'Caesar Salad',
          'quantity': 1,
          'isVeg': true,
          'note': 'Extra Spicy'
        },
        {'name': 'Cheesecake', 'quantity': 1, 'isVeg': true},
      ],
      'billingStatus': 'Paid',
      'orderStatus': 'Cancelled',
    },
    {
      'orderId': '#57003',
      'orderType': 'Dine In',
      'tableNo': '7',
      'tokenNo': 27,
      'time': '07:15 PM',
      'items': [
        {'name': 'Steak Frites', 'quantity': 1, 'isVeg': false},
        {'name': 'Mushroom Risotto', 'quantity': 1, 'isVeg': true},
        {'name': 'Tiramisu', 'quantity': 2, 'isVeg': true},
        {'name': 'Chocolate Mousse', 'quantity': 1, 'isVeg': true},
      ],
      'billingStatus': 'Billed',
      'orderStatus': 'Delivered',
    },
    {
      'orderId': '#57005',
      'orderType': 'Dine In',
      'tableNo': '9',
      'tokenNo': 29,
      'time': '07:45 PM',
      'items': [
        {'name': 'Lobster Pasta', 'quantity': 1, 'isVeg': false},
        {'name': 'Garlic Bread', 'quantity': 2, 'isVeg': true},
        {'name': 'Chocolate Mousse', 'quantity': 1, 'isVeg': true},
      ],
      'billingStatus': 'Paid',
      'orderStatus': 'In Progress',
    },
  ];

  List<Map<String, dynamic>> _getFilteredOrders() {
    // Tab indices: 0=All Orders, 1=Pending, 2=In Progress, 3=Completed, 4=Cancelled
    switch (selectedIndex) {
      case 0:
        return _allOrders; // All Orders
      case 1:
        return _allOrders
            .where((order) => order['orderStatus'] == 'Pending')
            .toList();
      case 2:
        return _allOrders
            .where((order) => order['orderStatus'] == 'In Progress')
            .toList();
      case 3:
        return _allOrders
            .where((order) => order['orderStatus'] == 'Completed')
            .toList();
      case 4:
        return _allOrders
            .where((order) => order['orderStatus'] == 'Cancelled')
            .toList();
      default:
        return _allOrders;
    }
  }

  int _getOrderCount(String status) {
    if (status == 'All') {
      return _allOrders.length;
    }
    return _allOrders
        .where((order) => order['orderStatus'] == status)
        .length;
  }

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
                      _buildOrderHeaderBar(isMobile),
                      _buildOrderContent(width),
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

  Widget _buildOrderHeaderBar(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text(
                'Orders',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const SizedBox(width: 10),
              CustomContainer(
                onTap: () {},
                isNeedHover: true,
                padding: const EdgeInsets.all(8),
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/images/refresh_icon.png',
                  height: 16,
                  width: 16,
                ),
              ),
            ],
          ),
          if (!isMobile)
            Row(
              children: [
                const CustomSmallCard(
                  text: 'Today',
                  isNeedHover: true,
                  suffixIcon: true,
                ),
                const SizedBox(width: 10),
                CustomSmallCard(
                  text: 'Add New',
                  textStyle: const TextStyle(color: Colors.white),
                  backgroundColor: const Color(0xFF1E88E5),
                  onTap: () {},
                  isNeedHover: false,
                  assetImage: 'assets/images/circle_plus.png',
                  prefixIcon: true,
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildOrderContent(double width) {
    final int crossAxisCount = width < 600
        ? 1
        : width < 1100
        ? 3
        : 6;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Grid View for status cards
          Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _orderCards.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                mainAxisExtent: 80,
              ),
              itemBuilder: (_, index) => _orderCards[index],
            ),
          ),

          // Order Status Tabs
          OrderStatusTab(
            selectedIndex: selectedIndex,
            onTabSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            allOrdersCount: _getOrderCount('All'),
            pendingCount: _getOrderCount('Pending'),
            inProgressCount: _getOrderCount('In Progress'),
            completedCount: _getOrderCount('Completed'),
            cancelledCount: _getOrderCount('Cancelled'),
          ),

          // Search Order Toggle
          const SearchOrderToggle(),

          // Order Items Grid
          _buildOrderItemsGrid(width),
        ],
      ),
    );
  }

  Widget _buildOrderItemsGrid(double width) {
    final filteredOrders = _getFilteredOrders();

    final int crossAxisCount = width < 900
        ? 1
        : width < 1400
        ? 2
        : 3;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: filteredOrders.isEmpty
          ? Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Text(
            'No orders found',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ),
      )
          : GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: filteredOrders.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.2,
        ),
        itemBuilder: (_, index) {
          final order = filteredOrders[index];
          return OrderItemWidget(
            orderId: order['orderId'],
            orderType: order['orderType'],
            tableNo: order['tableNo'],
            tokenNo: order['tokenNo'],
            time: order['time'],
            items: (order['items'] as List)
                .map((item) => OrderItem(
              name: item['name'],
              quantity: item['quantity'],
              isVeg: item['isVeg'],
              note: item['note'],
            ))
                .toList(),
            billingStatus: order['billingStatus'],
            orderStatus: order['orderStatus'],
            onMenuTap: () {
              // Handle menu tap
            },
          );
        },
      ),
    );
  }
}