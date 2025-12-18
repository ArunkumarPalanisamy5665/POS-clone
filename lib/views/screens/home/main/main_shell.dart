import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_hrms_flutter/views/widgets/common/custom_container.dart';

import '../../../../core/constants/app_export.dart';
import '../../../../domain/models/dashBoardModel/dash_board_menu_model.dart';
import '../../../widgets/common/custom_divider.dart';
import '../../../widgets/common/custom_mouse_region.dart';
import '../../../widgets/common/custom_text.dart';
import '../../../widgets/common/drop_down_cards.dart';
import '../../../widgets/toolBar/filter_tabs_tool.dart';
import 'main_side_menu.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery
          .of(context)
          .size
          .width < 768;

  static bool isDesktop(BuildContext context) =>
      MediaQuery
          .of(context)
          .size
          .width >= 1024;
}

bool isExpandMenu = true;

class MainShell extends StatefulWidget {
  final Widget child;

  const MainShell({super.key, required this.child});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    RestaurantItem? selectedRestaurant = restaurantLists.isNotEmpty
        ? restaurantLists.first
        : null;

    return CustomDrawer(
      backgroundColor: AppColors.greySide,
      drawer: isDesktop ? null : const Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        width: 300, child: MainSideMenu(isExpandMenu: true,)),

