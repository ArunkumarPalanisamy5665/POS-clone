import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  final double width;
  final double height;
  final bool isCircular;
  final double borderRadius;

  final Color borderColor;
  final Color activeBorderColor;
  final Color activeColor;
  final Color backgroundColor;
  final Color checkColor;

  final String? label;
  final TextStyle? labelStyle;
  final double spacing;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.width = 22,
    this.height = 22,
    this.isCircular = false,
    this.borderRadius = 6,
    this.borderColor = Colors.grey,
    this.activeBorderColor = Colors.blue,
    this.activeColor = Colors.blue,
    this.backgroundColor = Colors.transparent,
    this.checkColor = Colors.white,
    this.label,
    this.labelStyle,
    this.spacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(
        isCircular ? width / 2 : borderRadius,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildCheckbox(),
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

  Widget _buildCheckbox() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeInOut,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: isCircular
            ? backgroundColor
            : (value ? activeColor : backgroundColor),
        shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
        borderRadius:
        isCircular ? null : BorderRadius.circular(borderRadius),
        border: Border.all(
          color: value ? activeBorderColor : borderColor,
          width: 1.6,
        ),
      ),
      child: value && isCircular
      // 🔘 Circle → inside dot
          ? Center(
        child: Container(
          width: width * 0.45,
          height: height * 0.45,
          decoration: BoxDecoration(
            color: activeColor,
            shape: BoxShape.circle,
          ),
        ),
      )
          : null,
    );
  }
}
