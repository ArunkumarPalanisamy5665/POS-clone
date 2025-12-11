import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;

  final bool isLoading;
  final double loaderSize;
  final double strokeWidth;
  final Color loaderColor;

  final Color? backgroundColor;
  final Gradient? gradient;

  final double borderRadius;
  final double? width;
  final double? height;

  final bool isGesture;
  final VoidCallback? onTap;

  final double elevation;
  final Color shadowColor;

  const CustomButton({
    super.key,
    required this.text,
    this.textStyle,

    this.isLoading = false,
    this.loaderSize = 18,
    this.strokeWidth = 2,
    this.loaderColor = Colors.white,

    this.backgroundColor,
    this.gradient,

    this.borderRadius = 12,
    this.width,
    this.height = 50,

    this.isGesture = false,
    this.onTap,

    this.elevation = 6,
    this.shadowColor = Colors.black26,
  });

  @override
  State<CustomButton> createState() => _CustomButtonNewState();
}

class _CustomButtonNewState extends State<CustomButton>
    with SingleTickerProviderStateMixin {

  double _scale = 1.0;

  void _animateDown() {
    if (widget.isLoading) return;
    setState(() => _scale = 0.96);
  }

  void _animateUp() {
    if (widget.isLoading) return;
    setState(() => _scale = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final childContent = Center(
      child: widget.isLoading
          ? SizedBox(
        width: widget.loaderSize,
        height: widget.loaderSize,
        child: CircularProgressIndicator(
          strokeWidth: widget.strokeWidth,
          color: widget.loaderColor,
        ),
      )
          : Text(
        widget.text,
        style: widget.textStyle ??
            const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
      ),
    );

    final button = AnimatedScale(
      scale: _scale,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,

      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.gradient == null ? widget.backgroundColor ?? AppColors.primaryColor : null,
          gradient: widget.gradient,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow: [
            BoxShadow(
              color: widget.shadowColor,
              blurRadius: widget.elevation,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: childContent,
      ),
    );

    if (widget.isGesture) {
      return GestureDetector(
        onTapDown: (_) {
          if (!widget.isLoading) _animateDown();
        },
        onTapUp: (_) {
          if (!widget.isLoading) _animateUp();
        },
        onTapCancel: () {
          if (!widget.isLoading) _animateUp();
        },
        onTap: widget.isLoading
            ? null
            : () {
          FocusScope.of(context).unfocus();
          widget.onTap?.call();
        },
        child: button,
      );
    }

    return InkWell(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      onTapDown: (_) {
        if (!widget.isLoading) _animateDown();
      },
      onTapUp: (_) {
        if (!widget.isLoading) _animateUp();
      },
      onTapCancel: () {
        if (!widget.isLoading) _animateUp();
      },
      onTap:  widget.isLoading
          ? null
          : () {
        FocusScope.of(context).unfocus();
        widget.onTap?.call();
      },
      child: button,
    );

  }
}
