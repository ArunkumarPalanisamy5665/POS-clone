import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/core/constants/app_assets.dart';

import '../../../core/constants/app_colors.dart';
import '../../widgets/appDrawer/custom_drawer.dart';
import '../../widgets/common/custom_container.dart';
import '../../widgets/common/custom_small_card.dart';
import '../../widgets/common/custom_textfield.dart';
import '../../widgets/kitchen/kitchen_order_list.dart';
import '../../widgets/orders/order_status_card.dart';
import '../../widgets/responsive/responsive.dart';


class KitchenKdsScreen extends StatefulWidget {
  const KitchenKdsScreen({super.key});

  @override
  State<KitchenKdsScreen> createState() => _KitchenKdsScreenState();
}

class _KitchenKdsScreenState extends State<KitchenKdsScreen> {

  final TextEditingController _searchController = TextEditingController();

  final List<Widget> _orderCardsKds = [
    const OrderStatusCard(
      isBadgeRight: true,
      status: 'New Order',
      count: '02',
      svgAssetPath: AppAssets.newOrderIcon,
      iconColor: Colors.orange,
      backgroundColor: Color(0xFFFFF3E0),
      isPrefixIcon: true,
      borderRadius: 20,
    ),
    const OrderStatusCard(
      isBadgeRight: true,
      status: 'In Kitchen',
      count: '03',
      svgAssetPath: AppAssets.inKitchenIcon,
      backgroundColor: Color(0xFFE3F2FD),
      isPrefixIcon: true,
      borderRadius: 20,
    ),
    const OrderStatusCard(
      isBadgeRight: true,
      status: 'Delayed',
      count: '01',
      svgAssetPath: AppAssets.delayedIcon,
      backgroundColor: Color(0xFFFFF3E0),
      isPrefixIcon: true,
      borderRadius: 20,
    ),
    const OrderStatusCard(
      isBadgeRight: true,
      status: 'Completed',
      count: '02',
      svgAssetPath: AppAssets.completedIcon,
      icon: Icons.pedal_bike,
      iconColor: Colors.purple,
      backgroundColor: Color(0xFFF3E5F5),
      isPrefixIcon: true,
      borderRadius: 20,
    ),
  ];

