import 'package:flutter/material.dart';

class DropDownCards extends StatefulWidget {
  final List<String> items;
  final String value;
  final ValueChanged<String> onChanged;
  final Widget Function(String value) childBuilder;
  final double width;

  const DropDownCards({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.childBuilder,
    this.width = 180,
  });

  @override
  State<DropDownCards> createState() => _DropDownCardsState();
}

class _DropDownCardsState extends State<DropDownCards> {
  bool _isHovered = false;
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() {
        _isHovered = false;
        _hoveredIndex = null;
      }),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TRIGGER
          widget.childBuilder(widget.value),

          /// DROPDOWN
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: _isHovered ? widget.items.length * 44.0 : 0,
            curve: Curves.easeInOut,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              // borderRadius: BorderRadius.circular(6),
              child: Material(
                color: Colors.white, // ✅ inner background white
                elevation: 4,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300, // ✅ grey border
                    ),
                  ),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: widget.items.length,
                    itemBuilder: (context, index) {
                      final item = widget.items[index];
                      final isHovered = _hoveredIndex == index;
                      final isSelected = widget.value == item;

                      return MouseRegion(
                        onEnter: (_) =>
                            setState(() => _hoveredIndex = index),
                        onExit: (_) =>
                            setState(() => _hoveredIndex = null),
                        child: InkWell(
                          onTap: () {
                            widget.onChanged(item);
                            setState(() => _isHovered = false);
                          },
                          child: Container(
                            
                            decoration: BoxDecoration(
                              color: isHovered
                                  ? Colors.grey.shade100
                                  : isSelected
                                  ? Colors.grey.shade50
                                  : Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            child: Text(
                              item,
                              style: TextStyle(
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
