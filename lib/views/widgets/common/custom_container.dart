import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final VoidCallback onTap;
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final BoxDecoration decoration;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final BoxConstraints? constraints;
  final Clip clipBehavior;

  const CustomContainer({
    super.key,
    required this.onTap,
    required this.decoration,
    required this.child,
    this.width = 40,
    this.height = 40,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.padding,
    this.margin,
    this.alignment,
    this.constraints,
    this.clipBehavior = Clip.none,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: Container(
          padding: padding,
          margin: margin,
          alignment: alignment,
          constraints: constraints,
          clipBehavior: clipBehavior,
          width: width,
          height: height,
          decoration: decoration.copyWith(
            borderRadius: borderRadius,
          ),
          child: child,
        ),
      ),
    );
  }
}
