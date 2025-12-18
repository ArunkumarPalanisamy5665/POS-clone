import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_export.dart';
import '../../../../domain/models/dashBoardModel/dashboard_item.dart';
import '../../../../domain/models/food_item.dart';
import '../../../widgets/common/custom_container.dart';
import '../../../widgets/mainWidgets/trending_food_menu.dart';

class PosShell extends StatefulWidget {
  final Widget child;

  const PosShell({super.key, required this.child});

  @override
  State<PosShell> createState() => _PosShellState();
}

class _PosShellState extends State<PosShell> {
  String selectedTopSelling = 'All Items';
  DashboardItem? selectedDashboardMenu = DashboardItem(
    title: 'All Items',
    svgIcon: AppAssets.salesIcon,
  );

  final List<DashboardItem> dashboardMenuitems = [
    DashboardItem(title: 'All Items'),
    DashboardItem(title: 'Sea Food'),
    DashboardItem(title: 'Pizza'),
    DashboardItem(title: 'Salads'),
  ];

  // List<FoodItem> foodItems = [
  //   FoodItem(
  //     name: 'Margherita Pizza',
  //     imageUrl: 'https://foodish-api.com/images/pizza/pizza1.jpg',
  //     orders: 0,
  //     isVegetarian: true,
  //   ),
  //   FoodItem(
  //     name: 'Classic Burger',
  //     imageUrl: 'https://foodish-api.com/images/burger/burger1.jpg',
  //     orders: 0,
  //     isVegetarian: false,
  //   ),
  //   FoodItem(
  //     name: 'Chocolate Cake',
  //     imageUrl: 'https://foodish-api.com/images/dessert/dessert1.jpg',
  //     orders: 0,
  //     isVegetarian: true,
  //   ),
  //   FoodItem(
  //     name: 'Spaghetti Carbonara',
  //     imageUrl: 'https://foodish-api.com/images/pasta/pasta1.jpg',
  //     orders: 0,
  //     isVegetarian: false,
  //   ),
  //   FoodItem(
  //     name: 'Samosa',
  //     imageUrl: 'https://foodish-api.com/images/samosa/samosa2.jpg',
  //     orders: 0,
  //     isVegetarian: false,
  //   ),
  //   FoodItem(
  //     name: 'Burger',
  //     imageUrl: 'https://foodish-api.com/images/burger/burger28.jpg',
  //     orders: 0,
  //     isVegetarian: false,
  //   ),
  //   FoodItem(
  //     name: 'Pepperoni Pizza',
  //     imageUrl: 'https://foodish-api.com/images/pizza/pizza2.jpg',
  //     orders: 0,
  //     isVegetarian: false,
  //   ),
  //   FoodItem(
  //     name: 'Double Cheeseburger',
  //     imageUrl: 'https://foodish-api.com/images/burger/burger2.jpg',
  //     orders: 0,
  //     isVegetarian: false,
  //   ),
  //   FoodItem(
  //     name: 'Strawberry Cheesecake',
  //     imageUrl: 'https://foodish-api.com/images/dessert/dessert2.jpg',
  //     orders: 0,
  //     isVegetarian: true,
  //   ),
  //   FoodItem(
  //     name: 'Fettuccine Alfredo',
  //     imageUrl: 'https://foodish-api.com/images/pasta/pasta2.jpg',
  //     orders: 0,
  //     isVegetarian: true,
  //   ),
  //   FoodItem(
  //     name: 'Dhoosa',
  //     imageUrl: 'https://foodish-api.com/images/dosa/dosa10.jpg',
  //     orders: 0,
  //     isVegetarian: false,
  //   ),
  //   FoodItem(
  //     name: 'BBQ Pizza',
  //     imageUrl: 'https://foodish-api.com/images/pizza/pizza55.jpg',
  //     orders: 0,
  //     isVegetarian: false,
  //   ),
  //   FoodItem(
  //     name: 'Vegetarian Pizza',
  //     imageUrl: 'https://foodish-api.com/images/pizza/pizza3.jpg',
  //     orders: 0,
  //     isVegetarian: true,
  //   ),
  //   FoodItem(
  //     name: 'Bacon Burger',
  //     imageUrl: 'https://foodish-api.com/images/burger/burger3.jpg',
  //     orders: 0,
  //     isVegetarian: false,
  //   ),
  //   FoodItem(
  //     name: 'Tiramisu',
  //     imageUrl: 'https://foodish-api.com/images/dessert/dessert3.jpg',
  //     orders: 0,
  //     isVegetarian: true,
  //   ),
  //   FoodItem(
  //     name: 'Penne Arrabbiata',
  //     imageUrl: 'https://foodish-api.com/images/pasta/pasta3.jpg',
  //     orders: 0,
  //     isVegetarian: true,
  //   ),
  //
  //   FoodItem(
  //     name: 'BBQ Chicken Pizza',
  //     imageUrl: 'https://foodish-api.com/images/pizza/pizza4.jpg',
  //     orders: 0,
  //     isVegetarian: false,
  //   ),
  //   FoodItem(
  //     name: 'Mushroom Burger',
  //     imageUrl: 'https://foodish-api.com/images/burger/burger4.jpg',
  //     orders: 0,
  //     isVegetarian: true,
  //   ),
  //   FoodItem(
  //     name: 'Brownie',
  //     imageUrl: 'https://foodish-api.com/images/dessert/dessert4.jpg',
  //     orders: 0,
  //     isVegetarian: true,
  //   ),
  //   FoodItem(
  //     name: 'Lasagna',
  //     imageUrl: 'https://foodish-api.com/images/pasta/pasta4.jpg',
  //     orders: 0,
  //     isVegetarian: false,
  //   ),
  //
  //   FoodItem(
  //     name: 'Four Cheese Pizza',
  //     imageUrl: 'https://foodish-api.com/images/pizza/pizza5.jpg',
  //     orders: 0,
  //     isVegetarian: true,
  //   ),
  //   FoodItem(
  //     name: 'Turkey Burger',
  //     imageUrl: 'https://foodish-api.com/images/burger/burger5.jpg',
  //     orders: 0,
  //     isVegetarian: false,
  //   ),
  //   FoodItem(
  //     name: 'Lemon Pie',
  //     imageUrl: 'https://foodish-api.com/images/dessert/dessert5.jpg',
  //     orders: 0,
  //     isVegetarian: true,
  //   ),
  //   FoodItem(
  //     name: 'Ravioli',
  //     imageUrl: 'https://foodish-api.com/images/pasta/pasta5.jpg',
  //     orders: 0,
  //     isVegetarian: true,
  //   ),
  //   FoodItem(
  //     name: 'White Pizza',
  //     imageUrl: 'https://foodish-api.com/images/pizza/pizza6.jpg',
  //     orders: 0,
  //     isVegetarian: true,
  //   ),
  //   FoodItem(
  //     name: 'Veggie Burger',
  //     imageUrl: 'https://foodish-api.com/images/burger/burger6.jpg',
  //     orders: 0,
  //     isVegetarian: true,
  //   ),
  //   FoodItem(
  //     name: 'Apple Pie',
  //     imageUrl: 'https://foodish-api.com/images/dessert/dessert6.jpg',
  //     orders: 0,
  //     isVegetarian: true,
  //   ),
  //   FoodItem(
  //     name: 'Macaroni & Cheese',
  //     imageUrl: 'https://foodish-api.com/images/pasta/pasta6.jpg',
  //     orders: 0,
  //     isVegetarian: true,
  //   ),
  //
  //   FoodItem(
  //     name: 'Sicilian Pizza',
  //     imageUrl: 'https://foodish-api.com/images/pizza/pizza7.jpg',
  //     orders: 0,
  //     isVegetarian: false,
  //   ),
  //   FoodItem(
  //     name: 'Wagyu Burger',
  //     imageUrl: 'https://foodish-api.com/images/burger/burger7.jpg',
  //     orders: 0,
  //     isVegetarian: false,
  //   ),
  //   FoodItem(
  //     name: 'Crème Brûlée',
  //     imageUrl: 'https://foodish-api.com/images/dessert/dessert7.jpg',
  //     orders: 0,
  //     isVegetarian: true,
  //   ),
  //   FoodItem(
  //     name: 'Tortellini',
  //     imageUrl: 'https://foodish-api.com/images/pasta/pasta7.jpg',
  //     orders: 0,
  //     isVegetarian: true,
  //   ),
  // ];

