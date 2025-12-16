import 'package:flutter/material.dart';

enum DividerStyle { solid, dashed, dotted }

class CustomDivider extends StatelessWidget {
  final double thickness;
  final Color? color;
  final double verticalPadding;
  final double horizontalPadding;
  final double indent;
  final double endIndent;
  final String? label;
  final TextStyle? labelStyle;

  // Style properties
  final DividerStyle style;
  final double dashWidth;
  final double dashGap;
  final double dotSize;
  final double dotGap;

  // Orientation
  final bool isVertical;

  const CustomDivider({
    super.key,
    this.thickness = 1,
    this.color,
    this.verticalPadding = 12,
    this.horizontalPadding = 12,
    this.indent = 0,
    this.endIndent = 0,
    this.label,
    this.labelStyle,
    this.style = DividerStyle.solid,
    this.dashWidth = 6,
    this.dashGap = 4,
    this.dotSize = 2,
    this.dotGap = 4,
    this.isVertical = false,
  });

  // Named constructors for convenience
  const CustomDivider.dashed({
    super.key,
    this.thickness = 1,
    this.color,
    this.verticalPadding = 12,
    this.horizontalPadding = 12,
    this.indent = 0,
    this.endIndent = 0,
    this.label,
    this.labelStyle,
    this.dashWidth = 6,
    this.dashGap = 4,
    this.isVertical = false,
  })  : style = DividerStyle.dashed,
        dotSize = 2,
        dotGap = 4;

  const CustomDivider.dotted({
    super.key,
    this.thickness = 1,
    this.color,
    this.verticalPadding = 12,
    this.horizontalPadding = 12,
    this.indent = 0,
    this.endIndent = 0,
    this.label,
    this.labelStyle,
    this.dotSize = 2,
    this.dotGap = 4,
    this.isVertical = false,
  })  : style = DividerStyle.dotted,
        dashWidth = 6,
        dashGap = 4;

  const CustomDivider.vertical({
    super.key,
    this.thickness = 1,
    this.color,
    this.horizontalPadding = 12,
    this.indent = 0,
    this.endIndent = 0,
    this.style = DividerStyle.solid,
    this.dashWidth = 6,
    this.dashGap = 4,
    this.dotSize = 2,
    this.dotGap = 4,
  })  : isVertical = true,
        verticalPadding = 12,
        label = null,
        labelStyle = null;

  @override
  Widget build(BuildContext context) {
    final dividerColor =
        color ?? Theme.of(context).dividerColor.withOpacity(0.4);

    if (isVertical) {
      return _buildVerticalDivider(dividerColor);
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: label == null
          ? _buildLine(dividerColor, isVertical: false)
          : Row(
        children: [
          Expanded(child: _buildLine(dividerColor, isVertical: false)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              label!,
              style: labelStyle ??
                  Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: dividerColor),
            ),
          ),
          Expanded(child: _buildLine(dividerColor, isVertical: false)),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider(Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: _buildLine(color, isVertical: true),
    );
  }

  Widget _buildLine(Color color, {required bool isVertical}) {
    switch (style) {
      case DividerStyle.solid:
        return _buildSolidLine(color, isVertical);
      case DividerStyle.dashed:
        return _buildDashedLine(color, isVertical);
      case DividerStyle.dotted:
        return _buildDottedLine(color, isVertical);
    }
  }

  Widget _buildSolidLine(Color color, bool isVertical) {
    if (isVertical) {
      return Container(
        width: thickness,
        margin: EdgeInsets.only(top: indent, bottom: endIndent),
        color: color,
      );
    }
    return Divider(
      thickness: thickness,
      color: color,
      indent: indent,
      endIndent: endIndent,
    );
  }

  Widget _buildDashedLine(Color color, bool isVertical) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxLength = isVertical ? constraints.maxHeight : constraints.maxWidth;
        final dashCount = (maxLength / (dashWidth + dashGap)).floor();

        if (isVertical) {
          return Column(
            children: List.generate(dashCount, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: dashGap),
                child: Container(
                  width: thickness,
                  height: dashWidth,
                  color: color,
                ),
              );
            }),
          );
        }

        return Row(
          children: List.generate(dashCount, (index) {
            return Padding(
              padding: EdgeInsets.only(right: dashGap),
              child: Container(
                width: dashWidth,
                height: thickness,
                color: color,
              ),
            );
          }),
        );
      },
    );
  }

  Widget _buildDottedLine(Color color, bool isVertical) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxLength = isVertical ? constraints.maxHeight : constraints.maxWidth;
        final dotCount = (maxLength / (dotSize + dotGap)).floor();

        if (isVertical) {
          return Column(
            children: List.generate(dotCount, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: dotGap),
                child: Container(
                  width: dotSize,
                  height: dotSize,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            }),
          );
        }

        return Row(
          children: List.generate(dotCount, (index) {
            return Padding(
              padding: EdgeInsets.only(right: dotGap),
              child: Container(
                width: dotSize,
                height: dotSize,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

class DashedVerticalLine extends StatelessWidget {
  final double height;
  final double dashHeight;
  final double dashGap;
  final double thickness;
  final Color color;

  const DashedVerticalLine({
    super.key,
    this.height = 100,
    this.dashHeight = 4, // smaller = more bars
    this.dashGap = 2,    // smaller gap = denser bars
    this.thickness = 2,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: thickness,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          ((height) / (dashHeight + dashGap)).floor(),
              (index) => Padding(
            padding: EdgeInsets.only(bottom: dashGap),
            child: Container(
              width: thickness,
              height: dashHeight,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
