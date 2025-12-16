import 'package:flutter/material.dart';



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
  int? _hoveredIndex;
  static const double _radius = 12;

  void _openDropdownDialog() {
    final renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    showGeneralDialog(
      context: context,
      barrierLabel: "Dropdown",
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 220),
      pageBuilder: (context, _, __) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Stack(
            children: [
              Positioned(
                left: offset.dx,
                top: offset.dy + size.height + 6,
                child: GestureDetector(
                  onTap: () {}, // Prevent taps from propagating to parent
                  child: Material(
                    color: Colors.transparent,
                    child: _dropdownContent(),
                  ),
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
          final isHovered = _hoveredIndex == index;
          final isSelected = widget.value == item;

          return MouseRegion(
            onEnter: (_) => setState(() => _hoveredIndex = index),
            onExit: (_) => setState(() => _hoveredIndex = null),
            child: InkWell(
              onTap: () {
                widget.onChanged(item);
                Navigator.of(context).pop();
              },
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: isHovered
                      ? Colors.grey.shade100
                      : isSelected
                      ? Colors.grey.shade50
                      : Colors.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                        ),
                      ),
                    ),
                    if (isSelected)
                      const Icon(Icons.check,
                          size: 16, color: Colors.green),
                  ],
                ),
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



// class DropDownCards extends StatefulWidget {
//   final List<String> items;
//   final String value;
//   final ValueChanged<String> onChanged;
//   final Widget Function(String value) childBuilder;
//   final double width;
//
//   const DropDownCards({
//     super.key,
//     required this.items,
//     required this.value,
//     required this.onChanged,
//     required this.childBuilder,
//     this.width = 180,
//   });
//
//   @override
//   State<DropDownCards> createState() => _DropDownCardsState();
// }
//
// class _DropDownCardsState extends State<DropDownCards> {
//   bool _isOpen = false;
//   int? _hoveredIndex;
//
//   static const double _radius = 12;
//
//   void _toggleDropdown() {
//     setState(() => _isOpen = !_isOpen);
//   }
//
//   void _closeDropdown() {
//     setState(() {
//       _isOpen = false;
//       _hoveredIndex = null;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         /// ───── Trigger (Tap to open) ─────
//         GestureDetector(
//           onTap: _toggleDropdown,
//           child: widget.childBuilder(widget.value),
//         ),
//
//         /// ───── Dropdown ─────
//         AnimatedContainer(
//           duration: const Duration(milliseconds: 180),
//           curve: Curves.easeInOut,
//           height: _isOpen ? widget.items.length * 44.0 : 0,
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(_radius),
//             child: Material(
//               color: Colors.white,
//               elevation: 6,
//               child: Container(
//                 width: widget.width,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(_radius),
//                   border: Border.all(
//                     color: Colors.grey.shade300,
//                   ),
//                 ),
//                 child: ListView.builder(
//                   padding: const EdgeInsets.symmetric(vertical: 4),
//                   itemCount: widget.items.length,
//                   itemBuilder: (context, index) {
//                     final item = widget.items[index];
//                     final isHovered = _hoveredIndex == index;
//                     final isSelected = widget.value == item;
//
//                     final isFirst = index == 0;
//                     final isLast = index == widget.items.length - 1;
//
//                     final itemRadius = BorderRadius.all(
//                         Radius.circular(_radius)
//                     );
//
//                     return MouseRegion(
//                       onEnter: (_) =>
//                           setState(() => _hoveredIndex = index),
//                       onExit: (_) =>
//                           setState(() => _hoveredIndex = null),
//                       child: Padding(
//                         padding:
//                         const EdgeInsets.symmetric(horizontal: 6),
//                         child: InkWell(
//                           borderRadius: itemRadius,
//                           onTap: () {
//                             widget.onChanged(item);
//                             _closeDropdown();
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: isHovered
//                                   ? Colors.grey.shade100
//                                   : isSelected
//                                   ? Colors.grey.shade50
//                                   : Colors.white,
//                               borderRadius: itemRadius,
//                             ),
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 12,
//                               vertical: 10,
//                             ),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     item,
//                                     style: TextStyle(
//                                       fontWeight: isSelected
//                                           ? FontWeight.w600
//                                           : FontWeight.normal,
//                                     ),
//                                   ),
//                                 ),
//                                 if (isSelected)
//                                   const Icon(
//                                     Icons.check,
//                                     size: 16,
//                                     color: Colors.green,
//                                   ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
