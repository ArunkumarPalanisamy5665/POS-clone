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
  final Color? hoverColor;
  final String? assetImage;

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
    this.hoverColor,
    this.assetImage,
  });

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final BoxDecoration baseDecoration = BoxDecoration(
      color: widget.decoration?.color ?? AppColors.white,
      borderRadius: widget.borderRadius,
      border: widget.decoration?.border ??
          Border.all(
            width: 1,
            color: Colors.black.withAlpha((0.2 * 255).toInt()),
          ),
      boxShadow: widget.decoration?.boxShadow,
      image: widget.decoration?.image,
    );

    final Color resolvedColor = widget.isNeedHover && isHovered
        ? widget.hoverColor ?? AppColors.grey.withOpacity(0.1)
        : baseDecoration.color ?? AppColors.white;

    return Material(
      color: Colors.transparent,
      borderRadius: widget.borderRadius,
      child: CustomMouseRegion(
        onHoverChanged: (hovered) {
          if (widget.isNeedHover) {
            setState(() => isHovered = hovered);
          }
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
            decoration: baseDecoration.copyWith(
              color: resolvedColor,
              image: widget.assetImage != null
                  ? DecorationImage(
                image: AssetImage(widget.assetImage!),
                fit: BoxFit.cover,
              )
                  : baseDecoration.image,
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
