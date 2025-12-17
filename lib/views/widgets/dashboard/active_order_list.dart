import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../core/constants/app_export.dart';
import '../common/custom_button2.dart';
import '../common/custom_text.dart';

class ActiveOrderList {
  final String name;
  final String type;
  final bool showTableNo;
  final String? tableNo;
  final String status;
  final String? imageUrl;

  ActiveOrderList({
    required this.name,
    required this.type,
    required this.status,
    this.showTableNo = false,
    this.tableNo,
    this.imageUrl,
  });
}

final emailKey = GlobalKey<State<StatefulWidget>>();

class ActiveOrders extends StatelessWidget {
  final List<ActiveOrderList> orders;
  final VoidCallback? onViewAll;

  const ActiveOrders({
    super.key,
    required this.orders,
    this.onViewAll,
  });

  Color _statusBgColor(String status) {
    switch (status) {
      case "In Kitchen":
        return const Color(0xFFF1E6FF);
      case "Cancelled":
        return const Color(0xFFFFE6E6);
      case "Served":
        return const Color(0xFFFFF1E6);
      default:
        return Colors.grey.shade200;
    }
  }

  Color _statusTextColor(String status) {
    switch (status) {
      case "In Kitchen":
        return const Color(0xFF7C3AED);
      case "Cancelled":
        return const Color(0xFFEF4444);
      case "Served":
        return const Color(0xFFF97316);
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView.separated(
            padding: const EdgeInsets.only(bottom: 72),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: orders.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final order = orders[index];

              return Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: order.imageUrl != null
                        ? NetworkImage(order.imageUrl!)
                        : null,
                    child: order.imageUrl == null
                        ? const Icon(Icons.person, color: Colors.black54)
                        : null,
                  ),
                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            order.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          )
                        ),
                        const SizedBox(height: 4),
                        Text(
                          order.showTableNo && order.tableNo != null
                              ? '${order.type} | Table No : ${order.tableNo}'
                              : order.type,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: _statusBgColor(order.status),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      order.status,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: _statusTextColor(order.status),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),

        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child:CustomButton2(
            key: emailKey,
            onPressed: () {
              // if (_formKey.currentState?.validate() != true) {
              //
              CustomButton2.shake(emailKey);
              //   return;
              // }

              // String email = value.emailController.text.trim();
              // var map = {'email': email};
            },

            btnName: 'View All',
            isDisable: false,
            isAnimate: true,
            isBold: false,
            buttonHeight: 31,
            buttonWidth: double.infinity,
            size: ButtonSize.medium,
            textSize: 14,
            textColor: Colors.white,
            borderRadius: BorderRadius.circular(5),
            buttonColor: AppColors.orange,
            borderColor: Colors.black.withAlpha(
              (0.2 * 255).toInt(),
            ),
            hideBackground: false,
            icon: SvgPicture.asset(
              AppAssets.googleIcon,
              width: 20,
              height: 20,
            ),
            iconNeed: false,
            showBorder: false,
          ),

        ),
      ],
    );
  }
}

