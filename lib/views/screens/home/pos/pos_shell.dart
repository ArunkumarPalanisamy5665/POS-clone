import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_export.dart';
import '../../../../domain/models/dashBoardModel/dashboard_item.dart';
import '../../../../domain/models/food_item.dart';
import '../../../widgets/common/custom_arrow.dart';
import '../../../widgets/common/custom_container.dart';
import '../../../widgets/common/custom_textfield.dart';
import '../../../widgets/common/hover_icon_button.dart';
import '../../../widgets/mainWidgets/toolBar/filter_tabs_tool.dart';
import '../../../widgets/mainWidgets/trending_food_menu.dart';
import '../../../widgets/orders/order_status_card.dart';
import '../../../widgets/orders/order_status_tab.dart';
import '../widgets/posWidgets/recenter_order_widget.dart';
import '../widgets/posWidgets/card_widget.dart';


final borderColor = Colors.black.withOpacity(0.2);


class PosShell extends StatefulWidget {
  final Widget? child;

  const PosShell({super.key, this.child});

  @override
  State<PosShell> createState() => _PosShellState();
}

class _PosShellState extends State<PosShell> {
  bool isVegChecked = false;
  bool isNonVegChecked = false;
  bool isEggChecked = false;
  final TextEditingController _searchController = TextEditingController();

  DashboardItem? selectedDashboardMenu = DashboardItem(title: 'All Items');
  int selectedIndex = 0;

  final ScrollController _scrollController = ScrollController();

  final dashboardMenuitems = [
    DashboardItem(title: 'All Items'),
    DashboardItem(title: 'Sea Food'),
    DashboardItem(title: 'Pizza'),
    DashboardItem(title: 'Salads'),
  ];

  final List<FoodItem> foodItems = List.generate(
    28,
    (i) => FoodItem(
      name: 'Food Item $i',
      imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd',
      orders: i,
      isVegetarian: i % 2 == 0,
      category: i % 2 == 0 ? 'veg' : 'non-veg',
    ),
  );

  final List<OrderStatusCard> _orderCards = [
    const OrderStatusCard(
      status: 'All Menus',
      count: '200 Menus',
      isPrefixIcon: true,
      networkImageUrl:
          'https://images.unsplash.com/photo-1525755662778-989d0524087e',
      icon: Icons.bookmark,
      iconColor: Colors.orange,
      backgroundColor: Color(0xFFFFF3E0),
    ),
    const OrderStatusCard(
      status: 'Sea Food',
      count: '200 Menus',
      isPrefixIcon: true,
      networkImageUrl:
          'https://images.unsplash.com/photo-1568901346375-23c9450c58cd',
      icon: Icons.access_time,
      iconColor: Colors.blue,
      backgroundColor: Color(0xFFE3F2FD),
    ),
    const OrderStatusCard(
      status: 'Pizza',
      count: '180 Menus',
      isPrefixIcon: true,
      networkImageUrl:
          'https://images.unsplash.com/photo-1551218808-94e220e084d2',
      icon: Icons.autorenew,
      iconColor: Colors.orange,
      backgroundColor: Color(0xFFFFF3E0),
    ),
    const OrderStatusCard(
      status: 'Salads',
      count: '120 Menus',
      isPrefixIcon: true,
      networkImageUrl:
          'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
      icon: Icons.pedal_bike,
      iconColor: Colors.purple,
      backgroundColor: Color(0xFFF3E5F5),
    ),
    const OrderStatusCard(
      status: 'Tacos',
      count: '150 Menus',
      icon: Icons.send,
      isPrefixIcon: true,
      networkImageUrl:
          'https://images.unsplash.com/photo-1473093295043-cdd812d0e601',
      iconColor: Colors.green,
      backgroundColor: Color(0xFFE8F5E9),
    ),
    const OrderStatusCard(
      status: 'Soups',
      count: '170 Menus',
      isPrefixIcon: true,
      networkImageUrl:
          'https://images.unsplash.com/photo-1525755662778-989d0524087e',
      icon: Icons.person_off,
      iconColor: Colors.red,
      backgroundColor: Color(0xFFFFEBEE),
    ),
  ];

