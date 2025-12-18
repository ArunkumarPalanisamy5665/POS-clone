import 'package:flutter/material.dart';

import '../../../core/constants/app_export.dart';

class CustomMouseRegion extends StatefulWidget {
  final Widget child;

  final ValueChanged<bool>? onHoverChanged;
  final PointerEnterEventListener? onEnter;
  final PointerExitEventListener? onExit;

  const CustomMouseRegion({
    super.key,
    required this.child,
    this.onHoverChanged,
    this.onEnter,
    this.onExit,
  });

  @override
  State<CustomMouseRegion> createState() => _CustomMouseRegionState();
}

class _CustomMouseRegionState extends State<CustomMouseRegion> {
  bool _isHovered = false;

  void _handleEnter(PointerEnterEvent event) {
    _isHovered = true;
    widget.onHoverChanged?.call(true);
    widget.onEnter?.call(event);
  }

  void _handleExit(PointerExitEvent event) {
    _isHovered = false;
    widget.onHoverChanged?.call(false);
    widget.onExit?.call(event);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: _handleEnter,
      onExit: _handleExit,
      child: widget.child,
    );
  }
}
