import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/core/constants/app_export.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../domain/models/dashBoardModel/dashboard_item.dart';
import '../../../../widgets/common/custom_container.dart';
import '../../../../widgets/common/custom_divider.dart';
import '../../../../widgets/common/custom_icon_contain.dart';
import '../../../../widgets/common/drop_down_cards.dart';

class FoodItem {
  final String name;
  final String imageUrl;
  final int orders;
  final bool isVegetarian;

  FoodItem({
    required this.name,
    required this.imageUrl,
    required this.orders,
    required this.isVegetarian,
  });
}

String selectedTopSelling = 'All Items';
DashboardItem? selectedDashboardMenu = DashboardItem(
  title: 'All Items',
  svgIcon: AppAssets.salesIcon,
);


class TrendingMenu extends StatefulWidget {
  const TrendingMenu({super.key});

  @override
  State<TrendingMenu> createState() => _TrendingMenuState();
}

class _TrendingMenuState extends State<TrendingMenu> {

  @override
  Widget build(BuildContext context) {

    final List<DashboardItem> dashboardMenuitems = [
      DashboardItem(
        title: 'All Items',
      ),
      DashboardItem(
        title: 'Sea Food',
      ),
      DashboardItem(
        title: 'Pizza',
      ),
      DashboardItem(
        title: 'Salads',
      ),
    ];


    final List<FoodItem> foodItems = [
      FoodItem(
        name: 'Grilled Chicken',
        imageUrl:
        'https://images.unsplash.com/photo-1499028344343-cd173ffc68a9',
        orders: 48,
        isVegetarian: false,
      ),
      FoodItem(
        name: 'Grilled Veggie',
        imageUrl: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1',
        orders: 99,
        isVegetarian: false,
      ),
      FoodItem(
        name: 'Chicken Noodle',
        imageUrl:
        'https://images.unsplash.com/photo-1506354666786-959d6d497f1a',
        orders: 59,
        isVegetarian: false,
      ),
      FoodItem(
        name: 'Corn Pizza',
        imageUrl:
        'https://images.unsplash.com/photo-1594007654729-407eedc4be65',
        orders: 69,
        isVegetarian: true,
      ),
      FoodItem(
        name: 'Pumpkin Soup',
        imageUrl: 'https://images.unsplash.com/photo-1547592166-23ac45744acd',
        orders: 78,
        isVegetarian: true,
      ),
      FoodItem(
        name: 'Hot Chocolate',
        imageUrl:
        'https://images.unsplash.com/photo-1511920170033-f8396924c348',
        orders: 99,
        isVegetarian: true,
      ),
    ];

    return  Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 15, left: 14, right: 14, bottom: 12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black.withAlpha((0.2 * 255).toInt()), width: 0.50)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
                      svgAsset: AppAssets.trendMenuIcon,
                      onTap: () {},
                      borderColor: Colors.black.withAlpha((0.2 * 255).toInt()),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(width: 8),

                    Text(
                      'Trending Menus',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),

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
                        Flexible(child: Text("${module?.title}", overflow: TextOverflow.ellipsis)),
                        const Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                    itemBuilder: (module, isSelected) => Row(
                      children: [
                        Expanded(child: Text("${module?.title}")),
                      ],
                    ),
                  ),
                ),



                // DropDownCards(
                //   value: selectedTopSelling,
                //   items: const ['Sea food', 'Pizza', 'Salads'],
                //   onChanged: (value) {
                //     setState(() {
                //       selectedTopSelling = value;
                //     });
                //   },
                //   childBuilder: (value) => Container(
                //     padding: const EdgeInsets.symmetric(
                //       horizontal: 10,
                //       vertical: 5,
                //     ),
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(6),
                //       border: Border.all(color: Colors.grey.shade300),
                //     ),
                //     child: Row(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         Text(
                //           value,
                //           style: Theme.of(context).textTheme.titleMedium
                //               ?.copyWith(
                //             fontSize: 12,
                //             color: Colors.black,
                //             fontWeight: FontWeight.w400,
                //           ),
                //         ),
                //         const SizedBox(width: 6),
                //         const Icon(Icons.keyboard_arrow_down, size: 18),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
            CustomDivider(
              thickness: 0.4,
              verticalPadding: 8,
              color: Colors.black.withAlpha((0.2 * 255).toInt()),
            ),

            GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Responsive.isMobile(context)? 1: Responsive.isTablet(context)?2:3, // Desktop style
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: MediaQuery.of(context).size.width >= 1100? 1.1 :1.2,
              ),
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                return FoodCard(item: foodItems[index]);
              },
            ),
          ],
        ),
      ),
    );

  }
}


class FoodCard extends StatelessWidget {
  final FoodItem item;

  const FoodCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        width: double.infinity,
        height: 1,
        padding: EdgeInsets.only(top: 15, left: 14, right: 14, bottom: 12),
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

            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: AspectRatio(
                aspectRatio: 2 / 1.2,
                child: Image.network(item.imageUrl, fit: BoxFit.cover),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              item.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 6),

            Row(
              children: [
                Text(
                  'Orders: ${item.orders}',
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                ),
                const Spacer(),
                VegTag(isVeg: item.isVegetarian),
              ],
            ),
          ],
        ));
  }
}

class VegTag extends StatelessWidget {
  final bool isVeg;

  const VegTag({super.key, required this.isVeg});

  @override
  Widget build(BuildContext context) {
    final Color color = isVeg ? Colors.green : Colors.red;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      child: Row(
        children: [
          SvgPicture.asset(AppAssets.veg_nonVeg_Icon, colorFilter: ColorFilter.mode( isVeg ? AppColors.green : AppColors.red, BlendMode.srcIn) ,height: 12),
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
      ),
    );
  }
}
