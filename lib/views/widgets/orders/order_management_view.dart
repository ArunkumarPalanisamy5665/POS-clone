// import 'package:flutter/material.dart';
//
// // Main Order Management Screen
// class OrderManagementScreen extends StatelessWidget {
//   const OrderManagementScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F5F5),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: OrderColumn(
//                 title: 'New Orders',
//                 count: '03',
//                 color: const Color(0xFF455A64),
//                 orders: [
//                   OrderData(
//                     orderId: '#57004',
//                     type: 'Take Away',
//                     tokenNo: '28',
//                     time: '07:30 PM',
//                     items: [
//                       OrderItem(name: 'Margherita Pizza', quantity: 2, isAvailable: true),
//                       OrderItem(name: 'Caesar Salad', quantity: 1, isAvailable: true),
//                       OrderItem(name: 'Cheesecake', quantity: 1, isAvailable: true),
//                     ],
//                     notes: 'Extra Spicy',
//                     showActions: true,
//                   ),
//                   OrderData(
//                     orderId: '#56999',
//                     type: 'Dine In',
//                     tableNo: '3',
//                     tokenNo: '24',
//                     time: '06:24 PM',
//                     items: [
//                       OrderItem(name: 'Vegan Burger', quantity: 2, isAvailable: true),
//                       OrderItem(name: 'Sweet Potato Fries', quantity: 1, isAvailable: true),
//                       OrderItem(name: 'Caesar Salad', quantity: 1, isAvailable: true),
//                     ],
//                     notes: 'Extra Spicy',
//                     moreItems: '+2 More Items',
//                     showActions: true,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: OrderColumn(
//                 title: 'Processing',
//                 count: '02',
//                 color: const Color(0xFFFFA726),
//                 orders: [
//                   OrderData(
//                     orderId: '#57002',
//                     type: 'Delivery',
//                     tokenNo: '26',
//                     time: '07:00 PM',
//                     items: [
//                       OrderItem(name: 'Margherita Pizza', quantity: 1, isAvailable: true),
//                       OrderItem(name: 'Pasta Primavera', quantity: 1, isAvailable: true),
//                       OrderItem(name: 'Chocolate Lava Cake', quantity: 2, isAvailable: true),
//                     ],
//                     showMarkDone: true,
//                   ),
//                   OrderData(
//                     orderId: '#57003',
//                     type: 'Dine In',
//                     tableNo: '7',
//                     tokenNo: '27',
//                     time: '07:15 PM',
//                     items: [
//                       OrderItem(name: 'Steak Frites', quantity: 1, isAvailable: false),
//                       OrderItem(name: 'Chicken Risotto', quantity: 1, isAvailable: false),
//                       OrderItem(name: 'Tiramisu', quantity: 2, isAvailable: false),
//                     ],
//                     notes: 'Extra Spicy',
//                     showMarkDone: true,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: OrderColumn(
//                 title: 'Completed',
//                 count: '01',
//                 color: const Color(0xFF66BB6A),
//                 orders: [
//                   OrderData(
//                     orderId: '#57005',
//                     type: 'Dine In',
//                     tableNo: '9',
//                     tokenNo: '29',
//                     time: '07:45 PM',
//                     items: [
//                       OrderItem(name: 'Lobster Pasta', quantity: 1, isAvailable: false),
//                       OrderItem(name: 'Garlic Bread', quantity: 2, isAvailable: true),
//                       OrderItem(name: 'Chocolate Mousse', quantity: 1, isAvailable: true),
//                     ],
//                     showPayment: true,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // Order Column Widget
// class OrderColumn extends StatelessWidget {
//   final String title;
//   final String count;
//   final Color color;
//   final List<OrderData> orders;
//
//   const OrderColumn({
//     super.key,
//     required this.title,
//     required this.count,
//     required this.color,
//     required this.orders,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           decoration: BoxDecoration(
//             color: color,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Row(
//             children: [
//               Icon(
//                 title == 'New Orders'
//                     ? Icons.receipt_outlined
//                     : title == 'Processing'
//                     ? Icons.access_time
//                     : Icons.check_circle_outline,
//                 color: Colors.white,
//                 size: 20,
//               ),
//               const SizedBox(width: 8),
//               Text(
//                 title,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const Spacer(),
//               Text(
//                 count,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 16),
//         ...orders.map((order) => Padding(
//           padding: const EdgeInsets.only(bottom: 16),
//           child: OrderCard(order: order),
//         )),
//       ],
//     );
//   }
// }
//
// // Order Card Widget
// class OrderCard extends StatelessWidget {
//   final OrderData order;
//
//   const OrderCard({super.key, required this.order});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
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
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 width: 48,
//                 height: 48,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF1E88E5),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 24),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       order.orderId,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.black87,
//                       ),
//                     ),
//                     const SizedBox(height: 2),
//                     Row(
//                       children: [
//                         Text(
//                           order.type,
//                           style: TextStyle(
//                             fontSize: 13,
//                             color: Colors.grey.shade600,
//                           ),
//                         ),
//                         if (order.tableNo != null) ...[
//                           const SizedBox(width: 8),
//                           Text(
//                             'Table No : ${order.tableNo}',
//                             style: TextStyle(
//                               fontSize: 13,
//                               color: Colors.grey.shade600,
//                             ),
//                           ),
//                         ],
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               PopupMenuButton(
//                 icon: const Icon(Icons.more_vert, size: 20),
//                 itemBuilder: (context) => [
//                   const PopupMenuItem(value: 1, child: Text('Edit')),
//                   const PopupMenuItem(value: 2, child: Text('Delete')),
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           Row(
//             children: [
//               Icon(Icons.confirmation_number_outlined, size: 16, color: Colors.grey.shade600),
//               const SizedBox(width: 6),
//               Text(
//                 'Token No : ${order.tokenNo}',
//                 style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
//               ),
//               const Spacer(),
//               Icon(Icons.access_time, size: 16, color: Colors.grey.shade600),
//               const SizedBox(width: 6),
//               Text(
//                 order.time,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black87,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           const Divider(height: 1),
//           const SizedBox(height: 12),
//           ...order.items.map((item) => Padding(
//             padding: const EdgeInsets.only(bottom: 8),
//             child: Row(
//               children: [
//                 Icon(
//                   item.isAvailable ? Icons.add_circle_outline : Icons.cancel_outlined,
//                   size: 16,
//                   color: item.isAvailable ? Colors.green : Colors.red,
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     item.name,
//                     style: const TextStyle(fontSize: 14, color: Colors.black87),
//                   ),
//                 ),
//                 Text(
//                   '×${item.quantity}',
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black87,
//                   ),
//                 ),
//               ],
//             ),
//           )),
//           if (order.notes != null) ...[
//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 Icon(Icons.info_outline, size: 16, color: Colors.grey.shade600),
//                 const SizedBox(width: 8),
//                 Text(
//                   'Notes : ${order.notes}',
//                   style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
//                 ),
//               ],
//             ),
//           ],
//           if (order.moreItems != null) ...[
//             const SizedBox(height: 8),
//             Text(
//               order.moreItems!,
//               style: const TextStyle(
//                 fontSize: 13,
//                 color: Color(0xFF1E88E5),
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//           const SizedBox(height: 16),
//           if (order.showActions) ...[
//             Row(
//               children: [
//                 Expanded(
//                   child: OutlinedButton(
//                     onPressed: () {},
//                     style: OutlinedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       side: BorderSide(color: Colors.grey.shade300),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: const Text(
//                       'Cancel',
//                       style: TextStyle(color: Colors.black87, fontSize: 14),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       backgroundColor: const Color(0xFF1E88E5),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: const Text(
//                       'Start',
//                       style: TextStyle(color: Colors.white, fontSize: 14),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//           if (order.showMarkDone) ...[
//             Row(
//               children: [
//                 Expanded(
//                   child: OutlinedButton(
//                     onPressed: () {},
//                     style: OutlinedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       side: BorderSide(color: Colors.grey.shade300),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: const Text(
//                       'Cancel',
//                       style: TextStyle(color: Colors.black87, fontSize: 14),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       backgroundColor: const Color(0xFF1E88E5),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: const Text(
//                       'Mark Done',
//                       style: TextStyle(color: Colors.white, fontSize: 14),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//           if (order.showPayment) ...[
//             Row(
//               children: [
//                 Expanded(
//                   child: OutlinedButton(
//                     onPressed: () {},
//                     style: OutlinedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       side: BorderSide(color: Colors.grey.shade300),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: const Text(
//                       'Print Receipt',
//                       style: TextStyle(color: Colors.black87, fontSize: 14),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       backgroundColor: const Color(0xFF66BB6A),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: const Text(
//                       'Pay & Complete',
//                       style: TextStyle(color: Colors.white, fontSize: 14),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ],
//       ),
//     );
//   }
// }
//
// // Data Models
// class OrderData {
//   final String orderId;
//   final String type;
//   final String? tableNo;
//   final String tokenNo;
//   final String time;
//   final List<OrderItem> items;
//   final String? notes;
//   final String? moreItems;
//   final bool showActions;
//   final bool showMarkDone;
//   final bool showPayment;
//
//   OrderData({
//     required this.orderId,
//     required this.type,
//     this.tableNo,
//     required this.tokenNo,
//     required this.time,
//     required this.items,
//     this.notes,
//     this.moreItems,
//     this.showActions = false,
//     this.showMarkDone = false,
//     this.showPayment = false,
//   });
// }
//
// class OrderItem {
//   final String name;
//   final int quantity;
//   final bool isAvailable;
//
//   OrderItem({
//     required this.name,
//     required this.quantity,
//     required this.isAvailable,
//   });
// }

import 'package:flutter/material.dart';

// Order Management View - WITHOUT Scaffold (for embedding)
class OrderManagementScreen extends StatelessWidget {
  const OrderManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate column width based on available space
        final columnWidth = (constraints.maxWidth - 65) / 3; // 3 columns with padding

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: columnWidth,
                child: OrderColumn(
                  title: 'New Orders',
                  count: '03',
                  color: const Color(0xFF455A64),
                  orders: [
                    OrderData(
                      orderId: '#57004',
                      type: 'Take Away',
                      tokenNo: '28',
                      time: '07:30 PM',
                      items: [
                        OrderItem(name: 'Margherita Pizza', quantity: 2, isAvailable: true),
                        OrderItem(name: 'Caesar Salad', quantity: 1, isAvailable: true),
                        OrderItem(name: 'Cheesecake', quantity: 1, isAvailable: true),
                      ],
                      notes: 'Extra Spicy',
                      showActions: true,
                    ),
                    OrderData(
                      orderId: '#56999',
                      type: 'Dine In',
                      tableNo: '3',
                      tokenNo: '24',
                      time: '06:24 PM',
                      items: [
                        OrderItem(name: 'Vegan Burger', quantity: 2, isAvailable: true),
                        OrderItem(name: 'Sweet Potato Fries', quantity: 1, isAvailable: true),
                        OrderItem(name: 'Caesar Salad', quantity: 1, isAvailable: true),
                      ],
                      notes: 'Extra Spicy',
                      moreItems: '+2 More Items',
                      showActions: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: columnWidth,
                child: OrderColumn(
                  title: 'Processing',
                  count: '02',
                  color: const Color(0xFFFFA726),
                  orders: [
                    OrderData(
                      orderId: '#57002',
                      type: 'Delivery',
                      tokenNo: '26',
                      time: '07:00 PM',
                      items: [
                        OrderItem(name: 'Margherita Pizza', quantity: 1, isAvailable: true),
                        OrderItem(name: 'Pasta Primavera', quantity: 1, isAvailable: true),
                        OrderItem(name: 'Chocolate Lava Cake', quantity: 2, isAvailable: true),
                      ],
                      showMarkDone: true,
                    ),
                    OrderData(
                      orderId: '#57003',
                      type: 'Dine In',
                      tableNo: '7',
                      tokenNo: '27',
                      time: '07:15 PM',
                      items: [
                        OrderItem(name: 'Steak Frites', quantity: 1, isAvailable: false),
                        OrderItem(name: 'Chicken Risotto', quantity: 1, isAvailable: false),
                        OrderItem(name: 'Tiramisu', quantity: 2, isAvailable: false),
                      ],
                      notes: 'Extra Spicy',
                      showMarkDone: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: columnWidth,
                child: OrderColumn(
                  title: 'Completed',
                  count: '01',
                  color: const Color(0xFF66BB6A),
                  orders: [
                    OrderData(
                      orderId: '#57005',
                      type: 'Dine In',
                      tableNo: '9',
                      tokenNo: '29',
                      time: '07:45 PM',
                      items: [
                        OrderItem(name: 'Lobster Pasta', quantity: 1, isAvailable: false),
                        OrderItem(name: 'Garlic Bread', quantity: 2, isAvailable: true),
                        OrderItem(name: 'Chocolate Mousse', quantity: 1, isAvailable: true),
                      ],
                      showPayment: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Order Column Widget
class OrderColumn extends StatelessWidget {
  final String title;
  final String count;
  final Color color;
  final List<OrderData> orders;

  const OrderColumn({
    super.key,
    required this.title,
    required this.count,
    required this.color,
    required this.orders,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(
                title == 'New Orders'
                    ? Icons.receipt_outlined
                    : title == 'Processing'
                    ? Icons.access_time
                    : Icons.check_circle_outline,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Text(
                count,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ...orders.map((order) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: OrderCard(order: order),
        )),
      ],
    );
  }
}

// Order Card Widget
class OrderCard extends StatelessWidget {
  final OrderData order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E88E5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.orderId,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          order.type,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        if (order.tableNo != null) ...[
                          const SizedBox(width: 8),
                          Text(
                            'Table No : ${order.tableNo}',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              PopupMenuButton(
                icon: const Icon(Icons.more_vert, size: 20),
                itemBuilder: (context) => [
                  const PopupMenuItem(value: 1, child: Text('Edit')),
                  const PopupMenuItem(value: 2, child: Text('Delete')),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.confirmation_number_outlined, size: 16, color: Colors.grey.shade600),
              const SizedBox(width: 6),
              Text(
                'Token No : ${order.tokenNo}',
                style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
              ),
              const Spacer(),
              Icon(Icons.access_time, size: 16, color: Colors.grey.shade600),
              const SizedBox(width: 6),
              Text(
                order.time,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1),
          const SizedBox(height: 12),
          ...order.items.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Icon(
                  item.isAvailable ? Icons.add_circle_outline : Icons.cancel_outlined,
                  size: 16,
                  color: item.isAvailable ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    item.name,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ),
                Text(
                  '×${item.quantity}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          )),
          if (order.notes != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.info_outline, size: 16, color: Colors.grey.shade600),
                const SizedBox(width: 8),
                Text(
                  'Notes : ${order.notes}',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                ),
              ],
            ),
          ],
          if (order.moreItems != null) ...[
            const SizedBox(height: 8),
            Text(
              order.moreItems!,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF1E88E5),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
          const SizedBox(height: 16),
          if (order.showActions) ...[
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.black87, fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: const Color(0xFF1E88E5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Start',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ],
          if (order.showMarkDone) ...[
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.black87, fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: const Color(0xFF1E88E5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Mark Done',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ],
          if (order.showPayment) ...[
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Print Receipt',
                      style: TextStyle(color: Colors.black87, fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: const Color(0xFF66BB6A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Pay & Complete',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

// Data Models
class OrderData {
  final String orderId;
  final String type;
  final String? tableNo;
  final String tokenNo;
  final String time;
  final List<OrderItem> items;
  final String? notes;
  final String? moreItems;
  final bool showActions;
  final bool showMarkDone;
  final bool showPayment;

  OrderData({
    required this.orderId,
    required this.type,
    this.tableNo,
    required this.tokenNo,
    required this.time,
    required this.items,
    this.notes,
    this.moreItems,
    this.showActions = false,
    this.showMarkDone = false,
    this.showPayment = false,
  });
}

class OrderItem {
  final String name;
  final int quantity;
  final bool isAvailable;

  OrderItem({
    required this.name,
    required this.quantity,
    required this.isAvailable,
  });
}