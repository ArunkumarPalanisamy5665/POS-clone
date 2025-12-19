import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_export.dart';
import '../../../../domain/models/dashBoardModel/dashboard_item.dart';
import '../../../../domain/models/food_item.dart';
import '../../../widgets/common/custom_arrow.dart';
import '../../../widgets/common/custom_container.dart';
import '../../../widgets/mainWidgets/trending_food_menu.dart';
import '../../../widgets/orders/order_item_widget.dart';
import '../../../widgets/orders/order_status_card.dart';
import '../../../widgets/orders/order_status_tab.dart';
import '../widgets/posWidgets/Order_status_card_one.dart';
import '../widgets/posWidgets/card_widget.dart';

// class PosShell extends StatefulWidget {
//   final Widget child;
//
//   const PosShell({super.key, required this.child});
//
//   @override
//   State<PosShell> createState() => _PosShellState();
// }
//
// class _PosShellState extends State<PosShell> {
//   String selectedTopSelling = 'All Items';
//   DashboardItem? selectedDashboardMenu = DashboardItem(
//     title: 'All Items',
//     svgIcon: AppAssets.salesIcon,
//   );
//
//   final List<DashboardItem> dashboardMenuitems = [
//     DashboardItem(title: 'All Items'),
//     DashboardItem(title: 'Sea Food'),
//     DashboardItem(title: 'Pizza'),
//     DashboardItem(title: 'Salads'),
//   ];
//
//   // List<FoodItem> foodItems = [
//   //   FoodItem(
//   //     name: 'Margherita Pizza',
//   //     imageUrl: 'https://foodish-api.com/images/pizza/pizza1.jpg',
//   //     orders: 0,
//   //     isVegetarian: true,
//   //   ),
//   //   FoodItem(
//   //     name: 'Classic Burger',
//   //     imageUrl: 'https://foodish-api.com/images/burger/burger1.jpg',
//   //     orders: 0,
//   //     isVegetarian: false,
//   //   ),
//   //   FoodItem(
//   //     name: 'Chocolate Cake',
//   //     imageUrl: 'https://foodish-api.com/images/dessert/dessert1.jpg',
//   //     orders: 0,
//   //     isVegetarian: true,
//   //   ),
//   //   FoodItem(
//   //     name: 'Spaghetti Carbonara',
//   //     imageUrl: 'https://foodish-api.com/images/pasta/pasta1.jpg',
//   //     orders: 0,
//   //     isVegetarian: false,
//   //   ),
//   //   FoodItem(
//   //     name: 'Samosa',
//   //     imageUrl: 'https://foodish-api.com/images/samosa/samosa2.jpg',
//   //     orders: 0,
//   //     isVegetarian: false,
//   //   ),
//   //   FoodItem(
//   //     name: 'Burger',
//   //     imageUrl: 'https://foodish-api.com/images/burger/burger28.jpg',
//   //     orders: 0,
//   //     isVegetarian: false,
//   //   ),
//   //   FoodItem(
//   //     name: 'Pepperoni Pizza',
//   //     imageUrl: 'https://foodish-api.com/images/pizza/pizza2.jpg',
//   //     orders: 0,
//   //     isVegetarian: false,
//   //   ),
//   //   FoodItem(
//   //     name: 'Double Cheeseburger',
//   //     imageUrl: 'https://foodish-api.com/images/burger/burger2.jpg',
//   //     orders: 0,
//   //     isVegetarian: false,
//   //   ),
//   //   FoodItem(
//   //     name: 'Strawberry Cheesecake',
//   //     imageUrl: 'https://foodish-api.com/images/dessert/dessert2.jpg',
//   //     orders: 0,
//   //     isVegetarian: true,
//   //   ),
//   //   FoodItem(
//   //     name: 'Fettuccine Alfredo',
//   //     imageUrl: 'https://foodish-api.com/images/pasta/pasta2.jpg',
//   //     orders: 0,
//   //     isVegetarian: true,
//   //   ),
//   //   FoodItem(
//   //     name: 'Dhoosa',
//   //     imageUrl: 'https://foodish-api.com/images/dosa/dosa10.jpg',
//   //     orders: 0,
//   //     isVegetarian: false,
//   //   ),
//   //   FoodItem(
//   //     name: 'BBQ Pizza',
//   //     imageUrl: 'https://foodish-api.com/images/pizza/pizza55.jpg',
//   //     orders: 0,
//   //     isVegetarian: false,
//   //   ),
//   //   FoodItem(
//   //     name: 'Vegetarian Pizza',
//   //     imageUrl: 'https://foodish-api.com/images/pizza/pizza3.jpg',
//   //     orders: 0,
//   //     isVegetarian: true,
//   //   ),
//   //   FoodItem(
//   //     name: 'Bacon Burger',
//   //     imageUrl: 'https://foodish-api.com/images/burger/burger3.jpg',
//   //     orders: 0,
//   //     isVegetarian: false,
//   //   ),
//   //   FoodItem(
//   //     name: 'Tiramisu',
//   //     imageUrl: 'https://foodish-api.com/images/dessert/dessert3.jpg',
//   //     orders: 0,
//   //     isVegetarian: true,
//   //   ),
//   //   FoodItem(
//   //     name: 'Penne Arrabbiata',
//   //     imageUrl: 'https://foodish-api.com/images/pasta/pasta3.jpg',
//   //     orders: 0,
//   //     isVegetarian: true,
//   //   ),
//   //
//   //   FoodItem(
//   //     name: 'BBQ Chicken Pizza',
//   //     imageUrl: 'https://foodish-api.com/images/pizza/pizza4.jpg',
//   //     orders: 0,
//   //     isVegetarian: false,
//   //   ),
//   //   FoodItem(
//   //     name: 'Mushroom Burger',
//   //     imageUrl: 'https://foodish-api.com/images/burger/burger4.jpg',
//   //     orders: 0,
//   //     isVegetarian: true,
//   //   ),
//   //   FoodItem(
//   //     name: 'Brownie',
//   //     imageUrl: 'https://foodish-api.com/images/dessert/dessert4.jpg',
//   //     orders: 0,
//   //     isVegetarian: true,
//   //   ),
//   //   FoodItem(
//   //     name: 'Lasagna',
//   //     imageUrl: 'https://foodish-api.com/images/pasta/pasta4.jpg',
//   //     orders: 0,
//   //     isVegetarian: false,
//   //   ),
//   //
//   //   FoodItem(
//   //     name: 'Four Cheese Pizza',
//   //     imageUrl: 'https://foodish-api.com/images/pizza/pizza5.jpg',
//   //     orders: 0,
//   //     isVegetarian: true,
//   //   ),
//   //   FoodItem(
//   //     name: 'Turkey Burger',
//   //     imageUrl: 'https://foodish-api.com/images/burger/burger5.jpg',
//   //     orders: 0,
//   //     isVegetarian: false,
//   //   ),
//   //   FoodItem(
//   //     name: 'Lemon Pie',
//   //     imageUrl: 'https://foodish-api.com/images/dessert/dessert5.jpg',
//   //     orders: 0,
//   //     isVegetarian: true,
//   //   ),
//   //   FoodItem(
//   //     name: 'Ravioli',
//   //     imageUrl: 'https://foodish-api.com/images/pasta/pasta5.jpg',
//   //     orders: 0,
//   //     isVegetarian: true,
//   //   ),
//   //   FoodItem(
//   //     name: 'White Pizza',
//   //     imageUrl: 'https://foodish-api.com/images/pizza/pizza6.jpg',
//   //     orders: 0,
//   //     isVegetarian: true,
//   //   ),
//   //   FoodItem(
//   //     name: 'Veggie Burger',
//   //     imageUrl: 'https://foodish-api.com/images/burger/burger6.jpg',
//   //     orders: 0,
//   //     isVegetarian: true,
//   //   ),
//   //   FoodItem(
//   //     name: 'Apple Pie',
//   //     imageUrl: 'https://foodish-api.com/images/dessert/dessert6.jpg',
//   //     orders: 0,
//   //     isVegetarian: true,
//   //   ),
//   //   FoodItem(
//   //     name: 'Macaroni & Cheese',
//   //     imageUrl: 'https://foodish-api.com/images/pasta/pasta6.jpg',
//   //     orders: 0,
//   //     isVegetarian: true,
//   //   ),
//   //
//   //   FoodItem(
//   //     name: 'Sicilian Pizza',
//   //     imageUrl: 'https://foodish-api.com/images/pizza/pizza7.jpg',
//   //     orders: 0,
//   //     isVegetarian: false,
//   //   ),
//   //   FoodItem(
//   //     name: 'Wagyu Burger',
//   //     imageUrl: 'https://foodish-api.com/images/burger/burger7.jpg',
//   //     orders: 0,
//   //     isVegetarian: false,
//   //   ),
//   //   FoodItem(
//   //     name: 'Crème Brûlée',
//   //     imageUrl: 'https://foodish-api.com/images/dessert/dessert7.jpg',
//   //     orders: 0,
//   //     isVegetarian: true,
//   //   ),
//   //   FoodItem(
//   //     name: 'Tortellini',
//   //     imageUrl: 'https://foodish-api.com/images/pasta/pasta7.jpg',
//   //     orders: 0,
//   //     isVegetarian: true,
//   //   ),
//   // ];
//
//   List<FoodItem> foodItems = [
//     FoodItem(
//       name: 'Classic Cheeseburger',
//       imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd',
//       orders: 0,
//       isVegetarian: false,
//       category: 'fastFood',
//     ),
//     FoodItem(
//       name: 'Garden Salad',
//       imageUrl: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd',
//       orders: 0,
//       isVegetarian: true,
//       category: 'healthy',
//     ),
//     FoodItem(
//       name: 'Salmon Sushi Roll',
//       imageUrl: 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c',
//       orders: 0,
//       isVegetarian: false,
//       category: 'international',
//     ),
//     FoodItem(
//       name: 'Blueberry Pancakes',
//       imageUrl: 'https://images.unsplash.com/photo-1528207776546-365bb710ee93',
//       orders: 0,
//       isVegetarian: true,
//       category: 'breakfast',
//     ),
//     FoodItem(
//       name: 'Chicken Tacos',
//       imageUrl: 'https://images.unsplash.com/photo-1565299585323-38d6b0865b47',
//       orders: 0,
//       isVegetarian: false,
//       category: 'fastFood',
//     ),
//     FoodItem(
//       name: 'Fruit Smoothie Bowl',
//       imageUrl: 'https://images.unsplash.com/photo-1590301157890-4810ed352733',
//       orders: 0,
//       isVegetarian: true,
//       category: 'healthy',
//     ),
//     FoodItem(
//       name: 'Vegetable Spring Rolls',
//       imageUrl: 'https://images.unsplash.com/photo-1544025162-d76694265947',
//       orders: 0,
//       isVegetarian: true,
//       category: 'appetizer',
//     ),
//     FoodItem(
//       name: 'Spicy Ramen',
//       imageUrl: 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624',
//       orders: 0,
//       isVegetarian: false,
//       category: 'international',
//     ),
//     FoodItem(
//       name: 'Grilled Salmon Steak',
//       imageUrl: 'https://images.unsplash.com/photo-1467003909585-2f8a72700288',
//       orders: 0,
//       isVegetarian: false,
//       category: 'seafood',
//     ),
//     FoodItem(
//       name: 'Eggplant Parmesan',
//       imageUrl: 'https://images.unsplash.com/photo-1626074353765-517a681e40be',
//       orders: 0,
//       isVegetarian: true,
//       category: 'italian',
//     ),
//     FoodItem(
//       name: 'Chicken Tikka Masala',
//       imageUrl: 'https://images.unsplash.com/photo-1565557623262-b51c2513a641',
//       orders: 0,
//       isVegetarian: false,
//       category: 'international',
//     ),
//     FoodItem(
//       name: 'Avocado Toast',
//       imageUrl: 'https://images.unsplash.com/photo-1525351484163-7529414344d8',
//       orders: 0,
//       isVegetarian: true,
//       category: 'breakfast',
//     ),
//     FoodItem(
//       name: 'Beef Nachos',
//       imageUrl: 'https://images.unsplash.com/photo-1513456852971-30c0b8199d4d',
//       orders: 0,
//       isVegetarian: false,
//       category: 'fastFood',
//     ),
//     FoodItem(
//       name: 'Fish and Chips',
//       imageUrl: 'https://images.unsplash.com/photo-1579208575657-c595a05383b7',
//       orders: 0,
//       isVegetarian: false,
//       category: 'seafood',
//     ),
//     FoodItem(
//       name: 'Mushroom Risotto',
//       imageUrl: 'https://images.unsplash.com/photo-1476124369491-e7addf5db371',
//       orders: 0,
//       isVegetarian: true,
//       category: 'italian',
//     ),
//     FoodItem(
//       name: 'BBQ Pork Ribs',
//       imageUrl: 'https://images.unsplash.com/photo-1544025162-d76694265947',
//       orders: 0,
//       isVegetarian: false,
//       category: 'mainCourse',
//     ),
//     FoodItem(
//       name: 'Pad Thai',
//       imageUrl: 'https://images.unsplash.com/photo-1559339352-11d035aa65de',
//       orders: 0,
//       isVegetarian: false,
//       category: 'international',
//     ),
//     FoodItem(
//       name: 'Quinoa Bowl',
//       imageUrl: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd',
//       orders: 0,
//       isVegetarian: true,
//       category: 'healthy',
//     ),
//     FoodItem(
//       name: 'Chicken Wings',
//       imageUrl: 'https://images.unsplash.com/photo-1567620832903-9fc6debc209f',
//       orders: 0,
//       isVegetarian: false,
//       category: 'fastFood',
//     ),
//     FoodItem(
//       name: 'Red Velvet Cupcake',
//       imageUrl: 'https://images.unsplash.com/photo-1614707267537-b85aaf00c4b7',
//       orders: 0,
//       isVegetarian: true,
//       category: 'dessert',
//     ),
//     FoodItem(
//       name: 'Tofu Stir Fry',
//       imageUrl: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c',
//       orders: 0,
//       isVegetarian: true,
//       category: 'healthy',
//     ),
//     FoodItem(
//       name: 'Belgian Waffles',
//       imageUrl: 'https://images.unsplash.com/photo-1562329265-95a6d7a83440',
//       orders: 0,
//       isVegetarian: true,
//       category: 'breakfast',
//     ),
//     FoodItem(
//       name: 'Chicken Burrito',
//       imageUrl: 'https://images.unsplash.com/photo-1584031036380-3fb6f2d51880',
//       orders: 0,
//       isVegetarian: false,
//       category: 'fastFood',
//     ),
//     FoodItem(
//       name: 'Lentil Soup',
//       imageUrl: 'https://images.unsplash.com/photo-1547592166-23ac45744acd',
//       orders: 0,
//       isVegetarian: true,
//       category: 'healthy',
//     ),
//     FoodItem(
//       name: 'Gyoza',
//       imageUrl: 'https://images.unsplash.com/photo-1541696432-82c6da8ce7bf',
//       orders: 0,
//       isVegetarian: false,
//       category: 'international',
//     ),
//     FoodItem(
//       name: 'Fruit Tart',
//       imageUrl: 'https://images.unsplash.com/photo-1519915028121-7d3463d20b13',
//       orders: 0,
//       isVegetarian: true,
//       category: 'dessert',
//     ),
//     FoodItem(
//       name: 'Beef Pho',
//       imageUrl: 'https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43',
//       orders: 0,
//       isVegetarian: false,
//       category: 'international',
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomDrawer(
//       backgroundColor: Color(0xFFf8f8f8),
//       child: Row(
//         children: [
//           // _ProfileSideMenu(),
//           Expanded(
//             flex: 6,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   TrendingGridSection<DashboardItem>(
//                     title: 'Trending Menus',
//                     isHeader: true,
//                     selectedValue: selectedDashboardMenu,
//                     dropdownItems: dashboardMenuitems,
//                     onDropdownChanged: (value) {
//                       setState(() => selectedDashboardMenu = value);
//                     },
//                     crossAxisCount: Responsive.isMobile(context)
//                         ? 1
//                         :  MediaQuery.of(context).size.width > 700? 3:MediaQuery.of(context).size.width > 700 &&
//                         MediaQuery.of(context).size.width > 900
//                         ? 4
//                         : 5,
//                     crossAxisSpacing: 12,
//                     mainAxisSpacing: 12,
//                     childAspectRatio: MediaQuery.of(context).size.width <= 600
//                         ? 1.250
//                         : MediaQuery.of(context).size.width > 700
//                         ? 1.0
//                         : MediaQuery.of(context).size.width > 700 &&
//                               MediaQuery.of(context).size.width > 900
//                         ? 0.80
//                         : MediaQuery.of(context).size.width > 1000? 0.80:MediaQuery.of(context).size.width > 900 &&
//                               MediaQuery.of(context).size.width > 1100
//                         ? 0.80
//                         : 0.80,
//
//                     dropdownChildBuilder: (item) => Row(
//                       children: [
//                         Text(item?.title ?? ''),
//                         const Icon(Icons.keyboard_arrow_down),
//                       ],
//                     ),
//
//                     dropdownItemBuilder: (item, isSelected) => Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Text(item?.title ?? ''),
//                     ),
//
//                     itemCount: foodItems.length,
//                     itemBuilder: (context, index) {
//                       return FoodCard(item: foodItems[index]);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           if (MediaQuery.of(context).size.width > 1000) ...[
//             Expanded(flex: 2, child: SizedBox(width: 300)),
//           ],
//         ],
//       ),
//     );
//   }
// }
//
// class FoodCard extends StatelessWidget {
//   final FoodItem item;
//
//   const FoodCard({super.key, required this.item});
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomContainer(
//       width: double.infinity,
//       height: 1,
//       padding: EdgeInsets.only(top: 9, left: 8, right: 8, bottom: 9),
//       borderRadius: BorderRadius.circular(5),
//       alignment: Alignment.center,
//       clipBehavior: Clip.antiAlias,
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         border: Border.all(color: Color(0xFFE2E8F0), width: 1),
//       ),
//       onTap: () {
//         print("Tapped");
//       },
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(5),
//             child: AspectRatio(
//               aspectRatio: MediaQuery.of(context).size.width <= 700
//                   ? 1.9 / 1
//                   : MediaQuery.of(context).size.width < 1100
//                   ? 3 / 2
//                   : 3.2 / 1.5,
//               child: Image.network(item.imageUrl, fit: BoxFit.cover),
//             ),
//           ),
//
//           const SizedBox(height: 8),
//           Row(
//             children: [
//               Text(
//                 '${CommonWidgets.capitalizeFirstLetter('${item.category}')}',
//                 style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
//               ),
//               const Spacer(),
//               VegTag(isVeg: item.isVegetarian),
//             ],
//           ),
//
//           const SizedBox(height: 6),
//
//           Text(
//             item.name,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             style: Theme.of(context).textTheme.titleLarge?.copyWith(
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           const SizedBox(height: 6),
//           Row(
//             children: [
//               Text(
//                 '\$23: ${item.orders}',
//                 style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               Spacer(),
//               Row(
//                 children: [
//                   SvgPicture.asset(AppAssets.subIcon, width: 20, height: 20),
//                   SizedBox(width: 12),
//                   Text(
//                     '${item.orders}',
//                     style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   SizedBox(width: 12),
//                   SvgPicture.asset(AppAssets.addIcon, width: 20, height: 20),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class VegTag extends StatelessWidget {
//   final bool isVeg;
//
//   const VegTag({super.key, required this.isVeg});
//
//   @override
//   Widget build(BuildContext context) {
//     final Color color = isVeg ? Colors.green : Colors.red;
//
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//       child: Row(
//         children: [
//           SvgPicture.asset(
//             AppAssets.veg_nonVeg_Icon,
//             colorFilter: ColorFilter.mode(
//               isVeg ? AppColors.green : AppColors.red,
//               BlendMode.srcIn,
//             ),
//             height: 12,
//           ),
//           const SizedBox(width: 4),
//           Text(
//             isVeg ? 'Veg' : 'Non Veg',
//             style: TextStyle(
//               fontSize: 10,
//               fontWeight: FontWeight.w600,
//               color: color,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class PosShell extends StatefulWidget {
  final Widget? child;

  const PosShell({super.key, this.child});

  @override
  State<PosShell> createState() => _PosShellState();
}

class _PosShellState extends State<PosShell> {
  int selectedIndex = 0;

  DashboardItem? selectedDashboardMenu = DashboardItem(title: 'All Items');

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

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var filteredOrderList = _getFilteredOrders();

    return CustomDrawer(
      backgroundColor: const Color(0xFFF8F8F8),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
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
                            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 20,),
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
                              allOrdersCount: _getOrderCount('All Orders'),
                              pendingCount: _getOrderCount('Dine In'),
                              inProgressCount: _getOrderCount('Take Away'),
                              completedCount: _getOrderCount('Delivery'),
                              cancelledCount: _getOrderCount('Table'),
                            ),
                          ),
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
                      SizedBox(height: 16),
                      OrderStatusCardOne(orderCards: filteredOrderList,  controller: _scrollController,),
                      SizedBox(height: 16),
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

                                  isPrefixIcon: _orderCards[index].isPrefixIcon,
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
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),

                              crossAxisCount: ResponsiveTwo.gridCount(context),
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
            const Expanded(
              flex: 3,
              child: CardWidget(),
            ),
        ],
      ),
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
