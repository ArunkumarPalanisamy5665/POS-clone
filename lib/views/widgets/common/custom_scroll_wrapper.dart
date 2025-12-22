import 'package:flutter/material.dart';

class CustomScrollWrapper extends StatelessWidget {
  final Widget child;
  final Axis scrollDirection;
  final ScrollController? controller;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final bool enableOverscroll; // Enable / disable overscroll glow
  final bool showScrollbar;
  final bool alwaysShowScrollbar; //Always show scrollbar thumb

  const CustomScrollWrapper({
    super.key,
    required this.child,
    this.scrollDirection = Axis.vertical,
    this.controller,
    this.padding,
    this.physics,
    this.enableOverscroll = false,
    this.showScrollbar = false,
    this.alwaysShowScrollbar = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget scrollView = SingleChildScrollView(
      controller: controller,
      scrollDirection: scrollDirection,
      padding: padding,
      physics: physics ??
          (enableOverscroll
              ? const BouncingScrollPhysics()
              : const ClampingScrollPhysics()),
      child: child,
    );

    if (showScrollbar) {
      scrollView = Scrollbar(
        controller: controller,
        thumbVisibility: alwaysShowScrollbar,
        child: scrollView,
      );
    }

    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(
        scrollbars: showScrollbar,
        overscroll: enableOverscroll,
      ),
      child: scrollView,
    );
  }
}

