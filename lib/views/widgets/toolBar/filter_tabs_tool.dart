import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_hrms_flutter/core/constants/app_export.dart';

import '../../../domain/models/dashBoardModel/dash_board_menu_model.dart';




class FilterTabsTool extends StatefulWidget {
  const FilterTabsTool({super.key});

  @override
  State<FilterTabsTool> createState() => _FilterTabsState();
}

class _FilterTabsState extends State<FilterTabsTool> {
  int hoveredIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.greySide,
        border: Border.all(
          color: Color(0xFFE2E8F0),
          width: 0.70,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(toolList.length, (index) {
          final item = toolList[index];
          final bool isHovered = hoveredIndex == index;

          return CustomMouseRegion(
            onHoverChanged: (hovered) {
              setState(() {
                hoveredIndex = hovered ? index : -1;
              });
            },
            onEnter: (_) => debugPrint('enter ${item.title}'),
            onExit: (_) => debugPrint('exit ${item.title}'),
            child: InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: () {
                GoRouter.of(context).go(item.route);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        item.svgIcon,
                        width: 15,
                        height: 15,
                        colorFilter: ColorFilter.mode(
                          isHovered ? AppColors.primaryColor : AppColors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 6),
                      CustomText(
                        item.title,
                        overflow: TextOverflow.ellipsis,
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color:
                          isHovered ? AppColors.primaryColor : AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
