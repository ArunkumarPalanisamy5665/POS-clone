import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/core/constants/app_colors.dart';



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
    return SafeArea(
      child: Scaffold(
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
                            color:  AppColors.primaryColor,
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
                          backgroundColor: AppColors.primaryColor,
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
            color: isSelected ? AppColors.primaryColor : Colors.white,
            border: Border.all(
              color: isSelected ? AppColors.primaryColor : Colors.grey[300]!,
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
          color: isFirst ? AppColors.primaryColor : Colors.grey[300]!,
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
                      color: AppColors.primaryColor,
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
