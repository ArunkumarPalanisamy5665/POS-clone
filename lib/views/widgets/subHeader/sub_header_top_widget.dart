import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/core/constants/app_export.dart';

import '../common/custom_button2.dart';
import '../common/custom_textfield.dart';
import '../common/section_header.dart';

class SubHeaderTopWidget extends StatelessWidget {

  final String title;
  final TextEditingController searchController;
  final String? headerIcon;
  final VoidCallback? onHeaderIconTap;
  final String searchHint;
  final double searchWidth;
  final ValueChanged<String>? onSearchChanged;
  final GlobalKey<State<StatefulWidget>>? buttonKey;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final bool showButton;
  final Widget? buttonIcon;

  const SubHeaderTopWidget({
    super.key,

    // Header
    required this.title,
    this.headerIcon,
    this.onHeaderIconTap,

    // Search
    required this.searchController,
    this.searchHint = 'Search',
    this.searchWidth = 200,
    this.onSearchChanged,

    // Button
    this.buttonKey,
    required this.buttonText,
    required this.onButtonPressed,
    this.showButton = true,
    this.buttonIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SectionHeader(
              title: title,
              titleStyle: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
              iconAsset: headerIcon?? AppAssets.refreshIcon,
              onIconTap: onHeaderIconTap,
            ),

            Row(
              children: [
                SizedBox(
                  width: searchWidth,
                  child: CustomTextField(
                    height: 48,
                    hint: searchHint,
                    controller: searchController,
                    onChanged: onSearchChanged,
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    borderColor: AppColors.grey.withAlpha(
                      (0.3 * 255).toInt(),
                    ),
                    focusColor: AppColors.grey.withAlpha(
                      (0.3 * 255).toInt(),
                    ),
                    cursorColor: Colors.black.withAlpha(
                      (0.7 * 255).toInt(),
                    ),
                    borderWidth: 0.75,
                    fillColor: Colors.white,
                    suffixIcon: Icons.search,
                    iconSize: 14,
                    iconColor: Colors.black,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                    isLabel: false,
                  ),
                ),

                if (showButton) ...[
                  const SizedBox(width: 12),

                  CustomButton2(
                    key: buttonKey,
                    onPressed: onButtonPressed,
                    btnName: buttonText,
                    isDisable: false,
                    isAnimate: true,
                    isBold: true,
                    buttonHeight: 35,
                    buttonWidth: 130,
                    size: ButtonSize.medium,
                    textSize: 14,
                    textColor: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    buttonColor: AppColors.primaryColor,
                    borderColor: Colors.black.withAlpha(
                      (0.2 * 255).toInt(),
                    ),
                    hideBackground: false,
                    icon: buttonIcon,
                    iconNeed: buttonIcon != null,
                    showBorder: false,
                  ),
                ],
              ],
            ),
          ],
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}
