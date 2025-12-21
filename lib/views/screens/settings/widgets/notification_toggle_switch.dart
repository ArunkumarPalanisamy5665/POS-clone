import 'package:flutter/material.dart';

class NotificationToggleSwitch extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onToggle;

  const NotificationToggleSwitch({
    super.key,
    required this.isEnabled,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onToggle,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 32,
          height: 18,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: isEnabled
                ? const Color(0xFF14B51D)
                : const Color(0xFFF8F8F8),
            border: isEnabled
                ? null
                : Border.all(
              color: Colors.grey.shade200,
              width: 1,
            ),
          ),
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 200),
            alignment: isEnabled
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Container(
              width: 14,
              height: 14,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isEnabled ? Colors.white : Colors.grey[200],
              ),
            ),
          ),
        ),
      ),
    );
  }
}