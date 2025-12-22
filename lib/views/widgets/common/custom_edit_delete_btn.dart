import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/core/constants/app_export.dart';

class CustomEditDeleteBtn extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  final double iconSize;
  final double padding;
  final double borderWidth;
  final Color borderColor;
  final double spacing;

  const CustomEditDeleteBtn({
    super.key,
    required this.onEdit,
    required this.onDelete,
    this.iconSize = 14,
    this.padding = 6,
    this.borderWidth = 0.30,
    this.borderColor = Colors.black,
    this.spacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ActionButton(
          icon: Icons.edit,
          iconColor: Colors.grey,
          onTap: onEdit,
          iconSize: iconSize,
          padding: padding,
          borderWidth: borderWidth,
          borderColor: borderColor,
        ),
        SizedBox(width: spacing),
        _ActionButton(
          icon: Icons.delete,
          iconColor: Colors.red,
          onTap: onDelete,
          iconSize: iconSize,
          padding: padding,
          borderWidth: borderWidth,
          borderColor: borderColor,
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;
  final double iconSize;
  final double padding;
  final double borderWidth;
  final Color borderColor;

  const _ActionButton({
    required this.icon,
    required this.iconColor,
    required this.onTap,
    required this.iconSize,
    required this.padding,
    required this.borderWidth,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      isNeedHover: true,
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor.withAlpha((0.7 * 255).toInt()),
          width: borderWidth,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}