      child: Row(
        children: [
          if(isDesktop) Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(isDesktop) Row(
                children: [
                  SizedBox(
                    height: 40,
                    width: 65,
                    child: Center(
                      child: SvgPicture.asset(
                        AppAssets.mainLogoIcon,
                        width: 30,
                        height: 32,
                      ),
                    ),
                  ),

                  CustomContainer(
                    width: isExpandMenu ? 230 : 65,
                    height: 55,
                    onTap: () {},
                    borderRadius: BorderRadius.circular(0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        left: BorderSide(
                          width: 0.5,
                          color: Colors.black.withAlpha((0.2 * 255).toInt()),
                        ),
                        right: BorderSide(
                          width: 0.5,
                          color: Colors.black.withAlpha((0.2 * 255).toInt()),
                        ),
                        bottom: BorderSide(
                          width: 0.5,
                          color: Colors.black.withAlpha((0.2 * 255).toInt()),
                        ),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (isExpandMenu) ...[
                            SizedBox(width: 10),
                            Flexible(
                              child: DropDownCards<RestaurantItem?>(
                                value: selectedRestaurant,
                                items: restaurantLists,
                                onChanged: (module) {
                                  setState(() => selectedRestaurant = module);
                                },
                                childBuilder: (module) =>
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (module?.svgIcon != null)
                                          Image.asset(
                                            module!.svgIcon!,
                                            width: 22,
                                            height: 22,
                                            errorBuilder: (context, error,
                                                stackTrace) {
                                              return const Icon(
                                                Icons.image_not_supported,
                                                size: 16,
                                              );
                                            },
                                          ),
                                        const SizedBox(width: 8),
                                        Flexible(
                                          child: CustomText(
                                            "${module?.title}",
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .titleLarge
                                                ?.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: SvgPicture.asset(
                                            AppAssets.dropDownIcon,
                                            width: 16,
                                            height: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                itemBuilder: (module, isSelected) =>
                                    Row(
                                      children: [
                                        if (module?.svgIcon != null)
                                          Image.asset(
                                            module!.svgIcon!,
                                            width: 16,
                                            height: 16,
                                            errorBuilder: (context, error,
                                                stackTrace) {
                                              return const Icon(
                                                Icons.image_not_supported,
                                                size: 16,
                                              );
                                            },
                                          ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                            child: Text("${module?.title}")),
                                      ],
                                    ),
                              ),
                            ),
                          ],

                          InkWell(
                            onTap: () {
                              setState(() {
                                isExpandMenu = !isExpandMenu;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 23, right: 10),
                              child: SvgPicture.asset(
                                AppAssets.expandIcon,
                                width: 16,
                                height: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(child: MainSideMenu(isExpandMenu: isExpandMenu,)),

            ],
          ),
          Expanded(
            child: Column(
              children: [
                _buildTopBar(context, isDesktop),

                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    color: const Color(0xFFF5F5F5),
                    child: widget.child,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildTopBar(BuildContext context, bool isDesktop) {
  return Container(
    height: 56,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: const BoxDecoration(
      color: Colors.white,
      border: Border(bottom: BorderSide(color: Color(0xFFE2E8F0))),
    ),
    child: Row(
      children: [
        if (!isDesktop)
          Builder(
            builder: (ctx) =>
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(ctx).openDrawer(),
                ),
          ),

        if (isDesktop) const FilterTabsTool(),

        const Spacer(),
        _buildTopActions(),
      ],
    ),
  );
}


int hoveredIndex = -1;

// class FilterTabs extends StatefulWidget {
//   const FilterTabs({super.key});
//
//   @override
//   State<FilterTabs> createState() => _FilterTabsState();
// }
//
// class _FilterTabsState extends State<FilterTabs> {
//   int hoveredIndex = -1;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(2),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(6),
//         color: AppColors.greySide,
//         border: Border.all(
//           color: Color(0xFFE2E8F0),
//           width: 0.70,
//         ),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: List.generate(toolList.length, (index) {
//           final item = toolList[index];
//           final bool isHovered = hoveredIndex == index;
//
//           return CustomMouseRegion(
//             onHoverChanged: (hovered) {
//               setState(() {
//                 hoveredIndex = hovered ? index : -1;
//               });
//             },
//             onEnter: (_) => debugPrint('enter ${item.title}'),
//             onExit: (_) => debugPrint('exit ${item.title}'),
//             child: InkWell(
//               borderRadius: BorderRadius.circular(6),
//               onTap: () {
//                 GoRouter.of(context).go(item.route);
//               },
//               child: Container(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 12, vertical: 6),
//                 decoration: BoxDecoration(
//                   color: Colors.transparent,
//                   borderRadius: BorderRadius.circular(6),
//                 ),
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: [
//                       SvgPicture.asset(
//                         item.svgIcon,
//                         width: 15,
//                         height: 15,
//                         colorFilter: ColorFilter.mode(
//                           isHovered ? AppColors.primaryColor : AppColors.black,
//                           BlendMode.srcIn,
//                         ),
//                       ),
//                       const SizedBox(width: 6),
//                       CustomText(
//                         item.title,
//                         overflow: TextOverflow.ellipsis,
//                         style: Theme
//                             .of(context)
//                             .textTheme
//                             .titleLarge
//                             ?.copyWith(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                           color:
//                           isHovered ? AppColors.primaryColor : AppColors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }


Widget _buildTopActions() {
  return

    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(AppAssets.upgradeIcon, width: 98, height: 33),
        SizedBox(width: 8,),
        CustomContainer(
          width: 30,
          height: 30,
          onTap: () {},
          isNeedHover: true,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.black.withAlpha(
              (0.2 * 255).toInt(),
            ), width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: SvgPicture.asset(AppAssets.searchIcon, width: 16, height: 16),
          ),),
        SizedBox(width: 8,),
        CustomContainer(
          width: 30,
          height: 30,
          onTap: () {},
          isNeedHover: true,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.black.withAlpha(
              (0.2 * 255).toInt(),
            ), width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: SvgPicture.asset(AppAssets.reportIcon, width: 16, height: 16),
          ),),

      ],
    );
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Dashboard Screen'));
  }
}

class PosScreen extends StatelessWidget {
  const PosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('POS Screen'));
  }
}

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Orders Screen'));
  }
}

class KitchenScreen extends StatelessWidget {
  const KitchenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Kitchen Screen'));
  }
}

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Reservation Screen'));
  }
}


// class MainShell extends StatelessWidget {
//   final Widget child;
//
//   const MainShell({super.key, required this.child});
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//
//         final width = constraints.maxWidth;
//         final isMobile = Responsive.isMobile(context);
//         final isTablet = MediaQuery.of(context).size.width >= 1000;
//         final isDesktop = Responsive.isDesktop(context) ;
//
//
//         return CustomDrawer(
//           backgroundColor: const Color(0xFFF5F5F5),
//           drawer: !isDesktop? Drawer(child: MainSideMenu()) : null,
//           child: Row(
//             children: [
//               if (isDesktop) const MainSideMenu(),
//
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       _buildTopBar(isMobile,context),
//                       Expanded(
//                         child: Container(
//                           padding: const EdgeInsets.all(16),
//                           color: const Color(0xFFF5F5F5),
//                           child: child,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//
//
//
// Widget _buildTopBar(bool isMobile, BuildContext context) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//     decoration: const BoxDecoration(
//       color: Colors.white,
//       border: Border(bottom: BorderSide(color: Color(0xFFE2E8F0))),
//     ),
//     child: Row(
//       children: [
//         if (Responsive.isMobile(context) || MediaQuery.of(context).size.width < 1000)
//           Builder(
//             builder: (context) => IconButton(
//               icon: const Icon(Icons.menu),
//               onPressed: () => Scaffold.of(context).openDrawer(),
//             ),
//           ),
//         if (MediaQuery.of(context).size.width > 1000) _buildFilterTabs(),
//         const Spacer(),
//         _buildTopActions(),
//       ],
//     ),
//   );
// }
//
// Widget _buildFilterTabs() {
//   final tabs = ['POS', 'Orders', 'Kitchen', 'Reservation', 'Table'];
//   return Container(
//     padding: const EdgeInsets.all(4),
//     decoration: BoxDecoration(
//       color: const Color(0xFFF1F5F9),
//       borderRadius: BorderRadius.circular(6),
//     ),
//     child: Row(
//       children: tabs
//           .map(
//             (e) => Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 12,
//             vertical: 6,
//           ),
//           child: Text(
//             e,
//             style: const TextStyle(fontWeight: FontWeight.w500),
//           ),
//         ),
//       )
//           .toList(),
//     ),
//   );
// }
//
// Widget _buildTopActions() {
//   return Row(
//     children: [
//       _button('Upgrade', primary: true),
//       const SizedBox(width: 10),
//       _iconButton(Icons.notifications),
//     ],
//   );
// }
//
// Widget _button(String text, {bool primary = false}) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//     decoration: BoxDecoration(
//       color: primary ? const Color(0xFF0C76E1) : Colors.white,
//       borderRadius: BorderRadius.circular(6),
//       border: primary ? null : Border.all(color: Colors.grey.shade300),
//     ),
//     child: Text(
//       text,
//       style: TextStyle(color: primary ? Colors.white : Colors.black),
//     ),
//   );
// }
//
//
// Widget _iconButton(IconData icon) {
//   return Container(
//     padding: const EdgeInsets.all(8),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(6),
//       border: Border.all(color: Colors.grey.shade300),
//     ),
//     child: Icon(icon, size: 18),
//   );
// }

//screens

//
// class DashboardScreen extends StatelessWidget {
//   const DashboardScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text('Dashboard Screen'));
//   }
// }
//
// class PosScreen extends StatelessWidget {
//   const PosScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text('POS Screen'));
//   }
// }
//
// class OrdersScreen extends StatelessWidget {
//   const OrdersScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text('Orders Screen'));
//   }
// }
//
// class KitchenScreen extends StatelessWidget {
//   const KitchenScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text('Kitchen Screen'));
//   }
// }
//
// class ReservationScreen extends StatelessWidget {
//   const ReservationScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text('Reservation Screen'));
//   }
// }