  List<FoodItem> foodItems = [
    FoodItem(
      name: 'Classic Cheeseburger',
      imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd',
      orders: 0,
      isVegetarian: false,
      category: 'fastFood',
    ),
    FoodItem(
      name: 'Garden Salad',
      imageUrl: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd',
      orders: 0,
      isVegetarian: true,
      category: 'healthy',
    ),
    FoodItem(
      name: 'Salmon Sushi Roll',
      imageUrl: 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c',
      orders: 0,
      isVegetarian: false,
      category: 'international',
    ),
    FoodItem(
      name: 'Blueberry Pancakes',
      imageUrl: 'https://images.unsplash.com/photo-1528207776546-365bb710ee93',
      orders: 0,
      isVegetarian: true,
      category: 'breakfast',
    ),
    FoodItem(
      name: 'Chicken Tacos',
      imageUrl: 'https://images.unsplash.com/photo-1565299585323-38d6b0865b47',
      orders: 0,
      isVegetarian: false,
      category: 'fastFood',
    ),
    FoodItem(
      name: 'Fruit Smoothie Bowl',
      imageUrl: 'https://images.unsplash.com/photo-1590301157890-4810ed352733',
      orders: 0,
      isVegetarian: true,
      category: 'healthy',
    ),
    FoodItem(
      name: 'Vegetable Spring Rolls',
      imageUrl: 'https://images.unsplash.com/photo-1544025162-d76694265947',
      orders: 0,
      isVegetarian: true,
      category: 'appetizer',
    ),
    FoodItem(
      name: 'Spicy Ramen',
      imageUrl: 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624',
      orders: 0,
      isVegetarian: false,
      category: 'international',
    ),
    FoodItem(
      name: 'Grilled Salmon Steak',
      imageUrl: 'https://images.unsplash.com/photo-1467003909585-2f8a72700288',
      orders: 0,
      isVegetarian: false,
      category: 'seafood',
    ),
    FoodItem(
      name: 'Eggplant Parmesan',
      imageUrl: 'https://images.unsplash.com/photo-1626074353765-517a681e40be',
      orders: 0,
      isVegetarian: true,
      category: 'italian',
    ),
    FoodItem(
      name: 'Chicken Tikka Masala',
      imageUrl: 'https://images.unsplash.com/photo-1565557623262-b51c2513a641',
      orders: 0,
      isVegetarian: false,
      category: 'international',
    ),
    FoodItem(
      name: 'Avocado Toast',
      imageUrl: 'https://images.unsplash.com/photo-1525351484163-7529414344d8',
      orders: 0,
      isVegetarian: true,
      category: 'breakfast',
    ),
    FoodItem(
      name: 'Beef Nachos',
      imageUrl: 'https://images.unsplash.com/photo-1513456852971-30c0b8199d4d',
      orders: 0,
      isVegetarian: false,
      category: 'fastFood',
    ),
    FoodItem(
      name: 'Fish and Chips',
      imageUrl: 'https://images.unsplash.com/photo-1579208575657-c595a05383b7',
      orders: 0,
      isVegetarian: false,
      category: 'seafood',
    ),
    FoodItem(
      name: 'Mushroom Risotto',
      imageUrl: 'https://images.unsplash.com/photo-1476124369491-e7addf5db371',
      orders: 0,
      isVegetarian: true,
      category: 'italian',
    ),
    FoodItem(
      name: 'BBQ Pork Ribs',
      imageUrl: 'https://images.unsplash.com/photo-1544025162-d76694265947',
      orders: 0,
      isVegetarian: false,
      category: 'mainCourse',
    ),
    FoodItem(
      name: 'Pad Thai',
      imageUrl: 'https://images.unsplash.com/photo-1559339352-11d035aa65de',
      orders: 0,
      isVegetarian: false,
      category: 'international',
    ),
    FoodItem(
      name: 'Quinoa Bowl',
      imageUrl: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd',
      orders: 0,
      isVegetarian: true,
      category: 'healthy',
    ),
    FoodItem(
      name: 'Chicken Wings',
      imageUrl: 'https://images.unsplash.com/photo-1567620832903-9fc6debc209f',
      orders: 0,
      isVegetarian: false,
      category: 'fastFood',
    ),
    FoodItem(
      name: 'Red Velvet Cupcake',
      imageUrl: 'https://images.unsplash.com/photo-1614707267537-b85aaf00c4b7',
      orders: 0,
      isVegetarian: true,
      category: 'dessert',
    ),
    FoodItem(
      name: 'Tofu Stir Fry',
      imageUrl: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c',
      orders: 0,
      isVegetarian: true,
      category: 'healthy',
    ),
    FoodItem(
      name: 'Belgian Waffles',
      imageUrl: 'https://images.unsplash.com/photo-1562329265-95a6d7a83440',
      orders: 0,
      isVegetarian: true,
      category: 'breakfast',
    ),
    FoodItem(
      name: 'Chicken Burrito',
      imageUrl: 'https://images.unsplash.com/photo-1584031036380-3fb6f2d51880',
      orders: 0,
      isVegetarian: false,
      category: 'fastFood',
    ),
    FoodItem(
      name: 'Lentil Soup',
      imageUrl: 'https://images.unsplash.com/photo-1547592166-23ac45744acd',
      orders: 0,
      isVegetarian: true,
      category: 'healthy',
    ),
    FoodItem(
      name: 'Gyoza',
      imageUrl: 'https://images.unsplash.com/photo-1541696432-82c6da8ce7bf',
      orders: 0,
      isVegetarian: false,
      category: 'international',
    ),
    FoodItem(
      name: 'Fruit Tart',
      imageUrl: 'https://images.unsplash.com/photo-1519915028121-7d3463d20b13',
      orders: 0,
      isVegetarian: true,
      category: 'dessert',
    ),
    FoodItem(
      name: 'Beef Pho',
      imageUrl: 'https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43',
      orders: 0,
      isVegetarian: false,
      category: 'international',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomDrawer(
      backgroundColor: Color(0xFFf8f8f8),
      child: Row(
        children: [
          // _ProfileSideMenu(),
          Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TrendingGridSection<DashboardItem>(
                    title: 'Trending Menus',
                    isHeader: true,
                    selectedValue: selectedDashboardMenu,
                    dropdownItems: dashboardMenuitems,
                    onDropdownChanged: (value) {
                      setState(() => selectedDashboardMenu = value);
                    },
                    crossAxisCount: Responsive.isMobile(context)
                        ? 1
                        :  MediaQuery.of(context).size.width > 700? 3:MediaQuery.of(context).size.width > 700 &&
                        MediaQuery.of(context).size.width > 900
                        ? 4
                        : 5,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: MediaQuery.of(context).size.width <= 600
                        ? 1.250
                        : MediaQuery.of(context).size.width > 700
                        ? 1.0
                        : MediaQuery.of(context).size.width > 700 &&
                              MediaQuery.of(context).size.width > 900
                        ? 0.90
                        : MediaQuery.of(context).size.width > 900 &&
                              MediaQuery.of(context).size.width > 1100
                        ? 1.0
                        : 0.90,

                    dropdownChildBuilder: (item) => Row(
                      children: [
                        Text(item?.title ?? ''),
                        const Icon(Icons.keyboard_arrow_down),
                      ],
                    ),

                    dropdownItemBuilder: (item, isSelected) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(item?.title ?? ''),
                    ),

                    itemCount: foodItems.length,
                    itemBuilder: (context, index) {
                      return FoodCard(item: foodItems[index]);
                    },
                  ),
                ],
              ),
            ),
          ),
          if (MediaQuery.of(context).size.width > 1000) ...[
            Expanded(flex: 2, child: SizedBox(width: 300)),
          ],
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
    return CustomContainer(
      width: double.infinity,
      height: 1,
      padding: EdgeInsets.only(top: 9, left: 8, right: 8, bottom: 9),
      borderRadius: BorderRadius.circular(5),
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: Color(0xFFE2E8F0), width: 1),
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
              aspectRatio: MediaQuery.of(context).size.width <= 700
                  ? 1.9 / 1
                  : MediaQuery.of(context).size.width < 1100
                  ? 3 / 2
                  : 3.2 / 1.5,
              child: Image.network(item.imageUrl, fit: BoxFit.cover),
            ),
          ),

          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                '${CommonWidgets.capitalizeFirstLetter('${item.category}')}',
                style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
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
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Text(
                '\$23: ${item.orders}',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  SvgPicture.asset(AppAssets.subIcon, width: 20, height: 20),
                  SizedBox(width: 12),
                  Text(
                    '${item.orders}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 12),
                  SvgPicture.asset(AppAssets.addIcon, width: 20, height: 20),
                ],
              ),
            ],
          ),
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
    final Color color = isVeg ? Colors.green : Colors.red;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      child: Row(
        children: [
          SvgPicture.asset(
            AppAssets.veg_nonVeg_Icon,
            colorFilter: ColorFilter.mode(
              isVeg ? AppColors.green : AppColors.red,
              BlendMode.srcIn,
            ),
            height: 12,
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
      ),
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
