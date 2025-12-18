import 'package:flutter/material.dart';

import '../../../domain/models/dashBoardModel/dashboard_item.dart';
import '../../screens/home/widgets/dashBoardWidgets/trending_menu.dart';
import '../common/custom_container.dart';
import '../common/custom_icon_contain.dart';
import 'package:new_hrms_flutter/core/constants/app_export.dart';


import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/core/constants/app_export.dart';
import '../common/custom_icon_contain.dart';

import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/core/constants/app_export.dart';
import '../common/custom_icon_contain.dart';

class TrendingGridSection<T> extends StatelessWidget {
  //HEADER
  final bool isHeader;
  final String title;
  final String? headerIcon;
  final VoidCallback? onHeaderIconTap;

  //DROPDOWN
  final T? selectedValue;
  final List<T> dropdownItems;
  final ValueChanged<T?> onDropdownChanged;
  final Widget Function(T?) dropdownChildBuilder;
  final Widget Function(T?, bool) dropdownItemBuilder;

  //GRID
  final int? crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;

  // CONTAINER
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry innerPadding;
  final BoxDecoration? decoration;

  const TrendingGridSection({
    super.key,

    // Header
    required this.title,
    this.isHeader = false,
    this.headerIcon,
    this.onHeaderIconTap,

    // Dropdown
    required this.selectedValue,
    required this.dropdownItems,
    required this.onDropdownChanged,
    required this.dropdownChildBuilder,
    required this.dropdownItemBuilder,

    // Grid
    required this.itemBuilder,
    required this.itemCount,
    this.crossAxisCount,
    this.crossAxisSpacing = 12,
    this.mainAxisSpacing = 12,
    this.childAspectRatio = 1.2,

    // Container
    this.padding = const EdgeInsets.all(14),
    this.innerPadding = const EdgeInsets.all(8),
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedCrossAxisCount = crossAxisCount ??
        (Responsive.isMobile(context)
            ? 1
            : Responsive.isTablet(context)
            ? 2
            : 3);

    return Container(
      padding: padding,
      decoration: decoration ??
          BoxDecoration(
            color: AppColors.greySide,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.black12, width: 0.5),
          ),
      child: Padding(
        padding: innerPadding,
        child: Column(
          children: [


            if(isHeader)...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (headerIcon != null) ...[
                      CustomIconContainer(
                        width: 20,
                        height: 20,
                        iconSize: 12,
                        borderRadius: 4,
                        svgAsset: headerIcon!,
                        onTap: onHeaderIconTap ?? () {},
                        backgroundColor: Colors.white,
                        borderColor: Colors.black12,
                      ),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),


                Flexible(
                  child: DropDownCards<T?>(
                    value: selectedValue,
                    items: dropdownItems,
                    onChanged: onDropdownChanged,
                    childBuilder: dropdownChildBuilder,
                    itemBuilder: dropdownItemBuilder,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),
            const Divider(),
            ],

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: resolvedCrossAxisCount,
                crossAxisSpacing: crossAxisSpacing,
                mainAxisSpacing: mainAxisSpacing,
                childAspectRatio: childAspectRatio,
              ),
              itemCount: itemCount,
              itemBuilder: itemBuilder,
            ),
          ],
        ),
      ),
    );
  }
}








