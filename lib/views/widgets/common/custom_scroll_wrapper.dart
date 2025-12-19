import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class CustomScrollViewWrapper extends StatelessWidget {
  final Widget child;
  final Axis direction;
  final bool enableOverscroll;
  final bool showScrollbar;
  final ScrollController? controller;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;

  const CustomScrollViewWrapper({
    super.key,
    required this.child,
    this.direction = Axis.vertical,
    this.enableOverscroll = false,
    this.showScrollbar = false,
    this.controller,
    this.padding,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    Widget scrollView = SingleChildScrollView(
      controller: controller,
      scrollDirection: direction,
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
        thumbVisibility: true,
        child: scrollView,
      );
    }

    return ScrollConfiguration(
      behavior: CustomScrollBehavior(
        enableOverscroll: enableOverscroll,
      ),
      child: scrollView,
    );
  }
}

class CustomScrollBehavior extends ScrollBehavior {
  final bool enableOverscroll;

  const CustomScrollBehavior({required this.enableOverscroll});

  @override
  Widget buildOverscrollIndicator(
      BuildContext context,
      Widget child,
      ScrollableDetails details,
      ) {
    return enableOverscroll ? child : child;
  }

  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.mouse,
    PointerDeviceKind.touch,
    PointerDeviceKind.trackpad,
  };
}


