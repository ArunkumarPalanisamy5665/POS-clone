import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/views/widgets/common/custom_mouse_region.dart';

import '../../../core/constants/app_colors.dart';


class CustomContainer extends StatefulWidget {
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final bool isNeedHover;
  final BorderRadius borderRadius;
  final BoxDecoration? decoration;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final BoxConstraints? constraints;
  final Clip clipBehavior;

  const CustomContainer({
    super.key,
    this.onTap,
    this.decoration,
    required this.child,
    this.isNeedHover = false,
    this.width,
    this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.padding,
    this.margin,
    this.alignment,
    this.constraints,
    this.clipBehavior = Clip.none,
  });

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final BoxDecoration effectiveDecoration =
        widget.decoration ??
            BoxDecoration(
              color: isHovered ? AppColors.grey : AppColors.white,
              borderRadius: widget.borderRadius,
              border: Border.all(
                width: 1,
                color: Colors.black.withAlpha((0.2 * 255).toInt()),
              ),
            );

    return Material(
      color: Colors.transparent,
      borderRadius: widget.borderRadius,
      child: CustomMouseRegion(
        onHoverChanged: (hovered) {
          setState(() => isHovered = hovered);
        },
        child: InkWell(
          borderRadius: widget.borderRadius,
          onTap: widget.onTap,
          child: Container(
            width: widget.width,
            height: widget.height,
            padding: widget.padding,
            margin: widget.margin,
            alignment: widget.alignment,
            constraints: widget.constraints,
            clipBehavior: widget.clipBehavior,
            decoration: effectiveDecoration.copyWith(
              color: widget.isNeedHover? isHovered ? AppColors.grey.withOpacity(0.010) :AppColors.white:AppColors.white,
              borderRadius: widget.borderRadius,
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}




