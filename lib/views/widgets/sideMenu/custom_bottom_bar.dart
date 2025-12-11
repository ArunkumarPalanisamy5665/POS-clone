import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  final Color backgroundColor;
  final Color selectedBackgroundColor;
  final Color iconColor;
  final Color selectedIconColor;
  final Color textColor;
  final Color selectedTextColor;
  final Color unSelectedTextColor;
  final Color accentColor;

  final double iconSize;
  final double selectedIconSize;
  final double barHeight;
  final double borderRadius;

  final double blurSigmaX;
  final double blurSigmaY;

  CustomBottomBar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
    this.backgroundColor = Colors.white,
    this.selectedBackgroundColor = const Color(0xFFE6EEFF),
    this.iconColor = const Color(0xFF9CA3AF),
    this.selectedIconColor = const Color(0xFF2E5FFF),
    this.textColor = const Color(0xFF9CA3AF),
    this.selectedTextColor = const Color(0xFF2E5FFF),
    this.unSelectedTextColor = const Color(0xFF2E5FFF),
    this.accentColor = const Color(0xFF2E5FFF),
    this.iconSize = 22,
    this.selectedIconSize = 26,
    this.barHeight = 78,
    this.borderRadius = 26,
    this.blurSigmaX = 18,
    this.blurSigmaY = 18,
  }) : super(key: key);

  final List<IconData> icons = const [
    Icons.home_rounded,
    Icons.person_rounded,
    Icons.settings_rounded,
    Icons.check_circle_rounded,
  ];

  final List<String> labels = const [
    "Home",
    "Profile",
    "Settings",
    "Attendance",
  ];

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;

    final bool isTablet = w >= 600 && w < 1024;
    final bool isDesktop = w >= 1024;

    final double barWidth = isTablet
        ? 480
        : isDesktop
        ? 520
        : w - 30;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blurSigmaX, sigmaY: blurSigmaY),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              width: barWidth,
              height: barHeight,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: backgroundColor.withOpacity(0.85),
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                  color: selectedIconColor.withOpacity(0.15),
                  width: 1.3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: selectedIconColor.withOpacity(0.25),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final double itemWidth =
                      (constraints.maxWidth - 20) / icons.length;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      icons.length,
                          (i) => _item(i),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _item(int index) {
    final bool active = index == selectedIndex;

    return Expanded(
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: accentColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        onTap: () => onTap(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedScale(
                scale: active ? 1.22 : 1.0,
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOutBack,
                child: Icon(
                  icons[index],
                  size: active ? selectedIconSize : iconSize,
                  color: active ? selectedIconColor : iconColor,
                ),
              ),

              const SizedBox(height: 2),

              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: 1,
                child: Text(
                  labels[index],
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w600,
                    color: active ? selectedTextColor : unSelectedTextColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
