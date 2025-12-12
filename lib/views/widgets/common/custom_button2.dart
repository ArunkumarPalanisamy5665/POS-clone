import 'package:flutter/material.dart';

enum ButtonSize { small, medium, large }

extension _ButtonSizeX on ButtonSize {
  double get height => switch (this) {
    ButtonSize.small => 36,
    ButtonSize.medium => 48,
    ButtonSize.large => 56,
  };

  double get text => switch (this) {
    ButtonSize.small => 11,
    ButtonSize.medium => 14,
    ButtonSize.large => 16,
  };
}

class CustomButton2 extends StatefulWidget {
  const CustomButton2({
    super.key,
    required this.onPressed,
    required this.btnName,
    this.isDisable = false,
    this.isAnimate = false,
    this.isBold = false,
    this.textColor,
    this.buttonWidth,
    this.buttonHeight,
    this.buttonColor,
    this.borderColor,
    this.showBorder = false,
    this.iconNeed = false,
    this.icon,
    this.hideBackground = false,
    this.padding,
    this.borderRadius,
    this.textSize,
    this.size,
  });

  final VoidCallback? onPressed;
  final String btnName;

  final bool isDisable;
  final bool isAnimate; // 🔥 REPLACES hasAnimation

  final bool isBold;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? textSize;
  final ButtonSize? size;

  final Color? buttonColor;
  final Color? borderColor;
  final Color? textColor;

  final bool showBorder; // 🔥 if true → NO background
  final bool iconNeed;
  final Widget? icon;
  final bool hideBackground;

  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  // 🔥 Static controller helpers
  static void shake(GlobalKey key) =>
      (key.currentState as _CustomButton2State?)?.shake();
  static void disable(GlobalKey key) =>
      (key.currentState as _CustomButton2State?)?.setDisabled(true);
  static void enable(GlobalKey key) =>
      (key.currentState as _CustomButton2State?)?.setDisabled(false);
  static void changeText(GlobalKey key, String newText) =>
      (key.currentState as _CustomButton2State?)?.changeText(newText);

  @override
  State<CustomButton2> createState() => _CustomButton2State();
}

class _CustomButton2State extends State<CustomButton2>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _offsetAnimation;
  late bool _isDisabled;
  late String _text;

  @override
  void initState() {
    super.initState();
    _isDisabled = widget.isDisable;
    _text = widget.btnName;

    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _offsetAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: -8), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -8, end: 8), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 8, end: -8), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -8, end: 8), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 8, end: -8), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -8, end: 8), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 8, end: 0), weight: 1),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    _controller.addStatusListener(
          (s) => s == AnimationStatus.completed ? _controller.reset() : null,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 🔥 Only animate if isAnimate = true
  void shake() {
    if (widget.isAnimate && !_controller.isAnimating) {
      _controller.forward();
    }
  }

  void setDisabled(bool v) => setState(() => _isDisabled = v);

  void changeText(String v) => setState(() => _text = v);

  @override
  Widget build(BuildContext context) {
    final double height =
        widget.buttonHeight ?? widget.size?.height ?? 48;

    final double fontSize =
        widget.textSize ?? widget.size?.text ?? 14;

    // ----------------------------------------------------------
    // 🔥 NEW LOGIC:
    // showBorder == true → ALWAYS TRANSPARENT BACKGROUND
    // ----------------------------------------------------------
    final bool shouldShowTransparent =
        widget.showBorder || widget.hideBackground || _isDisabled;

    final Color bgColor = shouldShowTransparent
        ? Colors.transparent
        : widget.buttonColor ?? Theme.of(context).colorScheme.primary;

    final Color txtColor = widget.textColor ??
        (shouldShowTransparent
            ? Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black
            : Theme.of(context).colorScheme.onPrimary);

    final BorderSide? borderSide = widget.showBorder
        ? BorderSide(
      color:
      widget.borderColor ?? Theme.of(context).colorScheme.primary,
      width: 0.6,
    )
        : null;

    Widget buttonBody = Container(
      width: widget.buttonWidth,
      constraints: BoxConstraints(minHeight: height),
      padding: widget.padding ??
          EdgeInsets.symmetric(horizontal: height / 2.2, vertical: height / 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
        border: borderSide == null ? null : Border.fromBorderSide(borderSide),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.iconNeed && widget.icon != null) ...[
            widget.icon!,
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Text(
              _text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Asap',
                fontSize: fontSize,
                fontWeight:
                widget.isBold ? FontWeight.w600 : FontWeight.w400,
                color: txtColor,
              ),
            ),
          ),
        ],
      ),
    );

    if (widget.buttonWidth == null) {
      buttonBody = IntrinsicWidth(child: buttonBody);
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) => Transform.translate(
        offset: Offset(_offsetAnimation.value, 0),
        child: child,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
        child: InkWell(
          onTap: _isDisabled ? null : widget.onPressed,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
          child: buttonBody,
        ),
      ),
    );
  }
}
