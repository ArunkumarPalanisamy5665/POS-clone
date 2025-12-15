import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String actionText;
  final IconData? icon;
  final String? imagePath;
  final Widget body;
  final bool showDropdown;
  final VoidCallback? onActionPressed;

  const DashboardCard({
    super.key,
    required this.title,
    required this.actionText,
    this.icon,
    required this.body,
    this.imagePath,
    this.showDropdown = false,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:Colors.grey.withOpacity(0.01),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.black.withAlpha((0.2 * 255).toInt()),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Column(
        children: [
          _Header(
            icon: icon,
            title: title,
            actionText: actionText,
            showDropdown: showDropdown,
            onActionPressed: onActionPressed,
            imagePath: imagePath,
          ),
          const _Divider(),
          Expanded(child: body),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final IconData? icon; // optional
  final String title;
  final String actionText;
  final bool showDropdown;
  final VoidCallback? onActionPressed;
  final String? imagePath;

  const _Header({
    this.icon,
    required this.title,
    required this.actionText,
    this.showDropdown = false,
    this.onActionPressed,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null)
          Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: Center(
              child: Icon(icon, size: 14, color: Colors.black),
            ),
          ),
        if (icon != null) const SizedBox(width: 8),

        if (imagePath != null)
          Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: Center(
              child: Image.asset(
                imagePath!,
                width: 14,
                height: 14,
                color: Colors.black,
              ),
            ),
          ),
        if (imagePath != null) const SizedBox(width: 8),

        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0XFF0F172A)),
        ),
        const Spacer(),
        OutlinedButton(
          onPressed: onActionPressed,
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.only(
              top: 5,
              bottom: 5,
              right: 12,
              left: 12,
            ),
            side: BorderSide(color: Colors.grey.shade400, width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ).copyWith(overlayColor: MaterialStateProperty.all(Colors.transparent)),
          child: Row(
            children: [
              Text(
                actionText,
                style:const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              if (showDropdown) ...[
                const SizedBox(width: 6),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 16,
                  color: Colors.grey.shade700,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}


class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Divider(
        thickness: 1,
        color: Colors.black.withAlpha((0.2 * 255).toInt()),
      ),
    );
  }
}