// class TrendxingFoodMenu extends StatefulWidget {
//   final int crossAxisSize;
//   const TrendxingFoodMenu({super.key, required this.crossAxisSize});
//
//   @override
//   State<TrendxingFoodMenu> createState() => _TrendingFoodMenuState();
// }
// class _TrendingFoodMenuState extends State<TrendxingFoodMenu> {
//
//   @override
//   Widget build(BuildContext context) {
//
//     final List<DashboardItem> dashboardMenuitems = [
//       DashboardItem(
//         title: 'All Items',
//       ),
//       DashboardItem(
//         title: 'Sea Food',
//       ),
//       DashboardItem(
//         title: 'Pizza',
//       ),
//       DashboardItem(
//         title: 'Salads',
//       ),
//     ];
//
//
//     final List<FoodItem> foodItems = [
//       FoodItem(
//         name: 'Grilled Chicken',
//         imageUrl:
//         'https://images.unsplash.com/photo-1499028344343-cd173ffc68a9',
//         orders: 48,
//         isVegetarian: false,
//       ),
//       FoodItem(
//         name: 'Grilled Veggie',
//         imageUrl: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1',
//         orders: 99,
//         isVegetarian: false,
//       ),
//       FoodItem(
//         name: 'Chicken Noodle',
//         imageUrl:
//         'https://images.unsplash.com/photo-1506354666786-959d6d497f1a',
//         orders: 59,
//         isVegetarian: false,
//       ),
//       FoodItem(
//         name: 'Corn Pizza',
//         imageUrl:
//         'https://images.unsplash.com/photo-1594007654729-407eedc4be65',
//         orders: 69,
//         isVegetarian: true,
//       ),
//       FoodItem(
//         name: 'Pumpkin Soup',
//         imageUrl: 'https://images.unsplash.com/photo-1547592166-23ac45744acd',
//         orders: 78,
//         isVegetarian: true,
//       ),
//       FoodItem(
//         name: 'Hot Chocolate',
//         imageUrl:
//         'https://images.unsplash.com/photo-1511920170033-f8396924c348',
//         orders: 99,
//         isVegetarian: true,
//       ),
//     ];
//
//     return  Container(
//       width: double.infinity,
//       padding: const EdgeInsets.only(top: 15, left: 14, right: 14, bottom: 12),
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//           color: AppColors.white,
//           borderRadius: BorderRadius.circular(5),
//           border: Border.all(color: Colors.black.withAlpha((0.2 * 255).toInt()), width: 0.50)
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     CustomIconContainer(
//                       width: 20,
//                       height: 20,
//                       iconSize: 12,
//                       borderRadius: 4,
//                       svgAsset: AppAssets.trendMenuIcon,
//                       onTap: () {},
//                       borderColor: Colors.black.withAlpha((0.2 * 255).toInt()),
//                       backgroundColor: Colors.white,
//                     ),
//                     SizedBox(width: 8),
//
//                     Text(
//                       'Trending Menus',
//                       style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 Flexible(
//                   child: DropDownCards<DashboardItem?>(
//                     value: selectedDashboardMenu,
//                     items: dashboardMenuitems,
//                     onChanged: (module) {
//                       setState(() => selectedDashboardMenu = module);
//                     },
//                     childBuilder: (module) => Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Flexible(child: Text("${module?.title}", overflow: TextOverflow.ellipsis)),
//                         const Icon(Icons.keyboard_arrow_down),
//                       ],
//                     ),
//                     itemBuilder: (module, isSelected) => Row(
//                       children: [
//                         Expanded(child: Text("${module?.title}")),
//                       ],
//                     ),
//                   ),
//                 ),
//
//
//
//                 // DropDownCards(
//                 //   value: selectedTopSelling,
//                 //   items: const ['Sea food', 'Pizza', 'Salads'],
//                 //   onChanged: (value) {
//                 //     setState(() {
//                 //       selectedTopSelling = value;
//                 //     });
//                 //   },
//                 //   childBuilder: (value) => Container(
//                 //     padding: const EdgeInsets.symmetric(
//                 //       horizontal: 10,
//                 //       vertical: 5,
//                 //     ),
//                 //     decoration: BoxDecoration(
//                 //       color: Colors.white,
//                 //       borderRadius: BorderRadius.circular(6),
//                 //       border: Border.all(color: Colors.grey.shade300),
//                 //     ),
//                 //     child: Row(
//                 //       mainAxisSize: MainAxisSize.min,
//                 //       children: [
//                 //         Text(
//                 //           value,
//                 //           style: Theme.of(context).textTheme.titleMedium
//                 //               ?.copyWith(
//                 //             fontSize: 12,
//                 //             color: Colors.black,
//                 //             fontWeight: FontWeight.w400,
//                 //           ),
//                 //         ),
//                 //         const SizedBox(width: 6),
//                 //         const Icon(Icons.keyboard_arrow_down, size: 18),
//                 //       ],
//                 //     ),
//                 //   ),
//                 // ),
//               ],
//             ),
//             CustomDivider(
//               thickness: 0.4,
//               verticalPadding: 8,
//               color: Colors.black.withAlpha((0.2 * 255).toInt()),
//             ),
//
//             GridView.builder(
//               shrinkWrap: true,
//               scrollDirection: Axis.vertical,
//               physics: const NeverScrollableScrollPhysics(),
//               gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: widget.crossAxisSize>0? widget.crossAxisSize : Responsive.isMobile(context)? 1: Responsive.isTablet(context)?2:3, // Desktop style
//                 crossAxisSpacing: 12,
//                 mainAxisSpacing: 12,
//                 childAspectRatio: MediaQuery.of(context).size.width >= 1100? 1.1 :1.2,
//               ),
//               itemCount: foodItems.length,
//               itemBuilder: (context, index) {
//                 return FoodCard(item: foodItems[index]);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//
//   }
// }