import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_hrms_flutter/core/constants/app_export.dart';

class OrderStatusCard extends StatelessWidget {
  final String status;
  final String count;
  final IconData? icon;
  final Color? iconColor;
  final String networkImageUrl;
  final String? svgAssetPath;
  final Color backgroundColor;
  final bool isPrefixIcon;
  final bool isSuffixIcon;
  final bool isBadgeRight;
  final double borderRadius;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;

  const OrderStatusCard({
    super.key,
    required this.status,
    required this.count,
    this.icon,
    this.iconColor,
    required this.backgroundColor,
    this.networkImageUrl = '',
    this.svgAssetPath,
    this.isPrefixIcon = false,
    this.isSuffixIcon = false,
    this.isBadgeRight = false,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.borderRadius = 6,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: 72,
      width: 156,
      padding: const EdgeInsets.all(12),
      borderRadius: BorderRadius.circular(borderRadius),

      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (isPrefixIcon) ...[
            ClipOval(
              child: svgAssetPath != null
                  ? SvgPicture.asset(svgAssetPath!, width: 30, height: 30)
                  : Image.network(
                      networkImageUrl,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: isBadgeRight ? _buildRowLayout() : _buildColumnLayout(),
          ),
          if (isSuffixIcon && icon != null) ...[
            const SizedBox(width: 8),
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: backgroundColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 20, color: iconColor),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildColumnLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          status,
          style:
              titleTextStyle ??
              TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
          maxLines: 1,
        ),
        const SizedBox(height: 4),
        Text(
          count,
          style:
              subtitleTextStyle ??
              TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade900,
              ),
        ),
      ],
    );
  }

  Widget _buildRowLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            status,
            style:
                titleTextStyle ??
                const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          count,
          style:
              subtitleTextStyle ??
              TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade900,
              ),
        ),
      ],
    );
  }
}
