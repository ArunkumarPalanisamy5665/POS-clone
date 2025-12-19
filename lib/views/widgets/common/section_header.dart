import 'package:flutter/material.dart';

import 'custom_text.dart';
import 'hover_icon_button.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String iconAsset;
  final VoidCallback? onIconTap;
  final TextStyle? titleStyle;
  final double spacing;

  const SectionHeader({
    super.key,
    required this.title,
    required this.iconAsset,
    this.onIconTap,
    this.titleStyle,
    this.spacing = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          title,
          style: titleStyle ??
              const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(width: spacing),
        if (onIconTap != null)
          HoverIconButton(
            asset: iconAsset,
            onTap: onIconTap!,
          ),
      ],
    );
  }
}
