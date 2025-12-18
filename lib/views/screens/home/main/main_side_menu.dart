import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:new_hrms_flutter/views/widgets/common/custom_container.dart';
import 'package:new_hrms_flutter/views/widgets/common/custom_mouse_region.dart';
import 'package:new_hrms_flutter/views/widgets/common/custom_text.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../domain/models/dashBoardModel/dash_board_menu_model.dart';
import '../../../widgets/common/custom_divider.dart';
import '../../../widgets/common/drop_down_cards.dart';

class MainSideMenu extends StatefulWidget {
  final bool isExpandMenu;

  const MainSideMenu({super.key, required this.isExpandMenu});

  @override
  State<MainSideMenu> createState() => _MainSideMenuState();
}

class _MainSideMenuState extends State<MainSideMenu> {
  int selectedMainIndex = 0;
  int hoveredMainIndex = -1; //for left menu
  int hoveredSubIndex = -1; //for sub menu
  int selectedSubIndex = -1;
  DashboardItem? selectedSubMenu;
  RestaurantItem? selectedRestaurant = restaurantLists.isNotEmpty
      ? restaurantLists.first
      : null;

  @override
  void initState() {
    super.initState();
    selectedSubMenu = dashboardIcons.first.dashboardItem.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIconSidebar(context),
        _buildSubMenu(context, widget.isExpandMenu),
      ],
    );
  }

  Widget _buildIconSidebar(BuildContext context) {
    return Container(
      width: 65,
      height: double.infinity,
      color: AppColors.greySide,
      child: Stack(
        children: [
          Positioned.fill(
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(scrollbars: false),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 90),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    ...List.generate(dashboardIcons.length, (index) {
                      final item = dashboardIcons[index];
                      final isSelected = selectedMainIndex == index;
                      final isHovered = hoveredMainIndex == index;

                      return CustomMouseRegion(
                        onHoverChanged: (hovered) {
                          setState(() {
                            hoveredMainIndex = hovered ? index : -1;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: InkWell(
                            onTap: () {
                              final firstSub =
                                  dashboardIcons[index].dashboardItem.first;

                              setState(() {
                                selectedMainIndex = index;
                                selectedSubMenu = firstSub;
                              });

                              context.go(firstSub.route);
                            },
                            borderRadius: BorderRadius.circular(6),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: isSelected || isHovered
                                    ? Colors.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(6),
                                border: isSelected || isHovered
                                    ? Border.all(
                                        width: 0.5,
                                        color: isSelected || isHovered
                                            ? Colors.black.withAlpha((0.4 * 255).toInt(),)
                                            : Colors.black.withAlpha((0.2 * 255).toInt(),),
                                      )
                                    : null,
                              ),
                              child: SvgPicture.asset(
                                item.svgIcon,
                                width: 15,
                                height: 15,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SvgPicture.asset(AppAssets.notifyAlertIcon, width: 30),
                const SizedBox(height: 20),
                Image.asset(AppAssets.profileIcon, width: 35),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubMenu(BuildContext context, bool isExpandMenu) {
    final currentSubMenu = dashboardIcons[selectedMainIndex].dashboardItem;

    return CustomContainer(
      width: isExpandMenu ? 230 : 65,
      height: double.infinity,
      padding: const EdgeInsets.all(12),
      borderRadius: BorderRadius.circular(0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black.withAlpha((0.2 * 255).toInt()),
          width: 0.40,
        ),
      ),
      onTap: () {},
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isExpandMenu) ...[
              const SizedBox(height: 15),
              CustomText(
                dashboardIcons[selectedMainIndex].title.toUpperCase(),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 14,
                  color: const Color(0xFF64748B),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 9),
            ],

            ...List.generate(currentSubMenu.length, (index) {
              final item = currentSubMenu[index];

              final bool isActive =
                  hoveredSubIndex == index || selectedSubIndex == index;

              return CustomMouseRegion(
                onHoverChanged: (hovered) {
                  setState(() {
                    hoveredSubIndex = hovered ? index : -1;
                  });
                },
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedSubIndex = index;
                      hoveredSubIndex = -1;
                    });
                    context.go(item.route);
                  },
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    margin: EdgeInsets.only(bottom: isActive ? 2 : 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isActive ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                      border: isActive
                          ? Border.all(
                              width: 0.5,
                              color: Colors.black.withAlpha(
                                (0.2 * 255).toInt(),
                              ),
                            )
                          : null,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(item.svgIcon, width: 14,
                            colorFilter: ColorFilter.mode(isActive? AppColors.primaryColor : Colors.black.withAlpha(
                              (0.8 * 255).toInt(),
                            ), BlendMode.srcIn)),
                        if (isExpandMenu) ...[
                          const SizedBox(width: 8),
                          CustomText(
                            item.title,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: isActive? AppColors.primaryColor :Colors.black,
                                  fontWeight: isActive? FontWeight.w600 :FontWeight.w500,
                                  fontSize: 14,
                                ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

final List<RestaurantItem> restaurantLists = [
  RestaurantItem(title: 'Streak House', svgIcon: AppAssets.dropMenu1),
  RestaurantItem(title: 'Hotchilli hub', svgIcon: AppAssets.dropMenu2),
  RestaurantItem(title: 'The Favour Lab', svgIcon: AppAssets.dropMenu3),
];
