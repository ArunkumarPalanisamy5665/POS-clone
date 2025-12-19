import 'package:flutter/material.dart';

import 'custom_container.dart';

class CustomArrow extends StatelessWidget {
  final VoidCallback? onLeftTap;
  final VoidCallback? onRightTap;
  final double size;
  final Color backgroundColor;
  final Color iconColor;
  final double borderRadius;
  final EdgeInsets padding;

  const CustomArrow({
    super.key,
    this.onLeftTap,
    this.onRightTap,
    this.size = 36,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.black,
    this.borderRadius = 8,
    this.padding = const EdgeInsets.all(6),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _ArrowButton(
          icon: Icons.arrow_back_rounded,
          onTap: onLeftTap,
          size: size,
          backgroundColor: backgroundColor,
          iconColor: iconColor,
          borderRadius: borderRadius,
          padding: padding,
        ),
        const SizedBox(width: 8),
        _ArrowButton(
          icon: Icons.arrow_forward_rounded,
          onTap: onRightTap,
          size: size,
          backgroundColor: backgroundColor,
          iconColor: iconColor,
          borderRadius: borderRadius,
          padding: padding,
        ),
      ],
    );
  }
}

class _ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final double size;
  final Color backgroundColor;
  final Color iconColor;
  final double borderRadius;
  final EdgeInsets padding;

  const _ArrowButton({
    required this.icon,
    required this.onTap,
    required this.size,
    required this.backgroundColor,
    required this.iconColor,
    required this.borderRadius,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: size,
      height: size,
      padding: padding,
      isNeedHover: true,
      onTap: () {
        onTap!();
      },
      borderRadius: BorderRadius.circular(borderRadius),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Icon(icon, color: iconColor, size: 18),
    );
  }
}
