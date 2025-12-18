import 'package:flutter/material.dart';

import '../../../core/constants/app_export.dart';
import '../../../domain/models/dashBoardModel/dashboard_item.dart';
import '../../widgets/appDrawer/custom_drawer.dart';
import '../../widgets/common/custom_container.dart';
import '../../widgets/common/custom_divider.dart';
import '../../widgets/common/custom_text.dart';
import '../../widgets/common/drop_down_cards.dart';
import '../../widgets/orders/order_status_card.dart';
import '../../widgets/responsive/responsive.dart';
import '../home/main_home.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  final List<Widget> _orderCards = [
    OrderStatusCard(
      status: 'Confirmed',
      count: 98,
      icon: Icons.bookmark,
      iconColor: Colors.orange.shade700,
      backgroundColor: Colors.orange.shade50,
    ),
    OrderStatusCard(
      status: 'Pending',
      count: 32,
      icon: Icons.access_time,
      iconColor: Colors.blue.shade600,
      backgroundColor: Colors.blue.shade50,
    ),
    OrderStatusCard(
      status: 'Processing',
      count: 66,
      icon: Icons.autorenew,
      iconColor: Colors.orange.shade600,
      backgroundColor: Colors.orange.shade50,
    ),
    OrderStatusCard(
      status: 'Out For Delivery',
      count: 45,
      icon: Icons.pedal_bike,
      iconColor: Colors.purple.shade600,
      backgroundColor: Colors.purple.shade50,
    ),
    OrderStatusCard(
      status: 'Delivered',
      count: 69,
      icon: Icons.send,
      iconColor: Colors.green.shade600,
      backgroundColor: Colors.green.shade50,
    ),
    OrderStatusCard(
      status: 'Cancelled',
      count: 18,
      icon: Icons.person_off,
      iconColor: Colors.red.shade600,
      backgroundColor: Colors.red.shade50,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final isMobile = Responsive.isMobile(context);
        final isTablet = MediaQuery.of(context).size.width >= 1000;
        final isDesktop = Responsive.isDesktop(context);

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
                      _buildOrderContent(width)],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _button(
      String text,
      String svgIcon, {
        bool primary = false,
        bool suffixIcon = false,
      }) {
    return CustomContainer(
      onTap: () {},
      isNeedHover: true,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: primary ? const Color(0xFF0C76E1) : Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: primary ? null : Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          SvgPicture.asset(svgIcon, width: 16, height: 16),
          SizedBox(width: 6),
          CustomText(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: primary ? Colors.white : Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          suffixIcon
              ? const Icon(Icons.keyboard_arrow_down_rounded, size: 20)
              : SizedBox(),
        ],
      ),
    );
  }


  Widget _buildOrderHeaderBar(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Orders',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),

              SizedBox(width: 20,),
              InkWell(
                onTap: (){},
                child: Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 1,
                          color: Colors.grey.withOpacity(0.4)
                      )
                  ),
                  child: Image.asset('assets/images/refresh_icon.png',width: 16,height: 16,),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),


          if (!isMobile)
            Row(
              children: [
                _button('Today',suffixIcon: true,AppAssets.cardBg),
                const SizedBox(width: 10),
                _button('Add New',suffixIcon: true,AppAssets.adminIcon),
              ],
            ),
        ],
      ),
    );
  }



  Widget _buildOrderContent(double width) {
    final int crossAxisCount =
    width < 600 ? 1 : width < 1100 ? 3 : 6;

    final double childAspectRatio =
    width < 600 ? 3.5 : width < 1100 ? 3.2 : 2.8;

    final Axis scrollDirection =
    width < 600 ? Axis.horizontal : Axis.vertical;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: scrollDirection,
          itemCount: _orderCards.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (context, index) {
            return _orderCards[index];
          },
        ),
      ),
    );
  }






}
