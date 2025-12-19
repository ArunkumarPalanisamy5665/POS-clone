import 'package:flutter/material.dart';



class CardWidget extends StatefulWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  State<CardWidget> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<CardWidget> {
  String selectedServiceType = 'Dine In';
  String selectedWaiter = 'Waiter';

  final List<OrderItem> items = [
    OrderItem(
      name: 'Chicken Taco',
      size: 'Medium',
      quantity: 2,
      itemRate: 33,
      amount: 66,
      total: 66,
      image: '🌮',
      hasNote: false,
    ),
    OrderItem(
      name: 'Grilled Chicken',
      size: 'Small: 250 gms',
      quantity: 1,
      itemRate: null,
      amount: null,
      total: null,
      image: '🍗',
      hasNote: false,
    ),
    OrderItem(
      name: 'Lobster Thermidor',
      size: 'Half Lobster : 300 gms',
      quantity: 1,
      itemRate: null,
      amount: null,
      total: null,
      image: '🦞',
      hasNote: true,
    ),
    OrderItem(
      name: 'Spinach & Corn Pizza',
      size: 'Small: 6 inches',
      quantity: 1,
      itemRate: null,
      amount: null,
      total: null,
      image: '🍕',
      hasNote: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Order #56998',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                '08 Oct, 2025, 12:44 PM',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  // Service Type Buttons
                  Row(
                    children: [
                      ServiceTypeButton(
                        label: 'Dine In',
                        icon: Icons.restaurant,
                        isSelected: selectedServiceType == 'Dine In',
                        onTap: () {
                          setState(() => selectedServiceType = 'Dine In');
                        },
                      ),
                      const SizedBox(width: 12),
                      ServiceTypeButton(
                        label: 'Take Away',
                        icon: Icons.shopping_bag,
                        isSelected: selectedServiceType == 'Take Away',
                        onTap: () {
                          setState(() => selectedServiceType = 'Take Away');
                        },
                      ),
                      const SizedBox(width: 12),
                      ServiceTypeButton(
                        label: 'Delivery',
                        icon: Icons.check,
                        isSelected: selectedServiceType == 'Delivery',
                        onTap: () {
                          setState(() => selectedServiceType = 'Delivery');
                        },
                      ),
                      const SizedBox(width: 12),
                      ServiceTypeButton(
                        label: 'Table',
                        icon: Icons.chair,
                        isSelected: selectedServiceType == 'Table',
                        onTap: () {
                          setState(() => selectedServiceType = 'Table');
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Waiter and Customer Selection
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedWaiter,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                              const Icon(Icons.expand_more, size: 20),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Select Customer',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF0066FF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.add, color: Colors.white),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.edit, size: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Ordered Menus Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Ordered Menus',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Total Menus : ${items.length}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            // Menu Items
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return MenuItemCard(
                  item: item,
                  isFirst: index == 0,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  // Payment Summary
                  const Text(
                    'Payment Summary',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  PaymentRow(label: 'Sub Total', amount: '\$267'),
                  PaymentRow(label: 'Tax (18%)', amount: '\$26.7'),
                  const SizedBox(height: 16),
                  Container(
                    padding:  EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                     border:  Border(
                        top: BorderSide(color: Color(0xFFE0E0E0), width: 1),
                      ),
                    ) ,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Amount to be Paid',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$274',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Place Order Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0066FF),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Place an Order',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Bottom Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ActionButton(
                          label: 'Print',
                          icon: Icons.print,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ActionButton(
                          label: 'Invoice',
                          icon: Icons.description,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ActionButton(
                          label: 'Draft',
                          icon: Icons.drafts,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: ActionButton(
                          label: 'Cancel',
                          icon: Icons.close,
                          isDestructive: true,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ActionButton(
                          label: 'Void',
                          icon: Icons.flash_on,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ActionButton(
                          label: 'Tranactions',
                          icon: Icons.receipt,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceTypeButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const ServiceTypeButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF0066FF) : Colors.white,
            border: Border.all(
              color: isSelected ? const Color(0xFF0066FF) : Colors.grey[300]!,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : Colors.grey,
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItemCard extends StatelessWidget {
  final OrderItem item;
  final bool isFirst;

  const MenuItemCard({
    Key? key,
    required this.item,
    required this.isFirst,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: isFirst ? 0 : 8,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: isFirst ? const Color(0xFF0066FF) : Colors.grey[300]!,
          width: isFirst ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[200],
                  ),
                  child: Center(
                    child: Text(item.image, style: const TextStyle(fontSize: 32)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.size,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.remove, size: 18),
                    const SizedBox(width: 8),
                    Text(item.quantity.toString()),
                    const SizedBox(width: 8),
                    const Icon(Icons.add, size: 18),
                  ],
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    item.hasNote ? 'View Note' : 'Add Note',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF0066FF),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.close, size: 18, color: Colors.red),
              ],
            ),
            if (item.itemRate != null) ...[
              const SizedBox(height: 12),
              const Divider(height: 1),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Item Rate',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    '\$${item.itemRate}',
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  const Text(
                    'Amount',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    '\$${item.amount}',
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    '\$${item.total}',
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class PaymentRow extends StatelessWidget {
  final String label;
  final String amount;

  const PaymentRow({
    Key? key,
    required this.label,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isDestructive;

  const ActionButton({
    Key? key,
    required this.label,
    required this.icon,
    this.isDestructive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(
          color: isDestructive ? Colors.red : Colors.grey[300]!,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 16,
            color: isDestructive ? Colors.red : Colors.black,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isDestructive ? Colors.red : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class OrderItem {
  final String name;
  final String size;
  final int quantity;
  final int? itemRate;
  final int? amount;
  final int? total;
  final String image;
  final bool hasNote;

  OrderItem({
    required this.name,
    required this.size,
    required this.quantity,
    required this.itemRate,
    required this.amount,
    required this.total,
    required this.image,
    required this.hasNote,
  });
}


// class CardWidget extends StatelessWidget {
//   const CardWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         // 1. Navigation Rail
//         const NavigationRailSection(),
//
//         // 2. Main Menu Section
//         Expanded(
//           flex: 5,
//           child: MainMenuSection(),
//         ),
//
//         // 3. Order Sidebar
//         const Expanded(
//           flex: 2,
//           child: OrderSidebar(),
//         ),
//       ],
//     );
//   }
// }
//
//
// class NavigationRailSection extends StatelessWidget {
//   const NavigationRailSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 80,
//       color: Colors.white,
//       child: Column(
//         children: [
//           const Padding(
//             padding: EdgeInsets.symmetric(vertical: 30),
//             child: Icon(Icons.restaurant, color: Colors.orange, size: 30),
//           ),
//           _navIcon(Icons.grid_view_rounded, true),
//           _navIcon(Icons.receipt_long_rounded, false),
//           _navIcon(Icons.notifications_none_rounded, false),
//           _navIcon(Icons.settings_outlined, false),
//           const Spacer(),
//           _navIcon(Icons.logout_rounded, false),
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
//
//   Widget _navIcon(IconData icon, bool isActive) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 15),
//       child: Icon(icon, color: isActive ? Colors.orange : Colors.grey.shade400),
//     );
//   }
// }
//
// /// --- MAIN MENU CONTENT ---
// class MainMenuSection extends StatelessWidget {
//   final List<String> categories = ["All", "Burger", "Pizza", "Drink", "Dessert", "Pasta"];
//
//   MainMenuSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(25.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Header & Search
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Welcome, Cashier!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//                   Text("Discover your best food here", style: TextStyle(color: Colors.grey)),
//                 ],
//               ),
//               Container(
//                 width: 300,
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const TextField(
//                   decoration: InputDecoration(
//                     icon: Icon(Icons.search, color: Colors.grey),
//                     hintText: "Search food...",
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 30),
//
//           // Category Selector
//           SizedBox(
//             height: 45,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: categories.length,
//               itemBuilder: (context, index) {
//                 bool isSelected = index == 0;
//                 return Container(
//                   margin: const EdgeInsets.only(right: 15),
//                   padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//                   decoration: BoxDecoration(
//                     color: isSelected ? Colors.orange : Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Center(
//                     child: Text(
//                       categories[index],
//                       style: TextStyle(
//                         color: isSelected ? Colors.white : Colors.black,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           const SizedBox(height: 30),
//
//           // Food Grid
//           Expanded(
//             child: GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 crossAxisSpacing: 20,
//                 mainAxisSpacing: 20,
//                 childAspectRatio: 0.85,
//               ),
//               itemCount: 9,
//               itemBuilder: (context, index) {
//                 return const FoodItemCard();
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// /// --- FOOD ITEM CARD ---
// class FoodItemCard extends StatelessWidget {
//   const FoodItemCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const CircleAvatar(
//             radius: 50,
//             backgroundColor: Color(0xFFFFF3E0),
//             child: Icon(Icons.fastfood, size: 50, color: Colors.orange),
//           ),
//           const SizedBox(height: 15),
//           const Text("Double Beef Burger", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//           const Text("\$12.50", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 18)),
//           const SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFFFFF3E0),
//               elevation: 0,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             ),
//             child: const Text("Add to Cart", style: TextStyle(color: Colors.orange)),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// /// --- RIGHT SIDEBAR: ORDER SUMMARY ---
// class OrderSidebar extends StatelessWidget {
//   const OrderSidebar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: const EdgeInsets.all(25),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text("Current Order", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 20),
//
//           // Order List
//           Expanded(
//             child: ListView.builder(
//               itemCount: 3,
//               itemBuilder: (context, index) {
//                 return const CartItemTile();
//               },
//             ),
//           ),
//
//           const Divider(height: 40),
//
//           // Totals
//           const SummaryRow(label: "Subtotal", value: "\$45.00"),
//           const SummaryRow(label: "Discount", value: "-\$5.00"),
//           const SummaryRow(label: "Tax", value: "\$2.50"),
//           const SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: const [
//               Text("Total", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//               Text("\$42.50", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange)),
//             ],
//           ),
//           const SizedBox(height: 30),
//
//           // Checkout Button
//           SizedBox(
//             width: double.infinity,
//             height: 60,
//             child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.orange,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//               ),
//               child: const Text("Confirm Order", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class CartItemTile extends StatelessWidget {
//   const CartItemTile({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 15),
//       child: Row(
//         children: [
//           Container(
//             width: 60, height: 60,
//             decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(10)),
//             child: const Icon(Icons.fastfood, color: Colors.orange),
//           ),
//           const SizedBox(width: 15),
//           const Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Beef Burger", style: TextStyle(fontWeight: FontWeight.bold)),
//                 Text("x1", style: TextStyle(color: Colors.grey)),
//               ],
//             ),
//           ),
//           const Text("\$12.50", style: TextStyle(fontWeight: FontWeight.bold)),
//         ],
//       ),
//     );
//   }
// }
//
// class SummaryRow extends StatelessWidget {
//   final String label;
//   final String value;
//   const SummaryRow({super.key, required this.label, required this.value});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: const TextStyle(color: Colors.grey, fontSize: 16)),
//           Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
//         ],
//       ),
//     );
//   }
// }