  final List<OrderCard> orderDeliveredList = [
    OrderCard(
      orderId: '#14501',
      customerName: 'James Smith',
      time: '11:30 AM',
      type: 'Delivery',
      eta: '12 Mins',
      progress: 0.25,
      totalTime: '20:00',
    ),
    OrderCard(
      orderId: '#14502',
      customerName: 'Lucy Brown',
      time: '11:40 AM',
      type: 'Delivery',
      eta: '10 Mins',
      progress: 0.35,
      totalTime: '18:00',
    ),
    OrderCard(
      orderId: '#14503',
      customerName: 'Harry Wilson',
      time: '11:50 AM',
      type: 'Delivery',
      eta: '8 Mins',
      progress: 0.45,
      totalTime: '16:00',
    ),
    OrderCard(
      orderId: '#14504',
      customerName: 'Emma Stone',
      time: '12:00 PM',
      type: 'Delivery',
      eta: '-5 Mins',
      progress: 0.90,
      totalTime: '22:30',
      isLate: true,
    ),
    OrderCard(
      orderId: '#14505',
      customerName: 'Noah Taylor',
      time: '12:10 PM',
      type: 'Delivery',
      eta: '6 Mins',
      progress: 0.55,
      totalTime: '15:20',
    ),
    OrderCard(
      orderId: '#14506',
      customerName: 'Olivia Green',
      time: '12:20 PM',
      type: 'Delivery',
      eta: '4 Mins',
      progress: 0.65,
      totalTime: '14:10',
    ),

    OrderCard(
      orderId: '#14601',
      customerName: 'Maria Gonzalez',
      time: '12:30 PM',
      type: 'Take Away',
      eta: '5 Mins',
      progress: 0.40,
      totalTime: '12:00',
    ),
    OrderCard(
      orderId: '#14602',
      customerName: 'John Miller',
      time: '12:40 PM',
      type: 'Take Away',
      eta: '3 Mins',
      progress: 0.55,
      totalTime: '10:20',
    ),
    OrderCard(
      orderId: '#14603',
      customerName: 'Sophia Lee',
      time: '12:50 PM',
      type: 'Take Away',
      eta: '-6 Mins',
      progress: 0.95,
      totalTime: '19:45',
      isLate: true,
    ),
    OrderCard(
      orderId: '#14604',
      customerName: 'Daniel Kim',
      time: '01:00 PM',
      type: 'Take Away',
      eta: '2 Mins',
      progress: 0.60,
      totalTime: '11:10',
    ),
    OrderCard(
      orderId: '#14605',
      customerName: 'Ava Martinez',
      time: '01:10 PM',
      type: 'Take Away',
      eta: '1 Min',
      progress: 0.70,
      totalTime: '09:30',
    ),
    OrderCard(
      orderId: '#14606',
      customerName: 'Ethan Clark',
      time: '01:20 PM',
      type: 'Take Away',
      eta: '0 Min',
      progress: 0.80,
      totalTime: '08:45',
    ),

    OrderCard(
      orderId: '#14701',
      customerName: 'Robert King',
      time: '01:30 PM',
      type: 'Dine In',
      eta: '15 Mins',
      progress: 0.20,
      totalTime: '25:00',
    ),
    OrderCard(
      orderId: '#14702',
      customerName: 'Emily Davis',
      time: '01:40 PM',
      type: 'Dine In',
      eta: '12 Mins',
      progress: 0.30,
      totalTime: '22:10',
    ),
    OrderCard(
      orderId: '#14703',
      customerName: 'Michael Scott',
      time: '01:50 PM',
      type: 'Dine In',
      eta: '10 Mins',
      progress: 0.40,
      totalTime: '20:00',
    ),
    OrderCard(
      orderId: '#14704',
      customerName: 'Jessica White',
      time: '02:00 PM',
      type: 'Dine In',
      eta: '-7 Mins',
      progress: 0.85,
      totalTime: '30:40',
      isLate: true,
    ),
    OrderCard(
      orderId: '#14705',
      customerName: 'William Brown',
      time: '02:10 PM',
      type: 'Dine In',
      eta: '8 Mins',
      progress: 0.50,
      totalTime: '18:25',
    ),
    OrderCard(
      orderId: '#14706',
      customerName: 'Isabella Moore',
      time: '02:20 PM',
      type: 'Dine In',
      eta: '6 Mins',
      progress: 0.60,
      totalTime: '17:10',
    ),
  ];

