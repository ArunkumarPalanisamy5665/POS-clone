import 'package:flutter/material.dart';

import '../../../widgets/common/custom_container.dart';

// Model Class
class IntegrationItem {
  final String name;
  final String description;
  final String iconPath;
  final Color iconBackgroundColor;
  final bool isEnabled;

  IntegrationItem({
    required this.name,
    required this.description,
    required this.iconPath,
    this.iconBackgroundColor = const Color(0XFFF8F8F8),
    required this.isEnabled,
  });
}

class IntegrationItemWidget extends StatelessWidget {
  final IntegrationItem integration;
  final VoidCallback onToggle;

  const IntegrationItemWidget({
    super.key,
    required this.integration,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Icon Container
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: integration.iconBackgroundColor,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: Colors.grey.shade200,
                width: 1,
              ),
            ),
            child: Center(
              child: Image.asset(
                integration.iconPath,
                width: 24,
                height: 23.05,
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(width: 16),

          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  integration.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  integration.description,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),

          // Toggle Switch
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: onToggle,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 32,
                height: 18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: integration.isEnabled
                      ? const Color(0xFF14B51D)
                      : const Color(0xFFF8F8F8),
                  border: integration.isEnabled? null :Border.all(
                    color: Colors.grey.shade200,
                    width: 1
                  ),
                ),
                child: AnimatedAlign(
                  duration: const Duration(milliseconds: 200),
                  alignment: integration.isEnabled
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    width: 14,
                    height: 14,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: integration.isEnabled? Colors.white :Colors.grey[200],
                    ),
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