import 'package:flutter/material.dart';

import '../../../core/constants/app_export.dart';
import '../../../domain/models/dashBoardModel/dashboard_item.dart';
import '../../widgets/appDrawer/custom_drawer.dart';
import '../../widgets/common/custom_divider.dart';
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

          drawer: !isDesktop ? Drawer(child: _buildSidebar()) : null,

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isDesktop) _buildSidebar(),
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
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              SizedBox(width: 20,),
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 1,
                        color: Colors.grey.withOpacity(0.4)
                    )
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh, size: 16),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),


          if (!isMobile)
            Row(
              children: [
                _button('Today'),
                const SizedBox(width: 10),
                _button('Add new'),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildOrderContent(double width) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            OrderStatusCard(
              status: 'Confirmed',
              count: 98,
              icon: Icons.bookmark,
              iconColor: Colors.orange.shade700,
              backgroundColor: Colors.orange.shade50,
            ),
            const SizedBox(width: 16),
            OrderStatusCard(
              status: 'Pending',
              count: 32,
              icon: Icons.access_time,
              iconColor: Colors.blue.shade600,
              backgroundColor: Colors.blue.shade50,
            ),
            const SizedBox(width: 16),
            OrderStatusCard(
              status: 'Processing',
              count: 66,
              icon: Icons.autorenew,
              iconColor: Colors.orange.shade600,
              backgroundColor: Colors.orange.shade50,
            ),
            const SizedBox(width: 16),
            OrderStatusCard(
              status: 'Out For Delivery',
              count: 45,
              icon: Icons.pedal_bike,
              iconColor: Colors.purple.shade600,
              backgroundColor: Colors.purple.shade50,
            ),
            const SizedBox(width: 16),
            OrderStatusCard(
              status: 'Delivered',
              count: 69,
              icon: Icons.send,
              iconColor: Colors.green.shade600,
              backgroundColor: Colors.green.shade50,
            ),
            const SizedBox(width: 16),
            OrderStatusCard(
              status: 'Cancelled',
              count: 18,
              icon: Icons.person_off,
              iconColor: Colors.red.shade600,
              backgroundColor: Colors.red.shade50,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSidebar() {
    final menu = ['Dashboard', 'POS', 'Orders', 'Kitchen', 'Reservation'];

    return Row(
      children: [
        Container(
          width: 60,
          decoration: const BoxDecoration(color: AppColors.greySide),
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned.fill(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 13),
                      SvgPicture.asset(
                        AppAssets.mainLogoIcon,
                        width: 30,
                        height: 32,
                      ),
                      const SizedBox(height: 13),
                      ...List.generate(dashboardIcons.length, (index) {
                        final item = dashboardIcons[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            top: 15,
                            bottom: 8.0,
                            right: 8.0,
                          ),
                          child: SvgPicture.asset(
                            "${item.svgIcon}",
                            width: 15,
                            height: 15,
                          ),
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

        Container(
          width: 215,
          height: double.infinity,
          // padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: Responsive.isDesktop(context)
                  ? BorderSide(
                color: Colors.black.withAlpha((0.2 * 255).toInt()),
                width: 0.60,
              )
                  : BorderSide.none,
              left: BorderSide(
                color: Colors.black.withAlpha((0.2 * 255).toInt()),
                width: 0.60,
              ),
              right: Responsive.isDesktop(context)
                  ? BorderSide(
                color: Colors.black.withAlpha((0.2 * 255).toInt()),
                width: 0.60,
              )
                  : BorderSide.none,
            ),
            borderRadius: BorderRadius.circular(0),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: DropDownCards<DashboardItem?>(
                        value: selectedDashboardMenu,
                        items: dashboardMenuitems,
                        onChanged: (module) {
                          setState(() => selectedDashboardMenu = module);
                        },
                        childBuilder: (module) => Row(
                          mainAxisSize: MainAxisSize.min,
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
                            Flexible(
                              child: Text(
                                "${module?.title}",
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
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
                            // if (isSelected)
                            //   const Icon(Icons.check, size: 16, color: Colors.green),
                          ],
                        ),
                      ),
                    ),

                    // DropDownCards(
                    //        value: selectedMenu,
                    //        items: const ['New Order', 'Order List', 'Returns', 'Reports'],
                    //        onChanged: (value) {
                    //          setState(() {
                    //            selectedMenu = value;
                    //          });
                    //        },
                    //        childBuilder: (value) => Container(
                    //          padding: const EdgeInsets.symmetric(
                    //            horizontal: 12,
                    //            vertical: 10,
                    //          ),
                    //          decoration: BoxDecoration(
                    //            color: Colors.white,
                    //            borderRadius: BorderRadius.circular(6),
                    //            // border: Border.all(color: Colors.grey.shade300),
                    //          ),
                    //          child: Row(
                    //            mainAxisSize: MainAxisSize.min,
                    //            children: [
                    //              Image.asset(AppAssets.restaurantIcon, width: 16),
                    //              const SizedBox(width: 8),
                    //              Text(value),
                    //              const SizedBox(width: 6),
                    //              const Icon(Icons.keyboard_arrow_down, size: 18),
                    //            ],
                    //          ),
                    //        ),
                    //      ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(Icons.close_sharp, size: 23),
                    ),
                  ],
                ),
                CustomDivider(
                  thickness: 0.50,
                  verticalPadding: 0,
                  color: Colors.black.withAlpha((0.2 * 255).toInt()),
                ),

                // SizedBox(height: 20),
                ...menu.map(_menuItem),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _menuItem(String title) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        padding: const EdgeInsets.only(left: 10, top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            const Icon(Icons.dashboard, size: 16),
            const SizedBox(width: 10),
            Text(title),
          ],
        ),
      ),
    );
  }



}
