import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double thickness;

  final Color? color;

  final double verticalPadding;

  final double indent;

  final double endIndent;

  final String? label;

  final TextStyle? labelStyle;

  final bool isDashed;

  final double dashWidth;

  final double dashGap;

  const CustomDivider({
    super.key,
    this.thickness = 1,
    this.color,
    this.verticalPadding = 12,
    this.indent = 0,
    this.endIndent = 0,
    this.label,
    this.labelStyle,
    this.isDashed = false,
    this.dashWidth = 6,
    this.dashGap = 4,
  });

  @override
  Widget build(BuildContext context) {
    final dividerColor =
        color ?? Theme.of(context).dividerColor.withOpacity(0.4);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: label == null
          ? _buildLine(dividerColor)
          : Row(
              children: [
                Expanded(child: _buildLine(dividerColor)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    label!,
                    style:
                        labelStyle ??
                        Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(color: dividerColor),
                  ),
                ),
                Expanded(child: _buildLine(dividerColor)),
              ],
            ),
    );
  }

  Widget _buildLine(Color color) {
    if (!isDashed) {
      return Divider(
        thickness: thickness,
        color: color,
        indent: indent,
        endIndent: endIndent,
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final dashCount = (constraints.maxWidth / (dashWidth + dashGap))
            .floor();

        return Row(
          children: List.generate(dashCount, (index) {
            return Padding(
              padding: EdgeInsets.only(right: dashGap),
              child: SizedBox(
                width: dashWidth,
                child: Divider(thickness: thickness, color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