  final List<OrderStatusCard> orderDetailList = [
    const OrderStatusCard(
      status: 'All Orders',
      count: '98',
      isPrefixIcon: true,
      networkImageUrl:
          'https://images.unsplash.com/photo-1525755662778-989d0524087e',
      icon: Icons.bookmark,
      iconColor: Colors.orange,
      backgroundColor: Color(0xFFFFF3E0),
    ),
    const OrderStatusCard(
      status: 'Dine In',
      count: '32',
      isPrefixIcon: true,
      networkImageUrl:
          'https://images.unsplash.com/photo-1568901346375-23c9450c58cd',
      icon: Icons.access_time,
      iconColor: Colors.blue,
      backgroundColor: Color(0xFFE3F2FD),
    ),
    const OrderStatusCard(
      status: 'Take Away',
      count: '66',
      isPrefixIcon: true,
      networkImageUrl:
          'https://images.unsplash.com/photo-1551218808-94e220e084d2',
      icon: Icons.autorenew,
      iconColor: Colors.orange,
      backgroundColor: Color(0xFFFFF3E0),
    ),
    const OrderStatusCard(
      status: 'Delivery',
      count: '45',
      isPrefixIcon: true,
      networkImageUrl:
          'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
      icon: Icons.pedal_bike,
      iconColor: Colors.purple,
      backgroundColor: Color(0xFFF3E5F5),
    ),
    const OrderStatusCard(
      status: 'Table',
      count: '69',
      icon: Icons.send,
      isPrefixIcon: true,
      networkImageUrl:
          'https://images.unsplash.com/photo-1473093295043-cdd812d0e601',
      iconColor: Colors.green,
      backgroundColor: Color(0xFFE8F5E9),
    ),
  ];

  int _getOrderCount(String status) {
    if (status == 'All') {
      return orderDeliveredList.length;
    }
    return orderDeliveredList.where((order) => order.type == status).length;
  }

  List<OrderCard> _getFilteredOrders() {
    switch (selectedIndex) {
      case 0:
        return orderDeliveredList;
      case 1:
        return orderDeliveredList
            .where((order) => order.type == 'Dine In')
            .toList();
      case 2:
        return orderDeliveredList
            .where((order) => order.type == 'Take Away')
            .toList();
      case 3:
        return orderDeliveredList
            .where((order) => order.type == 'Delivery')
            .toList();
      case 4:
        return orderDeliveredList
            .where((order) => order.type == 'Table')
            .toList();
      default:
        return orderDeliveredList;
    }
  }

