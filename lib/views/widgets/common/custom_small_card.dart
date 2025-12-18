import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'custom_container.dart';
import 'custom_text.dart';

class CustomSmallCard extends StatelessWidget {
  final String text;
  final String? svgIcon;
  final VoidCallback? onTap;
  final TextStyle? textStyle;
  final bool prefixIcon;
  final bool suffixIcon;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry padding;
  final bool isNeedHover;

  const CustomSmallCard({
    super.key,
    required this.text,
    this.svgIcon,
    this.onTap,
    this.textStyle,
    this.prefixIcon = false,
    this.suffixIcon = false,
    this.backgroundColor,
    this.borderRadius,
    this.decoration,
    this.padding = const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
    this.isNeedHover = true,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      onTap: onTap ?? () {},
      isNeedHover: isNeedHover,
      padding: padding,
      borderRadius: borderRadius ?? BorderRadius.circular(5),
      decoration:
          decoration ??
          BoxDecoration(
            color: backgroundColor ?? Colors.white,
            border: Border.all(color: Colors.grey.shade300, width: 0.75),
          ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (prefixIcon && svgIcon != null) ...[
            SvgPicture.asset(svgIcon!, width: 16, height: 16),
            const SizedBox(width: 6),
          ],

          CustomText(
            text,
            style:
                textStyle ??
                Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
          ),

          if (suffixIcon) ...[
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down_rounded, size: 20),
          ],
        ],
      ),
    );
  }
}
