import 'package:flutter/material.dart';

class DropDownCards<T> extends StatefulWidget {
  final List<T> items;
  final T value;
  final ValueChanged<T> onChanged;
  final Widget Function(T item, bool isSelected) itemBuilder;
  final Widget Function(T value) childBuilder;

  final double width;

  const DropDownCards({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.itemBuilder,
    required this.childBuilder,
    this.width = 180,
  });

  @override
  State<DropDownCards<T>> createState() => _DropDownCardsState<T>();
}


class _DropDownCardsState<T> extends State<DropDownCards<T>> {
  int? _hoveredIndex;
  static const double _radius = 12;

  void _openDropdownDialog() {
    final renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 220),
      pageBuilder: (context, _, __) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => Navigator.pop(context),
          child: Stack(
            children: [
              Positioned(
                left: offset.dx,
                top: offset.dy + size.height + 6,
                child: Material(
                  color: Colors.transparent,
                  child: _dropdownContent(),
                ),
              ),
            ],
          ),
        );
      },
      transitionBuilder: (_, animation, __, child) {
        final curved =
        CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);

        return FadeTransition(
          opacity: curved,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -0.08),
              end: Offset.zero,
            ).animate(curved),
            child: child,
          ),
        );
      },
    );
  }

  Widget _dropdownContent() {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(_radius),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 6),
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          final isSelected = item == widget.value;
          final isHovered = _hoveredIndex == index;

          return MouseRegion(
            onEnter: (_) => setState(() => _hoveredIndex = index),
            onExit: (_) => setState(() => _hoveredIndex = null),
            child: InkWell(
              onTap: () {
                widget.onChanged(item);
                Navigator.pop(context);
              },
              child: Container(
                color: isHovered
                    ? Colors.grey.shade100
                    : isSelected
                    ? Colors.grey.shade50
                    : Colors.white,
                padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: widget.itemBuilder(item, isSelected),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openDropdownDialog,
      child: widget.childBuilder(widget.value),
    );
  }
}
