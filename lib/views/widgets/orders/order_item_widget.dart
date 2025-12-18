// import 'package:flutter/material.dart';
//
// class OrderItemWidget extends StatelessWidget {
//   final String orderId;
//   final String orderType;
//   final String? tableNo;
//   final int tokenNo;
//   final String time;
//   final List<OrderItem> items;
//   final String billingStatus;
//   final String orderStatus;
//   final VoidCallback? onMenuTap;
//
//   const OrderItemWidget({
//     Key? key,
//     required this.orderId,
//     required this.orderType,
//     this.tableNo,
//     required this.tokenNo,
//     required this.time,
//     required this.items,
//     required this.billingStatus,
//     required this.orderStatus,
//     this.onMenuTap,
//   }) : super(key: key);
//
//   Color _getOrderTypeColor() {
//     switch (orderType.toLowerCase()) {
//       case 'dine in':
//         return const Color(0xFF1E88E5);
//       case 'take away':
//         return const Color(0xFF1E88E5);
//       case 'delivery':
//         return const Color(0xFF1E88E5);
//       default:
//         return const Color(0xFF1E88E5);
//     }
//   }
//
//   Color _getBillingStatusColor() {
//     switch (billingStatus.toLowerCase()) {
//       case 'billed':
//         return const Color(0xFF4CAF50);
//       case 'paid':
//         return const Color(0xFF9C27B0);
//       default:
//         return Colors.grey;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final visibleItems = items.take(3).toList();
//     final remainingCount = items.length - visibleItems.length;
//
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header
//             Row(
//               children: [
//                 // Order Icon
//                 Container(
//                   width: 48,
//                   height: 48,
//                   decoration: BoxDecoration(
//                     color: _getOrderTypeColor(),
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Icon(
//                     Icons.shopping_bag_outlined,
//                     color: Colors.white,
//                     size: 24,
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 // Order ID and Type
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         orderId,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Row(
//                         children: [
//                           Text(
//                             orderType,
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.grey[600],
//                             ),
//                           ),
//                           if (tableNo != null) ...[
//                             const SizedBox(width: 8),
//                             Text(
//                               'Table No : $tableNo',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.grey[600],
//                               ),
//                             ),
//                           ],
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 // Menu Button
//                 IconButton(
//                   onPressed: onMenuTap,
//                   icon: const Icon(Icons.more_vert),
//                   padding: EdgeInsets.zero,
//                   constraints: const BoxConstraints(),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             // Token and Time
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       'Token No : ',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.grey[700],
//                       ),
//                     ),
//                     Text(
//                       tokenNo.toString(),
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
//                     const SizedBox(width: 4),
//                     Text(
//                       time,
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.grey[700],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             // Order Items
//             ...visibleItems.map((item) => Padding(
//               padding: const EdgeInsets.only(bottom: 8),
//               child: Row(
//                 children: [
//                   Icon(
//                     item.isVeg
//                         ? Icons.check_box_outline_blank
//                         : Icons.close,
//                     size: 16,
//                     color: item.isVeg ? Colors.green : Colors.red,
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           item.name,
//                           style: const TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         if (item.note != null)
//                           Padding(
//                             padding: const EdgeInsets.only(top: 4),
//                             child: Row(
//                               children: [
//                                 Icon(Icons.info_outline,
//                                     size: 14, color: Colors.grey[600]),
//                                 const SizedBox(width: 4),
//                                 Text(
//                                   'Notes : ${item.note}',
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.grey[600],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                   Text(
//                     '×${item.quantity}',
//                     style: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             )),
//             // More items indicator
//             if (remainingCount > 0)
//               Padding(
//                 padding: const EdgeInsets.only(top: 8),
//                 child: Text(
//                   '+$remainingCount More Items',
//                   style: const TextStyle(
//                     fontSize: 14,
//                     color: Color(0xFF1E88E5),
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             const SizedBox(height: 16),
//             // Status Row
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // Billing Status
//                 Container(
//                   padding:
//                   const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                   decoration: BoxDecoration(
//                     color: _getBillingStatusColor().withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                   child: Text(
//                     billingStatus,
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                       color: _getBillingStatusColor(),
//                     ),
//                   ),
//                 ),
//                 // Order Status Dropdown
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 8),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey[300]!),
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                   child: DropdownButton<String>(
//                     value: orderStatus,
//                     underline: const SizedBox(),
//                     icon: const Icon(Icons.keyboard_arrow_down, size: 20),
//                     style: const TextStyle(
//                       fontSize: 14,
//                       color: Colors.black,
//                     ),
//                     items: [
//                       'Pending',
//                       'In Progress',
//                       'Preparing',
//                       'Completed',
//                       'Delivered',
//                       'Cancelled'
//                     ]
//                         .map((status) => DropdownMenuItem(
//                       value: status,
//                       child: Text(status),
//                     ))
//                         .toList(),
//                     onChanged: (value) {
//                       // Handle status change
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class OrderItem {
//   final String name;
//   final int quantity;
//   final bool isVeg;
//   final String? note;
//
//   OrderItem({
//     required this.name,
//     required this.quantity,
//     required this.isVeg,
//     this.note,
//   });
// }

import 'package:flutter/material.dart';

class OrderItemWidget extends StatelessWidget {
  final String orderId;
  final String orderType;
  final String? tableNo;
  final int tokenNo;
  final String time;
  final List<OrderItem> items;
  final String billingStatus;
  final String orderStatus;
  final VoidCallback? onMenuTap;

  const OrderItemWidget({
    Key? key,
    required this.orderId,
    required this.orderType,
    this.tableNo,
    required this.tokenNo,
    required this.time,
    required this.items,
    required this.billingStatus,
    required this.orderStatus,
    this.onMenuTap,
  }) : super(key: key);

  Color _getOrderTypeColor() {
    switch (orderType.toLowerCase()) {
      case 'dine in':
        return const Color(0xFF1E88E5);
      case 'take away':
        return const Color(0xFF1E88E5);
      case 'delivery':
        return const Color(0xFF1E88E5);
      default:
        return const Color(0xFF1E88E5);
    }
  }

  Color _getBillingStatusColor() {
    switch (billingStatus.toLowerCase()) {
      case 'billed':
        return const Color(0xFF4CAF50);
      case 'paid':
        return const Color(0xFF9C27B0);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final visibleItems = items.take(3).toList();
    final remainingCount = items.length - visibleItems.length;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                // Order Icon
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: _getOrderTypeColor(),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                // Order ID and Type
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        orderId,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            orderType,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          if (tableNo != null) ...[
                            const SizedBox(width: 8),
                            Text(
                              'Table No : $tableNo',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
                // Menu Button
                IconButton(
                  onPressed: onMenuTap,
                  icon: const Icon(Icons.more_vert),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Token and Time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Token No : ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      tokenNo.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Order Items
            ...visibleItems.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Icon(
                    item.isVeg
                        ? Icons.check_box_outline_blank
                        : Icons.close,
                    size: 16,
                    color: item.isVeg ? Colors.green : Colors.red,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (item.note != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Row(
                              children: [
                                Icon(Icons.info_outline,
                                    size: 14, color: Colors.grey[600]),
                                const SizedBox(width: 4),
                                Text(
                                  'Notes : ${item.note}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  Text(
                    '×${item.quantity}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )),
            // More items indicator
            if (remainingCount > 0)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  '+$remainingCount More Items',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF1E88E5),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

            // Spacer to push status row to bottom
            const Spacer(),

            // Divider
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Divider(
                color: Colors.grey[300],
                height: 1,
                thickness: 1,
              ),
            ),

            // Status Row at Bottom
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Billing Status
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: _getBillingStatusColor().withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    billingStatus,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: _getBillingStatusColor(),
                    ),
                  ),
                ),
                // Order Status Dropdown
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: DropdownButton<String>(
                    value: orderStatus,
                    underline: const SizedBox(),
                    icon: const Icon(Icons.keyboard_arrow_down, size: 20),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    items: [
                      'Pending',
                      'In Progress',
                      'Preparing',
                      'Completed',
                      'Delivered',
                      'Cancelled'
                    ]
                        .map((status) => DropdownMenuItem(
                      value: status,
                      child: Text(status),
                    ))
                        .toList(),
                    onChanged: (value) {
                      // Handle status change
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrderItem {
  final String name;
  final int quantity;
  final bool isVeg;
  final String? note;

  OrderItem({
    required this.name,
    required this.quantity,
    required this.isVeg,
    this.note,
  });
}