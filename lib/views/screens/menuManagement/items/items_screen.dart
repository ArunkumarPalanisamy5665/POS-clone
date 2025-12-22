import 'package:flutter/material.dart';

import '../../../../domain/models/dashBoardModel/dashboard_item.dart';
import '../../../../domain/models/food_item.dart';
import 'package:new_hrms_flutter/core/constants/app_export.dart';

import '../../../widgets/foodCard/food_card.dart';
import '../../../widgets/mainWidgets/trending_food_menu.dart';
import '../../../widgets/subHeader/sub_header_top_widget.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _AddOnsScreenState();
}

class _AddOnsScreenState extends State<ItemsScreen> {
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


  final googleKey = GlobalKey<State<StatefulWidget>>();

  final TextEditingController _searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(height: 20,),
        SubHeaderTopWidget(
          title: 'Items',
          headerIcon: AppAssets.refreshMainIcon,
          onHeaderIconTap: () {
            // refresh logic
          },
          searchController: _searchController,
          onSearchChanged: (value) {
            // search logic
          },
          buttonKey: googleKey,
          buttonText: 'Add New',
          onButtonPressed: () {
            // add new logic
          },
          buttonIcon: SvgPicture.asset(
            AppAssets.plusIcon,
            width: 20,
            height: 20,
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
                childAspectRatio: ResponsiveTwo.gridAspectItems(
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
                itemBuilder: (_, i) => FoodCard(item: foodItems[i], isCart: false,isSwapTitle: true,),
              ),
            ),
          ],
        ),
      ],),
    );
  }
}