  @override
  Widget build(BuildContext context) {
    var filteredOrderList = _getFilteredOrders();

    return CustomDrawer(
      backgroundColor: const Color(0xFFF8F8F8),
      child: Column(
        children: [
          CustomContainer(
            height: 60,
            width: double.infinity,
            padding: EdgeInsets.zero,
            borderRadius: BorderRadius.zero,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                left: BorderSide(color: borderColor, width: 0.5),
                right: BorderSide(color: borderColor, width: 0.5),
                bottom: BorderSide(color: borderColor, width: 0.5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 60,
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(color: borderColor, width: 0.5),
                        ),
                      ),
                      child: SvgPicture.asset(AppAssets.posLogoIcon),
                    ),

                    const SizedBox(width: 25),
                    HoverIconButton(
                      onTap: () {
                        GoRouter.of(context).go(RouteNames.dashboard);
                      },
                      asset: AppAssets.refreshMainIcon,
                    ),

                    const SizedBox(width: 20),
                  ],
                ),

                const FilterTabsTool(),

                Row(
                  children: [
                    HoverIconButton(
                      onTap: () {},
                      asset: AppAssets.refreshMainIcon,
                    ),
                    const SizedBox(width: 10),
                    HoverIconButton(
                      onTap: () {},
                      asset: AppAssets.refreshMainIcon,
                    ),
                    const SizedBox(width: 10),
                    HoverIconButton(
                      onTap: () {},
                      asset: AppAssets.refreshMainIcon,
                    ),
                    const SizedBox(width: 10),
                    HoverIconButton(
                      onTap: () {},
                      asset: AppAssets.refreshMainIcon,
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: ScrollConfiguration(
                    behavior: const ScrollBehavior().copyWith(
                      overscroll: false,
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 20,
                          top: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomText(
                                  'Recent Orders',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: OrderStatusTab(
                                    selectedIndex: selectedIndex,
                                    onTabSelected: (index) {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                    padding: EdgeInsets.zero,
                                    tabs: orderDetailList,
                                    allOrdersCount: _getOrderCount(
                                      'All Orders',
                                    ),
                                    pendingCount: _getOrderCount('Dine In'),
                                    inProgressCount: _getOrderCount(
                                      'Take Away',
                                    ),
                                    completedCount: _getOrderCount('Delivery'),
                                    cancelledCount: _getOrderCount('Table'),
                                  ),
                                ),
                                CustomArrow(
                                  borderRadius: 50,
                                  onLeftTap: () {
                                    _scrollController.animateTo(
                                      _scrollController.offset - 200,
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      curve: Curves.easeOut,
                                    );
                                  },
                                  onRightTap: () {
                                    _scrollController.animateTo(
                                      _scrollController.offset + 200,
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      curve: Curves.easeOut,
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            RecenterOrderWidget(
                              orderCards: filteredOrderList,
                              controller: _scrollController,
                            ),
                            SizedBox(height: 16),
                            buildMenuCategories(),
                            const SizedBox(height: 25),
                            SizedBox(
                              height: 65,
                              child: ScrollConfiguration(
                                behavior: ScrollConfiguration.of(
                                  context,
                                ).copyWith(scrollbars: false),
                                child: ListView.builder(
                                  controller: _scrollController,
                                  scrollDirection: Axis.horizontal,
                                  primary: false,
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  itemCount: _orderCards.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: OrderStatusCard(
                                        status: _orderCards[index].status,
                                        count: _orderCards[index].count,
                                        titleTextStyle: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13,
                                            ),
                                        subtitleTextStyle: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10,
                                            ),

                                        isPrefixIcon:
                                            _orderCards[index].isPrefixIcon,
                                        networkImageUrl:
                                            _orderCards[index].networkImageUrl,
                                        icon: _orderCards[index].icon,
                                        iconColor: _orderCards[index].iconColor,
                                        backgroundColor:
                                            _orderCards[index].backgroundColor,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TrendingGridSection<DashboardItem>(
                                    title: 'Trending Menus',
                                    isHeader: false,

                                    selectedValue: selectedDashboardMenu,
                                    dropdownItems: dashboardMenuitems,
                                    onDropdownChanged: (v) {
                                      setState(() => selectedDashboardMenu = v);
                                    },
                                    padding: EdgeInsets.only(top: 20),
                                    innerPadding: EdgeInsets.zero,
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                    ),

                                    crossAxisCount: ResponsiveTwo.gridCount(
                                      context,
                                    ),
                                    childAspectRatio: ResponsiveTwo.gridAspect(
                                      context,
                                    ),
                                    crossAxisSpacing: ResponsiveTwo.gridSpacing(
                                      context,
                                    ),
                                    mainAxisSpacing: ResponsiveTwo.gridSpacing(
                                      context,
                                    ),

                                    dropdownChildBuilder: (item) => Row(
                                      children: [
                                        Text(item?.title ?? ''),
                                        const Icon(Icons.keyboard_arrow_down),
                                      ],
                                    ),

                                    dropdownItemBuilder: (item, _) => Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(item?.title ?? ''),
                                    ),

                                    itemCount: foodItems.length,
                                    itemBuilder: (_, i) =>
                                        FoodCard(item: foodItems[i]),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (ResponsiveTwo.showRightPanel(context))
                  const Expanded(flex: 3, child: CardWidget()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuCategories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'Menu Categories',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 17.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 20),

            CustomCheckbox(
              icon: Icons.check,
              value: isVegChecked,
              width: 16,
              height: 16,
              backgroundColor: Colors.white,
              isCircular: false,
              borderRadius: 4,
              borderColor: Colors.grey.shade200,
              onChanged: (val) {
                setState(() => isVegChecked = val);
              },
            ),
            const SizedBox(width: 5),
            const VegTag(isVeg: true),

            const SizedBox(width: 15),
            CustomCheckbox(
              icon: Icons.check,
              value: isNonVegChecked,
              width: 16,
              height: 16,
              backgroundColor: Colors.white,
              isCircular: false,
              borderRadius: 4,
              borderColor: Colors.grey.shade200,
              onChanged: (val) {
                setState(() => isNonVegChecked = val);
              },
            ),
            const SizedBox(width: 5),
            const VegTag(isVeg: false),
            const SizedBox(width: 10),
            CustomCheckbox(
              icon: Icons.check,
              value: isEggChecked,
              width: 16,
              height: 16,
              backgroundColor: Colors.white,
              isCircular: false,
              borderRadius: 4,
              borderColor: Colors.grey.shade200,
              onChanged: (val) {
                setState(() => isEggChecked = val);
              },
            ),
            const SizedBox(width: 5),
            const VegTag(isVeg: true),
          ],
        ),

        Row(
          children: [
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
            const SizedBox(width: 5),
            CustomContainer(
              onTap: () {},
              isNeedHover: true,
              padding: const EdgeInsets.all(8),
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/images/notifications.png',
                height: 16,
                width: 16,
              ),
            ),
            const SizedBox(width: 5),
            CustomArrow(
              borderRadius: 50,
              onLeftTap: () {
                _scrollController.animateTo(
                  _scrollController.offset - 200,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              },
              onRightTap: () {
                _scrollController.animateTo(
                  _scrollController.offset + 200,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

class FoodCard extends StatelessWidget {
  final FoodItem item;

  const FoodCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return CustomContainer(
      padding: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(6),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      onTap: () {},

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: AspectRatio(
              aspectRatio: ResponsiveTwo.imageAspectRatio(context),
              child: Image.network(item.imageUrl, fit: BoxFit.cover),
            ),
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              Text(
                item.category.toUpperCase(),
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
              const Spacer(),
              VegTag(isVeg: item.isVegetarian),
            ],
          ),

          const SizedBox(height: 6),

          Text(
            item.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),

          // Spacer(),
          Row(
            children: [
              const Text(
                '\$25',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              _QtyControl(item.orders),
            ],
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}

class VegTag extends StatelessWidget {
  final bool isVeg;

  const VegTag({super.key, required this.isVeg});

  @override
  Widget build(BuildContext context) {
    final color = isVeg ? Colors.green : Colors.red;

    return Row(
      children: [
        SvgPicture.asset(
          AppAssets.veg_nonVeg_Icon,
          height: 12,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
        const SizedBox(width: 4),
        Text(
          isVeg ? 'Veg' : 'Non Veg',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }
}

class _QtyControl extends StatelessWidget {
  final int qty;

  const _QtyControl(this.qty);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppAssets.subIcon, width: 18),
        const SizedBox(width: 10),
        Text(
          '$qty',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 10),
        SvgPicture.asset(AppAssets.addIcon, width: 18),
      ],
    );
  }
}

class _ProfileSideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.blue.shade50,
      child: Column(
        children: [
          _menu(context, 'Profile Info', '/profile/info'),
          _menu(context, 'Documents', '/profile/documents'),
          _menu(context, 'Settings', '/profile/settings'),
        ],
      ),
    );
  }

  Widget _menu(BuildContext context, String title, String route) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).go(route);
      },
      child: Padding(padding: const EdgeInsets.all(12), child: Text(title)),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.blue,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(16),
      child: const Text('PROFILE AREA', style: TextStyle(color: Colors.white)),
    );
  }
}

class ProfileInfoPage extends StatelessWidget {
  const ProfileInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile Info'));
  }
}

class ProfileDocumentsPage extends StatelessWidget {
  const ProfileDocumentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile Documents'));
  }
}

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile Settings'));
  }
}