  final List<KdsOrder> orders = [
    KdsOrder(
      customerName: 'Jennifer Brooks',
      orderType: 'Dine In',
      tokenNumber: '31',
      orderId: '#14751',
      orderTime: DateTime(2025, 11, 15, 18, 0),
      items: [
        OrderItem(name: 'Mediterranean Salad - Regular', quantity: 1, notes: 'Extra Spicy', isVeg: true),
        OrderItem(name: 'Mushroom Risotto', quantity: 1, isVeg: true),
        OrderItem(name: 'Chocolate Brownie', quantity: 1, isVeg: true),
      ],
      totalTime: const Duration(minutes: 20),
      status: OrderStatus.notStarted,
      statusColor: const Color(0xFF5B6B79),
    ),
    KdsOrder(
      customerName: 'Elijah Thompson',
      orderType: 'Take Away',
      tokenNumber: '22',
      orderId: '#98765',
      orderTime: DateTime(2025, 11, 15, 17, 25),
      items: [
        OrderItem(name: 'Chicken Skewers', quantity: 1, isVeg: false),
        OrderItem(name: 'Rice Bowl', quantity: 4, isVeg: true),
        OrderItem(name: 'Vanilla Ice Cream', quantity: 1, isVeg: true),
      ],
      totalTime: const Duration(minutes: 50),
      elapsedTime: const Duration(minutes: 1, seconds: 35),
      status: OrderStatus.inProgress,
      statusColor: const Color(0xFFF5A623),
    ),
    KdsOrder(
      customerName: 'Walk in Customer',
      orderType: 'Dine In',
      tokenNumber: '07',
      orderId: '#23896',
      orderTime: DateTime(2025, 11, 15, 17, 15),
      items: [
        OrderItem(name: 'Margherita Pizza - Regular', quantity: 2, notes: 'Add More Onion, with extra Spicy', isVeg: true),
        OrderItem(name: 'Caesar Salad', quantity: 1, isVeg: true),
        OrderItem(name: 'Apple Pie', quantity: 1, isVeg: true),
      ],
      totalTime: const Duration(minutes: 15),
      elapsedTime: const Duration(minutes: 1, seconds: 35),
      status: OrderStatus.inProgress,
      statusColor: const Color(0xFFF5A623),
    ),
    KdsOrder(
      customerName: 'Walk in Customer',
      orderType: 'Take Away',
      tokenNumber: '42',
      orderId: '#14547',
      orderTime: DateTime(2025, 11, 15, 15, 22),
      items: [
        OrderItem(name: 'Pesto Pasta', quantity: 1, isVeg: true),
        OrderItem(name: 'Basil pesto, pine nuts', quantity: 1, isVeg: true),
        OrderItem(name: 'Lemon Tart', quantity: 2, isVeg: true),
      ],
      totalTime: const Duration(minutes: 50, seconds: 10),
      elapsedTime: const Duration(minutes: 55, seconds: 10),
      status: OrderStatus.delayed,
      statusColor: const Color(0xFFE53935),
    ),
    KdsOrder(
      customerName: 'Morgan Evans',
      orderType: 'Dine In',
      tokenNumber: '30',
      orderId: '#74758',
      orderTime: DateTime(2025, 11, 15, 14, 45),
      items: [
        OrderItem(name: 'Spicy Tofu Stir-Fry', quantity: 2, notes: 'Add Sprinkles', isVeg: true),
        OrderItem(name: 'Matcha Ice Cream', quantity: 1, isVeg: true),
        OrderItem(name: 'Quinoa Bowl', quantity: 1, isVeg: true),
      ],
      totalTime: const Duration(minutes: 35, seconds: 10),
      elapsedTime: const Duration(minutes: 25, seconds: 15),
      status: OrderStatus.completed,
      statusColor: const Color(0xFF4CAF50),
    ),
    KdsOrder(
      customerName: 'Walk in Customer',
      orderType: 'Delivery',
      tokenNumber: '40',
      orderId: '#35658',
      orderTime: DateTime(2025, 11, 14, 9, 12),
      items: [
        OrderItem(name: 'Cheesecake', quantity: 2, isVeg: true),
        OrderItem(name: 'Creamy, graham', quantity: 2, isVeg: true),
        OrderItem(name: 'Chicken Lollipop', quantity: 2, isVeg: false),
      ],
      totalTime: const Duration(minutes: 40, seconds: 20),
      elapsedTime: const Duration(minutes: 30, seconds: 22),
      status: OrderStatus.completed,
      statusColor: const Color(0xFF4CAF50),
    ),
  ];



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
                      // Header Bar
                      _buildKitchenKdsHeaderBar(isMobile, width),

                      // KDS Orders List
                      _buildKitchenKdsOrdersList(width, constraints),

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

  Widget _buildKitchenKdsHeaderBar(bool isMobile, double width) {
    final int crossAxisCount = width < 600
        ? 1
        : width < 900
        ? 2
        : 4;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Refresh Button Row
          if (!isMobile)
            Row(
              children: [
                const Text(
                  'Kitchen',
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

                SizedBox(width: 10,),

                // Order Status Cards Grid
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _orderCardsKds.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      mainAxisExtent: 46,
                    ),
                    itemBuilder: (_, index) => _orderCardsKds[index],
                  ),
                ),

              ],
            ),




          const SizedBox(height: 20),

          // Search Field
          SizedBox(
            width: 200,
            child: CustomTextField(
              height: 48,
              hint: 'Search',
              hintStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
              controller: _searchController,
              borderColor: AppColors.grey.withAlpha((0.3 * 255).toInt()),
              focusColor: AppColors.grey.withAlpha((0.3 * 255).toInt()),
              cursorColor: Colors.black.withAlpha((0.7 * 255).toInt()),
              borderWidth: 0.75,
              fillColor: Colors.white,
              suffixIcon: Icons.search,
              iconSize: 14,
              iconColor: Colors.black,
              textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              isLabel: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKitchenKdsOrdersList(double width, BoxConstraints constraints) {
    final int crossAxisCount = width < 700
        ? 1
        : width < 900
        ? 2:width < 1000
        ? 3
        : 3;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: 422,
      ),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return KdsOrderCard(
          order: orders[index],
          onStart: () => print('Start order ${orders[index].orderId}'),
          onPause: () => print('Pause order ${orders[index].orderId}'),
          onMarkDone: () => print('Mark done ${orders[index].orderId}'),
          onPrintOrder: () => print('Print order ${orders[index].orderId}'),
        );
      },
    );
  }
}