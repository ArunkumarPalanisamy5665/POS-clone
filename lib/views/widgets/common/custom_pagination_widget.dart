import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/core/constants/app_export.dart';
import 'custom_container.dart';

class CustomPaginationWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;
  final double spacing;
  final int windowSize;

  const CustomPaginationWidget({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
    this.spacing = 8,
    this.windowSize = 3,
  });

  List<int> _visiblePages() {
    final half = windowSize ~/ 2;

    int start = currentPage - half;
    int end = currentPage + half;

    if (start < 1) {
      start = 1;
      end = windowSize;
    }

    if (end > totalPages) {
      end = totalPages;
      start = (end - windowSize + 1).clamp(1, totalPages);
    }

    return List.generate(end - start + 1, (i) => start + i);
  }

  @override
  Widget build(BuildContext context) {
    final pages = _visiblePages();

    return Center(
      child: Wrap(
        spacing: spacing,
        children: [

          PaginationButton(
            label: '< Pre',
            onTap: currentPage > 1
                ? () => onPageChanged(currentPage - 1)
                : () {},
          ),

          for (final page in pages)
            PaginationButton(
              label: page.toString(),
              isActive: page == currentPage,
              onTap: () => onPageChanged(page),
            ),

          PaginationButton(
            label: 'Next >',
            onTap: currentPage < totalPages
                ? () => onPageChanged(currentPage + 1)
                : () {},
          ),
        ],
      ),
    );
  }
}



class PaginationButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const PaginationButton({
    super.key,
    required this.label,
    this.isActive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        height: 37,
        isNeedHover: true,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        borderRadius: BorderRadius.circular(6),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primaryColor : Colors.transparent,
          border: isActive ? null : Border.all(color: Colors.grey[300]!),
        ),
        child: CustomText(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isActive ? Colors.white : const Color(0xFF475569),
          ),
        ),
      ),
    );
  }
}
