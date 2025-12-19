import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/core/constants/app_export.dart';

class OrderStatusCard extends StatelessWidget {
  final String status;
  final String count;
  final IconData icon;
  final Color iconColor;
  final String networkImageUrl;
  final Color backgroundColor;
  final bool isPrefixIcon;
  final bool isSuffixIcon;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;

  const OrderStatusCard({
    Key? key,
    required this.status,
    required this.count,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    this.isPrefixIcon = false,
    this.networkImageUrl = '',
    this.isSuffixIcon = false,
    this.titleTextStyle,
    this.subtitleTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: 72,
      width: 156,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
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

         if(isPrefixIcon)...[
           ClipOval(
             child: Image.network(
               networkImageUrl,
               width: 40,
               height: 40,
               fit: BoxFit.cover,
             ),
           ),

         ],
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status,
                  style: titleTextStyle?? TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                ),
                const SizedBox(height: 4),
                Text(
                  count.toString(),
                  style: subtitleTextStyle??  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade900,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),
          if(isSuffixIcon)...[
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 20,
              color: iconColor,
            ),
          ),
          ],
        ],
      ),
    );
  }
}
