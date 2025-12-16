import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconContainer extends StatelessWidget {

  final VoidCallback onTap;
  final double width;
  final double height;
  final bool isCircular;
  final double borderRadius;
  final Color borderColor;
  final Color backgroundColor;
  final IconData? icon;
  final String? svgAsset;
  final String? imageAsset;
  final Color iconColor;
  final double iconSize;
  final String? label;
  final TextStyle? labelStyle;
  final double spacing;

  const CustomIconContainer({
    super.key,
    required this.onTap,
    this.width = 40,
    this.height = 40,
    this.isCircular = false,
    this.borderRadius = 8,
    this.borderColor = Colors.grey,
    this.backgroundColor = Colors.transparent,
    this.icon,
    this.svgAsset,
    this.imageAsset,
    this.iconColor = Colors.black,
    this.iconSize = 20,
    this.label,
    this.labelStyle,
    this.spacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(
        isCircular ? width / 2 : borderRadius,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildContainer(),
          if (label != null) ...[
            SizedBox(width: spacing),
            Text(
              label!,
              style: labelStyle ??
                  Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildContainer() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
        borderRadius:
        isCircular ? null : BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: Center(
        child: _buildIcon(),
      ),
    );
  }

  Widget _buildIcon() {
    if (svgAsset != null) {
      return SvgPicture.asset(
        svgAsset!,
        width: iconSize,
        height: iconSize,
        colorFilter:
        ColorFilter.mode(iconColor, BlendMode.srcIn),
      );
    }

    if (imageAsset != null) {
      return Image.asset(
        imageAsset!,
        width: iconSize,
        height: iconSize,
        fit: BoxFit.contain,
      );
    }

    if (icon != null) {
      return Icon(
        icon,
        size: iconSize,
        color: iconColor,
      );
    }

    return const SizedBox.shrink();
  }
}
