import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/core/constants/app_export.dart';

import '../../../../domain/models/dashBoardModel/dashboard_item.dart';
import '../../../../domain/models/food_item.dart';
import '../../../widgets/foodCard/food_card.dart';
import '../../../widgets/mainWidgets/trending_food_menu.dart';
import '../../../widgets/subHeader/sub_header_top_widget.dart';

//ADDONS


// class AddOn {
//   final String id;
//   final String item;
//   final String addon;
//   final double price;
//   final bool isActive;
//
//   AddOn({
//     required this.id,
//     required this.item,
//     required this.addon,
//     required this.price,
//     this.isActive = true,
//   });
//
//   AddOn copyWith({
//     String? id,
//     String? item,
//     String? addon,
//     double? price,
//     bool? isActive,
//   }) {
//     return AddOn(
//       id: id ?? this.id,
//       item: item ?? this.item,
//       addon: addon ?? this.addon,
//       price: price ?? this.price,
//       isActive: isActive ?? this.isActive,
//     );
//   }
// }
//
// class AddOnsScreen extends StatefulWidget {
//   const AddOnsScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AddOnsScreen> createState() => _AddOnsScreenState();
// }
//
// class _AddOnsScreenState extends State<AddOnsScreen> {
//   late List<AddOn> addOns;
//   String searchQuery = '';
//   String sortBy = 'Newest';
//
//   @override
//   void initState() {
//     super.initState();
//     addOns = [
//       AddOn(
//         id: '1',
//         item: 'Pizza',
//         addon: 'Extra Cheese',
//         price: 10,
//         isActive: true,
//       ),
//       AddOn(
//         id: '2',
//         item: 'Sauce',
//         addon: 'Garlic Butter Sauce',
//         price: 5,
//         isActive: true,
//       ),
//       AddOn(
//         id: '3',
//         item: 'Sea Food',
//         addon: 'Grilled Shrimp',
//         price: 20,
//         isActive: true,
//       ),
//       AddOn(
//         id: '4',
//         item: 'Salad',
//         addon: 'Avocado Slices',
//         price: 5,
//         isActive: true,
//       ),
//       AddOn(
//         id: '5',
//         item: 'Sauce',
//         addon: 'Spicy Mayo',
//         price: 10,
//         isActive: true,
//       ),
//       AddOn(
//         id: '6',
//         item: 'Topping',
//         addon: 'Crispy Bacon Bits',
//         price: 5,
//         isActive: true,
//       ),
//       AddOn(
//         id: '7',
//         item: 'Side Dish',
//         addon: 'Side Fries',
//         price: 10,
//         isActive: true,
//       ),
//       AddOn(
//         id: '8',
//         item: 'Topping',
//         addon: 'Guacamole',
//         price: 12,
//         isActive: true,
//       ),
//       AddOn(
//         id: '9',
//         item: 'Sauce',
//         addon: 'Extra Dressing',
//         price: 15,
//         isActive: true,
//       ),
//       AddOn(
//         id: '10',
//         item: 'Garnish',
//         addon: 'Lemon Wedge',
//         price: 10,
//         isActive: true,
//       ),
//     ];
//   }
//
//   List<AddOn> get filteredAddOns {
//     return addOns.where((addon) {
//       final matchesSearch = addon.item.toLowerCase().contains(searchQuery.toLowerCase()) ||
//           addon.addon.toLowerCase().contains(searchQuery.toLowerCase());
//       return matchesSearch;
//     }).toList();
//   }
//
//   void _editAddOn(int index) {
//     final addon = filteredAddOns[index];
//     _showAddOnDialog(addon, isEdit: true, originalIndex: index);
//   }
//
//   void _deleteAddOn(int index) {
//     setState(() {
//       addOns.removeWhere((a) => a.id == filteredAddOns[index].id);
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Add-on deleted')),
//     );
//   }
//
//   void _showAddOnDialog(AddOn? addon, {bool isEdit = false, int? originalIndex}) {
//     final itemController = TextEditingController(text: addon?.item ?? '');
//     final addonController = TextEditingController(text: addon?.addon ?? '');
//     final priceController = TextEditingController(text: addon?.price.toString() ?? '');
//
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(isEdit ? 'Edit Add-on' : 'Add New Add-on'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               controller: itemController,
//               decoration: InputDecoration(labelText: 'Item'),
//             ),
//             SizedBox(height: 12),
//             TextField(
//               controller: addonController,
//               decoration: InputDecoration(labelText: 'Add-on'),
//             ),
//             SizedBox(height: 12),
//             TextField(
//               controller: priceController,
//               decoration: InputDecoration(labelText: 'Price'),
//               keyboardType: TextInputType.number,
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               final newAddOn = AddOn(
//                 id: addon?.id ?? DateTime.now().toString(),
//                 item: itemController.text,
//                 addon: addonController.text,
//                 price: double.tryParse(priceController.text) ?? 0,
//                 isActive: addon?.isActive ?? true,
//               );
//
//               setState(() {
//                 if (isEdit && originalIndex != null) {
//                   final idx = addOns.indexWhere((a) => a.id == addon!.id);
//                   if (idx != -1) {
//                     addOns[idx] = newAddOn;
//                   }
//                 } else {
//                   addOns.add(newAddOn);
//                 }
//               });
//
//               Navigator.pop(context);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(isEdit ? 'Add-on updated' : 'Add-on created'),
//                 ),
//               );
//             },
//             child: Text(isEdit ? 'Update' : 'Create'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomDrawer(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _showAddOnDialog(null),
//         tooltip: 'Add new add-on',
//         child: const Icon(Icons.add),
//       ),
//       child: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// 🔹 TOP BAR
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     onChanged: (value) {
//                       setState(() => searchQuery = value);
//                     },
//                     decoration: InputDecoration(
//                       hintText: 'Search',
//                       prefixIcon: const Icon(Icons.search),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 IconButton(
//                   icon: const Icon(Icons.tune),
//                   onPressed: () {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Filter functionality')),
//                     );
//                   },
//                 ),
//                 PopupMenuButton<String>(
//                   onSelected: (value) {
//                     setState(() => sortBy = value);
//                   },
//                   itemBuilder: (context) => const [
//                     PopupMenuItem(value: 'Newest', child: Text('Newest')),
//                     PopupMenuItem(
//                       value: 'Price: Low to High',
//                       child: Text('Price: Low to High'),
//                     ),
//                     PopupMenuItem(
//                       value: 'Price: High to Low',
//                       child: Text('Price: High to Low'),
//                     ),
//                   ],
//                   child: Row(
//                     children: [
//                       Text('Sort by: $sortBy'),
//                       const Icon(Icons.arrow_drop_down),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//
//             const SizedBox(height: 20),
//
//             /// 🔹 TABLE WITH CUSTOM DIVIDER COLOR
//             filteredAddOns.isEmpty
//                 ? const Center(child: Text('No add-ons found'))
//                 : DataTableTheme(
//               data: const DataTableThemeData(
//
//                 dividerThickness: 1,
//               ),
//               child: DataTable(
//                 columnSpacing: 32,
//                 columns: const [
//                   DataColumn(label: Text('Item')),
//                   DataColumn(label: Text('Add-on')),
//                   DataColumn(label: Text('Price')),
//                   DataColumn(label: Text('Status')),
//                   DataColumn(label: Text('Actions')),
//                 ],
//                 rows: List.generate(filteredAddOns.length, (index) {
//                   final addon = filteredAddOns[index];
//                   return DataRow(
//                     cells: [
//                       DataCell(Text(addon.item)),
//                       DataCell(Text(addon.addon)),
//                       DataCell(
//                         Text('\$${addon.price.toStringAsFixed(2)}'),
//                       ),
//                       DataCell(
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 8,
//                             vertical: 4,
//                           ),
//                           decoration: BoxDecoration(
//                             color: addon.isActive
//                                 ? Colors.green.shade100
//                                 : Colors.grey.shade100,
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                           child: Text(
//                             addon.isActive ? 'Active' : 'Inactive',
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500,
//                               color: addon.isActive
//                                   ? Colors.green
//                                   : Colors.grey,
//                             ),
//                           ),
//                         ),
//                       ),
//                       DataCell(
//                         Row(
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.edit, size: 18),
//                               onPressed: () => _editAddOn(index),
//                             ),
//                             IconButton(
//                               icon: const Icon(
//                                 Icons.delete,
//                                 size: 18,
//                                 color: Colors.red,
//                               ),
//                               onPressed: () => _deleteAddOn(index),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   );
//                 }),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//
// }


//CUPONS



/*
//cupons
import 'package:flutter/material.dart';

class AddOnsScreen extends StatefulWidget {
  const AddOnsScreen({Key? key}) : super(key: key);

  @override
  State<AddOnsScreen> createState() => _AddOnsScreenState();
}

class _AddOnsScreenState extends State<AddOnsScreen> {
  int currentPage = 1;

  final List<CouponData> coupons = [
    CouponData(
      code: 'SEAFOOD10',
      category: 'Sea Foods',
      discountType: 'Percentage',
      discountAmount: '10%',
      duration: '01 Jan 2025 - 31 Dec 2025',
      status: 'Active',
    ),
    CouponData(
      code: 'PIZZA20',
      category: 'Pizza Orders',
      discountType: 'Fixed Amount',
      discountAmount: '20%',
      duration: '15 Feb 2025 - 20 Nov 2025',
      status: 'Active',
    ),
    CouponData(
      code: 'SALAD15',
      category: 'Salads',
      discountType: 'Percentage',
      discountAmount: '15%',
      duration: '22 Mar 2025 - 25 Nov 2025',
      status: 'Active',
    ),
    CouponData(
      code: 'TACO5',
      category: 'Salads',
      discountType: 'Percentage',
      discountAmount: '\$5',
      duration: '15 Apr 2025 - 10 Oct 2025',
      status: 'Expired',
    ),
    CouponData(
      code: 'WEEKEND25',
      category: 'All Categories',
      discountType: 'Percentage',
      discountAmount: '25%',
      duration: '03 May 2025 - 13 Nov 2025',
      status: 'Active',
    ),
    CouponData(
      code: 'COMBO50',
      category: 'Combo Meals',
      discountType: 'Percentage',
      discountAmount: '5%',
      duration: '05 Jun 2025 - 20 Dec 2025',
      status: 'Active',
    ),
    CouponData(
      code: 'HOLIDAY30',
      category: 'All Categories',
      discountType: 'Fixed Amount',
      discountAmount: '\$30',
      duration: '10 Jul 2025 - 15 Dec 2025',
      status: 'Active',
    ),
    CouponData(
      code: 'SWEET10',
      category: 'Desserts',
      discountType: 'Percentage',
      discountAmount: '10%',
      duration: '18 Aug 2025 - 25 Dec 2025',
      status: 'Active',
    ),
    CouponData(
      code: 'FAMILYFEAST',
      category: 'All Categories',
      discountType: 'Fixed Amount',
      discountAmount: '\$100',
      duration: '04 Sep 2025 - 10 Oct 2025',
      status: 'Expired',
    ),
    CouponData(
      code: 'FIRSTORDER',
      category: 'All Categories',
      discountType: 'Fixed Amount',
      discountAmount: '\$50',
      duration: '01 Nov 2025 - 31 Dec 2025',
      status: 'Active',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Coupons',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.black),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Add New'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1976D2),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Header and Filter Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () {},
                ),
                PopupMenuButton<String>(
                  onSelected: (String result) {},
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'Newest',
                      child: Text('Sort by: Newest'),
                    ),
                  ],
                  child: const Row(
                    children: [
                      Icon(Icons.sort),
                      SizedBox(width: 4),
                      Text('Sort by: Newest'),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Table
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 20,
                columns: const [
                  DataColumn(label: Text('Coupon Code')),
                  DataColumn(label: Text('Valid Category')),
                  DataColumn(label: Text('Discount Type')),
                  DataColumn(label: Text('Discount Amount')),
                  DataColumn(label: Text('Duration')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Actions')),
                ],
                rows: coupons.map((coupon) {
                  return DataRow(
                    cells: [
                      DataCell(Text(coupon.code)),
                      DataCell(Text(coupon.category)),
                      DataCell(Text(coupon.discountType)),
                      DataCell(Text(coupon.discountAmount)),
                      DataCell(Text(coupon.duration)),
                      DataCell(
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: coupon.status == 'Active'
                                ? Colors.green.withOpacity(0.1)
                                : Colors.red.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            coupon.status,
                            style: TextStyle(
                              color: coupon.status == 'Active' ? Colors.green : Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.visibility, size: 18),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit, size: 18),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, size: 18),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
          // Pagination
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('10 Entries'),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: currentPage > 1 ? () => setState(() => currentPage--) : null,
                    ),
                    ...[1, 2, 3].map((page) {
                      return GestureDetector(
                        onTap: () => setState(() => currentPage = page),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: currentPage == page
                                ? const Color(0xFF1976D2)
                                : Colors.transparent,
                            border: Border.all(
                              color: currentPage == page
                                  ? const Color(0xFF1976D2)
                                  : Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '$page',
                            style: TextStyle(
                              color: currentPage == page ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: currentPage < 3 ? () => setState(() => currentPage++) : null,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CouponData {
  final String code;
  final String category;
  final String discountType;
  final String discountAmount;
  final String duration;
  final String status;

  CouponData({
    required this.code,
    required this.category,
    required this.discountType,
    required this.discountAmount,
    required this.duration,
    required this.status,
  });
}
* */


/*

//invoice

import 'package:flutter/material.dart';

class AddOnsScreen extends StatefulWidget {
  const AddOnsScreen({Key? key}) : super(key: key);

  @override
  State<AddOnsScreen> createState() => _AddOnsScreenState();
}

class _AddOnsScreenState extends State<AddOnsScreen> {
  int currentPage = 1;

  final List<Invoice> invoices = [
    Invoice(
      id: '#INV0016',
      customer: 'Adrian James',
      date: '01 Nov 2025',
      orderType: 'Dine In',
      amount: '\$1000',
      status: 'Paid',
    ),
    Invoice(
      id: '#INV0015',
      customer: 'Sue Allen',
      date: '04 Sep 2025',
      orderType: 'Take Away',
      amount: '\$1500',
      status: 'Paid',
    ),
    Invoice(
      id: '#INV0014',
      customer: 'Frank Barrett',
      date: '18 Aug 2025',
      orderType: 'Delivery',
      amount: '\$1200',
      status: 'Paid',
    ),
    Invoice(
      id: '#INV0013',
      customer: 'Kelley Davis',
      date: '10 Jul 2025',
      orderType: 'Dine In',
      amount: '\$800',
      status: 'Paid',
    ),
    Invoice(
      id: '#INV0012',
      customer: 'Jim Vickers',
      date: '05 Jun 2025',
      orderType: 'Delivery',
      amount: '\$750',
      status: 'Paid',
    ),
    Invoice(
      id: '#INV0011',
      customer: 'Nancy Chapman',
      date: '03 May 2025',
      orderType: 'Dine In',
      amount: '\$1300',
      status: 'Paid',
    ),
    Invoice(
      id: '#INV0010',
      customer: 'Ron Jude',
      date: '15 Apr 2025',
      orderType: 'Take Away',
      amount: '\$1100',
      status: 'Paid',
    ),
    Invoice(
      id: '#INV0009',
      customer: 'Andrea Aponte',
      date: '22 Mar 2025',
      orderType: 'Delivery',
      amount: '\$600',
      status: 'Paid',
    ),
    Invoice(
      id: '#INV0008',
      customer: 'David Belcher',
      date: '15 Feb 2025',
      orderType: 'Take Away',
      amount: '\$1300',
      status: 'Paid',
    ),
    Invoice(
      id: '#INV0007',
      customer: 'Julie Kangas',
      date: '01 Jan 2025',
      orderType: 'Dine In',
      amount: '\$800',
      status: 'Paid',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Invoices',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search and Filter Bar
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: const Icon(Icons.filter_list, color: Colors.black),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Table Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              color: const Color(0xFFF5F5F5),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: _buildHeaderCell('Invoice ID'),
                  ),
                  Expanded(
                    flex: 2,
                    child: _buildHeaderCell('Customer'),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildHeaderCell('Date'),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildHeaderCell('Order Type'),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildHeaderCell('Amount'),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildHeaderCell('Status'),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildHeaderCell('Actions'),
                  ),
                ],
              ),
            ),
            const Divider(height: 0),
            // Table Rows
            Expanded(
              child: ListView.separated(
                itemCount: invoices.length,
                separatorBuilder: (context, index) =>
                const Divider(height: 0),
                itemBuilder: (context, index) {
                  final invoice = invoices[index];
                  return _buildTableRow(invoice);
                },
              ),
            ),
            // Pagination
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<int>(
                    value: 10,
                    items: [10, 20, 50].map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text('$value Entries'),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {},
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.chevron_left),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 8),
                      _buildPageButton('1', true),
                      const SizedBox(width: 8),
                      _buildPageButton('2', false),
                      const SizedBox(width: 8),
                      _buildPageButton('3', false),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.chevron_right),
                        onPressed: () {},
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

  Widget _buildHeaderCell(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildTableRow(Invoice invoice) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              invoice.id,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.grey[300],
                  child: Text(
                    invoice.customer[0],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  invoice.customer,
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              invoice.date,
              style: const TextStyle(fontSize: 13),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              invoice.orderType,
              style: const TextStyle(fontSize: 13),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              invoice.amount,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                invoice.status,
                style: const TextStyle(
                  color: Color(0xFF4CAF50),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.download, size: 18),
                  onPressed: () {},
                  constraints: const BoxConstraints(),
                  padding: const EdgeInsets.all(4),
                ),
                IconButton(
                  icon: const Icon(Icons.visibility, size: 18),
                  onPressed: () {},
                  constraints: const BoxConstraints(),
                  padding: const EdgeInsets.all(4),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, size: 18),
                  onPressed: () {},
                  constraints: const BoxConstraints(),
                  padding: const EdgeInsets.all(4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageButton(String page, bool isActive) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF2196F3) : Colors.transparent,
        border: Border.all(
          color: isActive ? const Color(0xFF2196F3) : const Color(0xFFE0E0E0),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          page,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class Invoice {
  final String id;
  final String customer;
  final String date;
  final String orderType;
  final String amount;
  final String status;

  Invoice({
    required this.id,
    required this.customer,
    required this.date,
    required this.orderType,
    required this.amount,
    required this.status,
  });
}
*/

/*
//payment:
import 'package:flutter/material.dart';

class AddOnsScreen extends StatefulWidget {
  const AddOnsScreen({Key? key}) : super(key: key);

  @override
  State<AddOnsScreen> createState() => _AddOnsScreenState();
}

class _AddOnsScreenState extends State<AddOnsScreen> {
  int currentPage = 1;
  final List<Map<String, dynamic>> payments = [
    {
      'transactionId': '#23588',
      'orderId': '#57005',
      'tokenNo': '16',
      'customer': 'Walk-in Customer',
      'avatar': null,
      'type': 'Dine In',
      'menus': 3,
      'total': '\$34.50',
    },
    {
      'transactionId': '#23587',
      'orderId': '#57004',
      'tokenNo': '15',
      'customer': 'Sue Allen',
      'avatar': 'S',
      'type': 'Take Away',
      'menus': 7,
      'total': '\$78.20',
    },
    {
      'transactionId': '#23586',
      'orderId': '#57003',
      'tokenNo': '14',
      'customer': 'Frank Barrett',
      'avatar': 'F',
      'type': 'Delivery',
      'menus': 4,
      'total': '\$45.10',
    },
    {
      'transactionId': '#23585',
      'orderId': '#57002',
      'tokenNo': '13',
      'customer': 'Kelley Davis',
      'avatar': 'K',
      'type': 'Dine In',
      'menus': 9,
      'total': '\$92.80',
    },
    {
      'transactionId': '#23584',
      'orderId': '#57001',
      'tokenNo': '12',
      'customer': 'Jim Vickers',
      'avatar': 'J',
      'type': 'Take Away',
      'menus': 6,
      'total': '\$61.40',
    },
    {
      'transactionId': '#23583',
      'orderId': '#57000',
      'tokenNo': '11',
      'customer': 'Nancy Chapman',
      'avatar': 'N',
      'type': 'Take Away',
      'menus': 5,
      'total': '\$57.20',
    },
    {
      'transactionId': '#23582',
      'orderId': '#56999',
      'tokenNo': '10',
      'customer': 'Ron Jude',
      'avatar': 'R',
      'type': 'Take Away',
      'menus': 4,
      'total': '\$45.30',
    },
    {
      'transactionId': '#23581',
      'orderId': '#56998',
      'tokenNo': '09',
      'customer': 'Andrea Aporte',
      'avatar': 'A',
      'type': 'Take Away',
      'menus': 7,
      'total': '\$72.60',
    },
    {
      'transactionId': '#23580',
      'orderId': '#56997',
      'tokenNo': '08',
      'customer': 'David Belcher',
      'avatar': 'D',
      'type': 'Take Away',
      'menus': 3,
      'total': '\$32.10',
    },
    {
      'transactionId': '#23579',
      'orderId': '#56996',
      'tokenNo': '07',
      'customer': 'Julie Kangas',
      'avatar': 'J',
      'type': 'Take Away',
      'menus': 4,
      'total': '\$40.30',
    },
  ];

  final List<Color> avatarColors = [
    const Color(0xFF4CAF50),
    const Color(0xFFFF9800),
    const Color(0xFF9C27B0),
    const Color(0xFF2196F3),
    const Color(0xFFE91E63),
  ];

  Color getAvatarColor(int index) {
    return avatarColors[index % avatarColors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Payments',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.download, color: Colors.black),
            label: const Text(
              'Export',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                ),
                PopupMenuButton(
                  child: Row(
                    children: const [
                      Text('Sort by: Newest'),
                      SizedBox(width: 4),
                      Icon(Icons.expand_more),
                    ],
                  ),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      child: Text('Newest'),
                    ),
                    const PopupMenuItem(
                      child: Text('Oldest'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Transaction ID')),
                    DataColumn(label: Text('Order ID')),
                    DataColumn(label: Text('Token No')),
                    DataColumn(label: Text('Customer')),
                    DataColumn(label: Text('Type')),
                    DataColumn(label: Text('Menus')),
                    DataColumn(label: Text('Grand Total')),
                  ],
                  rows: payments.asMap().entries.map((entry) {
                    int index = entry.key;
                    Map<String, dynamic> payment = entry.value;
                    return DataRow(
                      cells: [
                        DataCell(Text(payment['transactionId'])),
                        DataCell(Text(payment['orderId'])),
                        DataCell(Text(payment['tokenNo'])),
                        DataCell(
                          Row(
                            children: [
                              if (payment['avatar'] != null)
                                CircleAvatar(
                                  radius: 16,
                                  backgroundColor: getAvatarColor(index),
                                  child: Text(
                                    payment['avatar'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              else
                                CircleAvatar(
                                  radius: 16,
                                  backgroundColor: Colors.grey[300],
                                  child: const Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                  ),
                                ),
                              const SizedBox(width: 8),
                              Text(payment['customer']),
                            ],
                          ),
                        ),
                        DataCell(Text(payment['type'])),
                        DataCell(Text(payment['menus'].toString())),
                        DataCell(Text(payment['total'])),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('10 Entries'),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_left),
                    ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        '2',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 4),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        '3',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/


/*
//user

import 'package:flutter/material.dart';

class AddOnsScreen extends StatefulWidget {
  const AddOnsScreen({Key? key}) : super(key: key);

  @override
  State<AddOnsScreen> createState() => _AddOnsScreenState();
}

class _AddOnsScreenState extends State<AddOnsScreen> {
  final List<UserData> users = [
    UserData('John Smith', 'Admin / Owner', '+123456 78901', 'Active'),
    UserData('Emily Johnson', 'Supervisor', '+134567 89012', 'Active'),
    UserData('David Williams', 'Cashier', '+145678 90123', 'Active'),
    UserData('Ashley Brown', 'Chef', '+156789 01234', 'Active'),
    UserData('Michael Davis', 'Waiter', '+167890 12345', 'Active'),
    UserData('Brittany Miller', 'Delivery', '+178901 23456', 'Active'),
    UserData('Christopher Wilson', 'Accountant', '+189012 34567', 'Active'),
    UserData('Jessica Moore', 'System Operator', '+190123 45678', 'Active'),
    UserData('Matthew Taylor', 'Chef', '+101234 56789', 'Active'),
    UserData('Sarah Anderson', 'Chef', '+112345 67890', 'Active'),
  ];

  int currentPage = 1;
  String sortBy = 'Newest';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Users',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.download, color: Colors.black87),
              label: const Text(
                'Export',
                style: TextStyle(color: Colors.black87),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Add New'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search and Filter Row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.tune, color: Colors.black87),
                  label: const Text(
                    'Filter',
                    style: TextStyle(color: Colors.black87),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                  ),
                ),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.delete_outline, color: Colors.black87),
                  label: const Text(''),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                  ),
                ),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: sortBy,
                  onChanged: (String? newValue) {
                    setState(() {
                      sortBy = newValue ?? 'Newest';
                    });
                  },
                  items: <String>['Newest', 'Oldest', 'A-Z', 'Z-A']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text('Sort by: $value'),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Table Header with Horizontal and Vertical Scroll
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Table(
                    columnWidths: const {
                      0: FixedColumnWidth(250),
                      1: FixedColumnWidth(150),
                      2: FixedColumnWidth(180),
                      3: FixedColumnWidth(100),
                      4: FixedColumnWidth(120),
                    },
                    children: [
                      TableRow(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[300]!,
                            ),
                          ),
                        ),
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                            child: Text(
                              'Name',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                            child: Text(
                              'Role',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                            child: Text(
                              'Phone Number',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                            child: Text(
                              'Status',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                            child: Text(
                              'Actions',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ...users.map((user) {
                        return TableRow(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey[200]!,
                              ),
                            ),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.grey[300],
                                    child: Text(
                                      user.name[0],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(child: Text(user.name)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                              child: Text(user.role),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                              child: Text(user.phone),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                              child: Text(
                                user.status,
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit,
                                        color: Colors.grey, size: 18),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.grey, size: 18),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Pagination
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<int>(
                  value: 10,
                  items: const [
                    DropdownMenuItem(value: 10, child: Text('10 Entries')),
                    DropdownMenuItem(value: 25, child: Text('25 Entries')),
                    DropdownMenuItem(value: 50, child: Text('50 Entries')),
                  ],
                  onChanged: (int? value) {},
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: () {},
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: const Text('1'),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: const Text('2'),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: const Text('3'),
                    ),
                    IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UserData {
  final String name;
  final String role;
  final String phone;
  final String status;

  UserData(this.name, this.role, this.phone, this.status);
}*/

/*
//Permission
import 'package:flutter/material.dart';

class AddOnsScreen extends StatefulWidget {
  const AddOnsScreen({Key? key}) : super(key: key);

  @override
  State<AddOnsScreen> createState() => _AddOnsScreenState();
}

class _AddOnsScreenState extends State<AddOnsScreen> {
  String selectedRole = 'Admin';

  final List<String> roles = [
    'Admin',
    'Supervisor',
    'Cashier',
    'Chef',
    'Waiter',
    'Accountant',
    'System Operator',
  ];

  final List<String> modules = [
    'Dashboard',
    'POS',
    'Hold/Resume Sale',
    'Refund / Return',
    'Products',
    'Categories',
    'Customers',
    'Reports',
    'Settings',
  ];

  final List<String> permissions = ['View', 'Add', 'Edit', 'Delete', 'Export', 'Approved/Void'];

  late Map<String, Map<String, Map<String, bool>>> rolePermissions;

  @override
  void initState() {
    super.initState();
    _initializePermissions();
  }

  void _initializePermissions() {
    rolePermissions = {};
    for (String role in roles) {
      rolePermissions[role] = {};
      for (String module in modules) {
        rolePermissions[role]![module] = {};
        for (String permission in permissions) {
          rolePermissions[role]![module]![permission] = false;
        }
      }
    }
  }

  void _revertAll() {
    setState(() {
      _initializePermissions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permissions'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Row(
        children: [
          // Left Sidebar - Roles
          Container(
            width: 280,
            color: Colors.grey[50],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Roles',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: roles.length,
                    itemBuilder: (context, index) {
                      final role = roles[index];
                      final isSelected = selectedRole == role;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedRole = role;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.blue[100] : Colors.transparent,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Text(
                              role,
                              style: TextStyle(
                                color: isSelected ? Colors.blue[700] : Colors.black,
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Right Content - Permissions Table
          Expanded(
            child: Column(
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Role : $selectedRole',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _revertAll,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          foregroundColor: Colors.black,
                        ),
                        child: const Text('Revert All'),
                      ),
                    ],
                  ),
                ),
                // Permissions Table
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Table Header
                        Container(
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    'Module',
                                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                ...permissions.map((permission) {
                                  return Expanded(
                                    child: Center(
                                      child: Text(
                                        permission,
                                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ],
                            ),
                          ),
                        ),
                        // Table Rows
                        ...modules.map((module) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: Text(
                                      module,
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                  ),
                                  ...permissions.map((permission) {
                                    final isChecked = rolePermissions[selectedRole]![module]![permission] ?? false;
                                    return Expanded(
                                      child: Center(
                                        child: Checkbox(
                                          value: isChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              rolePermissions[selectedRole]![module]![permission] = value ?? false;
                                            });
                                          },
                                          activeColor: Colors.blue,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
              onPressed: () {
                // Handle Cancel
              },
              child: const Text('Cancel'),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: () {
                // Handle Save Changes
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}*/


/*
//Report

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AddOnsScreen extends StatefulWidget {
  const AddOnsScreen({Key? key}) : super(key: key);

  @override
  State<AddOnsScreen> createState() => _ReportsDashboardState();
}

class _ReportsDashboardState extends State<AddOnsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  DateTime startDate = DateTime(2025, 10, 31);
  DateTime endDate = DateTime(2025, 11, 1);
  String selectedPaymentMethod = 'Select';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Reports', style: TextStyle(color: Colors.black, fontSize: 18)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: () {},
              child: const Row(
                children: [
                  Icon(Icons.download, color: Colors.black87, size: 20),
                  SizedBox(width: 8),
                  Text('Export', style: TextStyle(color: Colors.black87, fontSize: 14)),
                ],
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                labelColor: const Color(0xFF0052CC),
                unselectedLabelColor: Colors.grey,
                indicatorColor: const Color(0xFF0052CC),
                tabs: const [
                  Tab(text: 'Earning Report'),
                  Tab(text: 'Order Report'),
                  Tab(text: 'Sales Report'),
                  Tab(text: 'Customer Report'),
                  Tab(text: 'Audit Logs'),
                ],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          EarningReportTab(
            startDate: startDate,
            endDate: endDate,
            selectedPaymentMethod: selectedPaymentMethod,
            onStartDateChanged: (date) => setState(() => startDate = date),
            onEndDateChanged: (date) => setState(() => endDate = date),
            onPaymentMethodChanged: (method) => setState(() => selectedPaymentMethod = method),
          ),
          OrderReportTab(
            startDate: startDate,
            endDate: endDate,
            onStartDateChanged: (date) => setState(() => startDate = date),
            onEndDateChanged: (date) => setState(() => endDate = date),
          ),
          SalesReportTab(
            startDate: startDate,
            endDate: endDate,
            onStartDateChanged: (date) => setState(() => startDate = date),
            onEndDateChanged: (date) => setState(() => endDate = date),
          ),
          CustomerReportTab(
            startDate: startDate,
            endDate: endDate,
            onStartDateChanged: (date) => setState(() => startDate = date),
            onEndDateChanged: (date) => setState(() => endDate = date),
          ),
          const AuditLogsTab(),
        ],
      ),
    );
  }
}

// Earning Report Tab
class EarningReportTab extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;
  final String selectedPaymentMethod;
  final Function(DateTime) onStartDateChanged;
  final Function(DateTime) onEndDateChanged;
  final Function(String) onPaymentMethodChanged;

  const EarningReportTab({
    Key? key,
    required this.startDate,
    required this.endDate,
    required this.selectedPaymentMethod,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
    required this.onPaymentMethodChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildFilterSection(context),
          _buildEarningTable(),
        ],
      ),
    );
  }

  Widget _buildFilterSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _buildDateField('Start Date', startDate, onStartDateChanged, context),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildDateField('End Date', endDate, onEndDateChanged, context),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildPaymentMethodDropdown(),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0052CC),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text('Submit', style: TextStyle(color: Colors.white, fontSize: 14)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              PopupMenuButton<String>(
                onSelected: (value) {},
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem(value: 'newest', child: Text('Newest')),
                  const PopupMenuItem(value: 'oldest', child: Text('Oldest')),
                ],
                child: Row(
                  children: const [
                    Text('Sort by: Newest', style: TextStyle(fontSize: 12)),
                    Icon(Icons.arrow_drop_down, size: 18),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDateField(String label, DateTime date, Function(DateTime) onChanged, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12)),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(2020),
              lastDate: DateTime.now(),
            );
            if (picked != null) {
              onChanged(picked);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(DateFormat('dd MMM yyyy').format(date), style: const TextStyle(fontSize: 12)),
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Payment Method', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12)),
        const SizedBox(height: 4),
        DropdownButtonFormField<String>(
          value: selectedPaymentMethod,
          items: ['Select', 'Credit Card', 'Cash', 'PayPal']
              .map((method) => DropdownMenuItem(value: method, child: Text(method)))
              .toList(),
          onChanged: (value) => onPaymentMethodChanged(value ?? 'Select'),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
        ),
      ],
    );
  }

  Widget _buildEarningTable() {
    final earningData = [
      {'id': '#ERN0016', 'date': '01 Nov 2025', 'orderId': '#23588', 'customer': 'Walk-in Customer', 'type': 'Dine in', 'method': 'Credit Card', 'total': '\$34.50'},
      {'id': '#ERN0015', 'date': '01 Nov 2025', 'orderId': '#23587', 'customer': 'Sue Allen', 'type': 'Take Away', 'method': 'Cash', 'total': '\$78.20'},
      {'id': '#ERN0014', 'date': '01 Nov 2025', 'orderId': '#23586', 'customer': 'Frank Barrett', 'type': 'Delivery', 'method': 'PayPal', 'total': '\$45.10'},
      {'id': '#ERN0013', 'date': '01 Nov 2025', 'orderId': '#23585', 'customer': 'Kelley Davis', 'type': 'Dine in', 'method': 'Credit Card', 'total': '\$92.80'},
      {'id': '#ERN0012', 'date': '01 Nov 2025', 'orderId': '#23584', 'customer': 'Jim Vickers', 'type': 'Take Away', 'method': 'Cash', 'total': '\$61.40'},
      {'id': '#ERN0010', 'date': '01 Nov 2025', 'orderId': '#23583', 'customer': 'Nancy Chapman', 'type': 'Take Away', 'method': 'PayPal', 'total': '\$57.20'},
      {'id': '#ERN0009', 'date': '31 Oct 2025', 'orderId': '#23582', 'customer': 'Ron Jude', 'type': 'Take Away', 'method': 'Cash', 'total': '\$45.30'},
      {'id': '#ERN0008', 'date': '31 Oct 2025', 'orderId': '#23581', 'customer': 'Andrea Aporte', 'type': 'Take Away', 'method': 'Credit Card', 'total': '\$72.60'},
      {'id': '#ERN0007', 'date': '31 Oct 2025', 'orderId': '#23580', 'customer': 'David Belcher', 'type': 'Take Away', 'method': 'Cash', 'total': '\$32.10'},
      {'id': '#ERN0006', 'date': '31 Oct 2025', 'orderId': '#23579', 'customer': 'Julie Kangas', 'type': 'Take Away', 'method': 'Cash', 'total': '\$40.30'},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Earning ID')),
          DataColumn(label: Text('Date')),
          DataColumn(label: Text('Order ID')),
          DataColumn(label: Text('Customer')),
          DataColumn(label: Text('Type')),
          DataColumn(label: Text('Payment Method')),
          DataColumn(label: Text('Grand Total')),
          DataColumn(label: Text('Status')),
        ],
        rows: earningData.map((row) {
          return DataRow(cells: [
            DataCell(Text(row['id']!)),
            DataCell(Text(row['date']!)),
            DataCell(Text(row['orderId']!)),
            DataCell(Text(row['customer']!)),
            DataCell(Text(row['type']!)),
            DataCell(Text(row['method']!)),
            DataCell(Text(row['total']!)),
            DataCell(
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text('Completed', style: TextStyle(color: Colors.green, fontSize: 12)),
              ),
            ),
          ]);
        }).toList(),
      ),
    );
  }
}

// Order Report Tab
class OrderReportTab extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;
  final Function(DateTime) onStartDateChanged;
  final Function(DateTime) onEndDateChanged;

  const OrderReportTab({
    Key? key,
    required this.startDate,
    required this.endDate,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildFilterSection(context),
          _buildOrderTable(),
        ],
      ),
    );
  }

  Widget _buildFilterSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: _buildDateField('Start Date', startDate, onStartDateChanged, context),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildDateField('End Date', endDate, onEndDateChanged, context),
          ),
          const SizedBox(width: 12),
          Expanded(child: Container()),
          const SizedBox(width: 12),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0052CC),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Submit', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateField(String label, DateTime date, Function(DateTime) onChanged, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12)),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(2020),
              lastDate: DateTime.now(),
            );
            if (picked != null) {
              onChanged(picked);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(DateFormat('dd/MM/yyyy').format(date), style: const TextStyle(fontSize: 12)),
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderTable() {
    final orderData = [
      {'orderId': '#23588', 'date': '01 Nov 2025', 'customer': 'Walk-in Customer', 'taken': '16', 'type': 'Dine in', 'menus': '9', 'total': '\$34.50'},
      {'orderId': '#23587', 'date': '01 Nov 2025', 'customer': 'Sue Allen', 'taken': '15', 'type': 'Take Away', 'menus': '7', 'total': '\$78.20'},
      {'orderId': '#23586', 'date': '01 Nov 2025', 'customer': 'Frank Barrett', 'taken': '14', 'type': 'Delivery', 'menus': '4', 'total': '\$45.10'},
      {'orderId': '#23585', 'date': '01 Nov 2025', 'customer': 'Kelley Davis', 'taken': '13', 'type': 'Dine in', 'menus': '9', 'total': '\$92.80'},
      {'orderId': '#23584', 'date': '01 Nov 2025', 'customer': 'Jim Vickers', 'taken': '12', 'type': 'Take Away', 'menus': '6', 'total': '\$61.40'},
      {'orderId': '#23583', 'date': '01 Nov 2025', 'customer': 'Nancy Chapman', 'taken': '11', 'type': 'Take Away', 'menus': '5', 'total': '\$57.20'},
      {'orderId': '#23582', 'date': '31 Oct 2025', 'customer': 'Ron Jude', 'taken': '10', 'type': 'Take Away', 'menus': '4', 'total': '\$45.30'},
      {'orderId': '#23581', 'date': '31 Oct 2025', 'customer': 'Andrea Aporte', 'taken': '09', 'type': 'Take Away', 'menus': '7', 'total': '\$72.60'},
      {'orderId': '#23580', 'date': '31 Oct 2025', 'customer': 'David Belcher', 'taken': '08', 'type': 'Take Away', 'menus': '3', 'total': '\$32.10'},
      {'orderId': '#23579', 'date': '31 Oct 2025', 'customer': 'Julie Kangas', 'taken': '07', 'type': 'Take Away', 'menus': '4', 'total': '\$40.30'},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Order ID')),
          DataColumn(label: Text('Date')),
          DataColumn(label: Text('Customer')),
          DataColumn(label: Text('Taken No')),
          DataColumn(label: Text('Type')),
          DataColumn(label: Text('Menus')),
          DataColumn(label: Text('Grand Total')),
          DataColumn(label: Text('Status')),
        ],
        rows: orderData.map((row) {
          return DataRow(cells: [
            DataCell(Text(row['orderId']!)),
            DataCell(Text(row['date']!)),
            DataCell(Text(row['customer']!)),
            DataCell(Text(row['taken']!)),
            DataCell(Text(row['type']!)),
            DataCell(Text(row['menus']!)),
            DataCell(Text(row['total']!)),
            DataCell(
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text('Paid', style: TextStyle(color: Colors.green, fontSize: 12)),
              ),
            ),
          ]);
        }).toList(),
      ),
    );
  }
}

// Sales Report Tab
class SalesReportTab extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;
  final Function(DateTime) onStartDateChanged;
  final Function(DateTime) onEndDateChanged;

  const SalesReportTab({
    Key? key,
    required this.startDate,
    required this.endDate,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildFilterSection(context),
          _buildSalesTable(),
        ],
      ),
    );
  }

  Widget _buildFilterSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: _buildDateField('Start Date', startDate, onStartDateChanged, context),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildDateField('End Date', endDate, onEndDateChanged, context),
          ),
          const SizedBox(width: 12),
          Expanded(child: Container()),
          const SizedBox(width: 12),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0052CC),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Submit', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateField(String label, DateTime date, Function(DateTime) onChanged, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12)),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(2020),
              lastDate: DateTime.now(),
            );
            if (picked != null) {
              onChanged(picked);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(DateFormat('dd/MM/yyyy').format(date), style: const TextStyle(fontSize: 12)),
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSalesTable() {
    final salesData = [
      {'saleId': '#SAL0016', 'date': '01 Nov 2025', 'category': 'Sea Food', 'itemsSold': '28', 'totalOrders': '32', 'method': 'Credit Card', 'total': '\$1000'},
      {'saleId': '#SAL0015', 'date': '01 Nov 2025', 'category': 'Pizza', 'itemsSold': '42', 'totalOrders': '45', 'method': 'Cash', 'total': '\$1500'},
      {'saleId': '#SAL0014', 'date': '01 Nov 2025', 'category': 'Salads', 'itemsSold': '66', 'totalOrders': '70', 'method': 'PayPal', 'total': '\$1200'},
      {'saleId': '#SAL0013', 'date': '01 Nov 2025', 'category': 'Tacos', 'itemsSold': '48', 'totalOrders': '53', 'method': 'Credit Card', 'total': '\$800'},
      {'saleId': '#SAL0012', 'date': '01 Nov 2025', 'category': 'Burgers', 'itemsSold': '24', 'totalOrders': '34', 'method': 'Cash', 'total': '\$750'},
      {'saleId': '#SAL0010', 'date': '01 Nov 2025', 'category': 'Ice Cream', 'itemsSold': '36', 'totalOrders': '40', 'method': 'PayPal', 'total': '\$1300'},
      {'saleId': '#SAL0009', 'date': '31 Oct 2025', 'category': 'Pasta', 'itemsSold': '48', 'totalOrders': '55', 'method': 'Cash', 'total': '\$1100'},
      {'saleId': '#SAL0008', 'date': '31 Oct 2025', 'category': 'Beverages', 'itemsSold': '32', 'totalOrders': '35', 'method': 'Credit Card', 'total': '\$600'},
      {'saleId': '#SAL0007', 'date': '31 Oct 2025', 'category': 'Steaks', 'itemsSold': '22', 'totalOrders': '27', 'method': 'Cash', 'total': '\$1300'},
      {'saleId': '#SAL0006', 'date': '31 Oct 2025', 'category': 'Soups', 'itemsSold': '18', 'totalOrders': '22', 'method': 'Cash', 'total': '\$800'},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Sale ID')),
          DataColumn(label: Text('Date')),
          DataColumn(label: Text('Category')),
          DataColumn(label: Text('Items Sold')),
          DataColumn(label: Text('Total Orders')),
          DataColumn(label: Text('Payment Method')),
          DataColumn(label: Text('Grand Total')),
          DataColumn(label: Text('Status')),
        ],
        rows: salesData.map((row) {
          return DataRow(cells: [
            DataCell(Text(row['saleId']!)),
            DataCell(Text(row['date']!)),
            DataCell(Text(row['category']!)),
            DataCell(Text(row['itemsSold']!)),
            DataCell(Text(row['totalOrders']!)),
            DataCell(Text(row['method']!)),
            DataCell(Text(row['total']!)),
            DataCell(
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text('Completed', style: TextStyle(color: Colors.green, fontSize: 12)),
              ),
            ),
          ]);
        }).toList(),
      ),
    );
  }
}

// Customer Report Tab
class CustomerReportTab extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;
  final Function(DateTime) onStartDateChanged;
  final Function(DateTime) onEndDateChanged;

  const CustomerReportTab({
    Key? key,
    required this.startDate,
    required this.endDate,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildFilterSection(context),
          _buildCustomerTable(),
        ],
      ),
    );
  }

  Widget _buildFilterSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: _buildDateField('Start Date', startDate, onStartDateChanged, context),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildDateField('End Date', endDate, onEndDateChanged, context),
          ),
          const SizedBox(width: 12),
          Expanded(child: Container()),
          const SizedBox(width: 12),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0052CC),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Submit', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateField(String label, DateTime date, Function(DateTime) onChanged, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12)),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(2020),
              lastDate: DateTime.now(),
            );
            if (picked != null) {
              onChanged(picked);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(DateFormat('dd/MM/yyyy').format(date), style: const TextStyle(fontSize: 12)),
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCustomerTable() {
    final customerData = [
      {'custId': '#CUS0016', 'customer': 'Walk-in Customer', 'totalOrders': '32', 'total': '\$3000'},
      {'custId': '#CUS0015', 'customer': 'Sue Allen', 'totalOrders': '45', 'total': '\$5500'},
      {'custId': '#CUS0014', 'customer': 'Frank Barrett', 'totalOrders': '70', 'total': '\$9200'},
      {'custId': '#CUS0013', 'customer': 'Kelley Davis', 'totalOrders': '53', 'total': '\$8000'},
      {'custId': '#CUS0012', 'customer': 'Jim Vickers', 'totalOrders': '34', 'total': '\$7500'},
      {'custId': '#CUS0010', 'customer': 'Nancy Chapman', 'totalOrders': '40', 'total': '\$9300'},
      {'custId': '#CUS0009', 'customer': 'Ron Jude', 'totalOrders': '55', 'total': '\$9700'},
      {'custId': '#CUS0008', 'customer': 'Andrea Aporte', 'totalOrders': '35', 'total': '\$6800'},
      {'custId': '#CUS0007', 'customer': 'David Belcher', 'totalOrders': '27', 'total': '\$9300'},
      {'custId': '#CUS0006', 'customer': 'Julie Kangas', 'totalOrders': '22', 'total': '\$8200'},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Customer ID')),
          DataColumn(label: Text('Customer')),
          DataColumn(label: Text('Total Orders')),
          DataColumn(label: Text('Grand Total')),
        ],
        rows: customerData.map((row) {
          return DataRow(cells: [
            DataCell(Text(row['custId']!)),
            DataCell(
              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.grey.shade300,
                    child: Text(row['customer']!.substring(0, 1), style: const TextStyle(fontSize: 12)),
                  ),
                  const SizedBox(width: 8),
                  Text(row['customer']!, style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
            DataCell(Text(row['totalOrders']!)),
            DataCell(Text(row['total']!)),
          ]);
        }).toList(),
      ),
    );
  }
}

// Audit Logs Tab
class AuditLogsTab extends StatelessWidget {
  const AuditLogsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildAuditLogItem(
            'Sale Created by David Williams (Cashier) at POS Terminal',
            '12 Nov 2025 at 09:43 AM',
            Icons.shopping_cart,
          ),
          const SizedBox(height: 16),
          _buildAuditLogItem(
            'Product Updated by Emily Johnson (Supervisor) in Inventory',
            '12 Nov 2025 at 10:15 AM',
            Icons.inventory,
          ),
          const SizedBox(height: 16),
          _buildAuditLogItem(
            'User Added by John Smith (Admin) in Settings',
            '12 Nov 2025 at 11:00 AM',
            Icons.person_add,
          ),
          const SizedBox(height: 16),
          _buildAuditLogItem(
            'Discount Applied by Alex Martinez (Cashier) in POS Terminal',
            '12 Nov 2025 at 12:25 PM',
            Icons.discount,
          ),
          const SizedBox(height: 16),
          _buildAuditLogItem(
            'Product Deleted by Emily Johnson (Supervisor) in Inventory',
            '12 Nov 2025 at 12:30 PM',
            Icons.delete,
          ),
          const SizedBox(height: 16),
          _buildAuditLogItem(
            'Sale Voided by Alex Martinez (Cashier) at POS Terminal',
            '12 Nov 2025 at 01:45 PM',
            Icons.undo,
          ),
          const SizedBox(height: 16),
          _buildAuditLogItem(
            'Refund Issued by Emily Johnson (Supervisor) in Sales',
            '12 Nov 2025 at 02:00 PM',
            Icons.receipt,
          ),
          const SizedBox(height: 16),
          _buildAuditLogItem(
            'Login Attempt (Failed) by John Smith (Admin) in Dashboard',
            '12 Nov 2025 at 02:20 PM',
            Icons.warning,
          ),
          const SizedBox(height: 16),
          _buildAuditLogItem(
            'Sale Deleted by David Williams (Cashier) in POS Terminal',
            '12 Nov 2025 at 02:30 PM',
            Icons.delete_forever,
          ),
          const SizedBox(height: 16),
          _buildAuditLogItem(
            'Sale Created by David Williams (Cashier) at POS Terminal',
            '12 Nov 2025 at 02:35 PM',
            Icons.shopping_cart,
          ),
        ],
      ),
    );
  }

  Widget _buildAuditLogItem(String title, String timestamp, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Colors.grey.shade300, width: 3)),
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey.shade600),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(timestamp, style: TextStyle(
                    fontSize: 10, color: Colors.grey.shade600)),
              ],
            ),
          ),
        ],
      ),
    );
  }

}


 */


/*
//categories
class AddOnsScreen extends StatefulWidget {
  const AddOnsScreen({Key? key}) : super(key: key);

  @override
  State<AddOnsScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<AddOnsScreen> {
  int currentPage = 1;

  final List<CategoryItem> categories = [
    CategoryItem('Sea Food', 28, 'February 15, 2025', 'Active', '🦐'),
    CategoryItem('Pizza', 42, 'March 10, 2025', 'Active', '🍕'),
    CategoryItem('Salads', 66, 'April 5, 2025', 'Active', '🥗'),
    CategoryItem('Tacos', 48, 'May 20, 2025', 'Expired', '🌮'),
    CategoryItem('Burgers', 24, 'June 30, 2025', 'Active', '🍔'),
    CategoryItem('Ice Cream', 36, 'July 18, 2025', 'Active', '🍦'),
    CategoryItem('Pasta', 48, 'August 12, 2025', 'Active', '🍝'),
    CategoryItem('Beverages', 32, 'September 19, 2025', 'Active', '🥤'),
    CategoryItem('Steaks', 22, 'October 7, 2025', 'Expired', '🥩'),
    CategoryItem('Soups', 18, 'November 25, 2025', 'Active', '🍲'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Categories',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.download, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Icon(Icons.add, color: Colors.white, size: 18),
                    SizedBox(width: 6),
                    Text(
                      'Add New',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search and Filter Row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list, color: Colors.grey),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.grid_3x3, color: Colors.grey),
                ),
                PopupMenuButton(
                  onSelected: (value) {},
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'newest',
                      child: Text('Newest'),
                    ),
                    const PopupMenuItem(
                      value: 'oldest',
                      child: Text('Oldest'),
                    ),
                  ],
                  child: const Row(
                    children: [
                      Text('Sort by: Newest', style: TextStyle(fontSize: 12)),
                      Icon(Icons.arrow_drop_down, size: 20),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Table Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[300]!),
                ),
              ),
              child: const Row(
                children: [
                  Expanded(flex: 2, child: Text('Category', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13))),
                  Expanded(flex: 1, child: Text('No of Items', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13))),
                  Expanded(flex: 2, child: Text('Created On', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13))),
                  Expanded(flex: 1, child: Text('Status', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13))),
                  Expanded(flex: 1, child: Text('Actions', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13))),
                ],
              ),
            ),
            // Table Rows
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final item = categories[index];
                  return CategoryRow(item: item);
                },
              ),
            ),
            // Pagination Footer
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey[300]!),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text('10 Entries', style: TextStyle(fontSize: 12)),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_drop_down, size: 20),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.chevron_left, size: 20),
                      ),
                      const Text('Pro', style: TextStyle(fontSize: 12)),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text('1', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
                      ),
                      const SizedBox(width: 8),
                      const Text('2', style: TextStyle(fontSize: 12)),
                      const SizedBox(width: 8),
                      const Text('3', style: TextStyle(fontSize: 12)),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.chevron_right, size: 20),
                      ),
                      const Text('Next', style: TextStyle(fontSize: 12)),
                      const SizedBox(width: 8),
                      const Icon(Icons.chevron_right, size: 20),
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

class CategoryItem {
  final String name;
  final int items;
  final String createdOn;
  final String status;
  final String emoji;

  CategoryItem(this.name, this.items, this.createdOn, this.status, this.emoji);
}

class CategoryRow extends StatelessWidget {
  final CategoryItem item;

  const CategoryRow({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Text(item.emoji, style: const TextStyle(fontSize: 24)),
                const SizedBox(width: 10),
                Text(item.name, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(item.items.toString(), style: const TextStyle(fontSize: 13)),
          ),
          Expanded(
            flex: 2,
            child: Text(item.createdOn, style: const TextStyle(fontSize: 13, color: Colors.grey)),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: item.status == 'Active' ? Colors.green[50] : Colors.red[50],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                item.status,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: item.status == 'Active' ? Colors.green : Colors.red,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit, size: 18, color: Colors.grey),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete, size: 18, color: Colors.grey),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

*/


class AddOnsScreen extends StatefulWidget {
  const AddOnsScreen({super.key});

  @override
  State<AddOnsScreen> createState() => _AddOnsScreenState();
}

class _AddOnsScreenState extends State<AddOnsScreen> {
  DashboardItem? selectedDashboardMenu = DashboardItem(title: 'All Items');
  final dashboardMenuitems = [
    DashboardItem(title: 'All Items'),
    DashboardItem(title: 'Sea Food'),
    DashboardItem(title: 'Pizza'),
    DashboardItem(title: 'Salads'),
  ];


  final List<FoodItem> foodItems = List.generate(
    28,
        (i) => FoodItem(
      name: 'Food Item $i',
      imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd',
      orders: i,
      isVegetarian: i % 2 == 0,
      category: i % 2 == 0 ? 'veg' : 'non-veg',
    ),
  );


  final googleKey = GlobalKey<State<StatefulWidget>>();

  final TextEditingController _searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(height: 20,),
        SubHeaderTopWidget(
        title: 'Items',
        headerIcon: AppAssets.refreshMainIcon,
        onHeaderIconTap: () {
          // refresh logic
        },
        searchController: _searchController,
        onSearchChanged: (value) {
          // search logic
        },
        buttonKey: googleKey,
        buttonText: 'Add New',
        onButtonPressed: () {
          // add new logic
        },
        buttonIcon: SvgPicture.asset(
          AppAssets.plusIcon,
          width: 20,
          height: 20,
        ),
      ),

      Row(
          children: [
            Expanded(
              child: TrendingGridSection<DashboardItem>(
                title: 'Trending Menus',
                isHeader: false,
      
                selectedValue: selectedDashboardMenu,
                dropdownItems: dashboardMenuitems,
                onDropdownChanged: (v) {
                  setState(() => selectedDashboardMenu = v);
                },
                padding: EdgeInsets.only(top: 20),
                innerPadding: EdgeInsets.zero,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
      
                crossAxisCount: ResponsiveTwo.gridCount(
                  context,
                ),
                childAspectRatio: ResponsiveTwo.gridAspectItems(
                  context,
                ),
                crossAxisSpacing: ResponsiveTwo.gridSpacing(
                  context,
                ),
                mainAxisSpacing: ResponsiveTwo.gridSpacing(
                  context,
                ),
      
                dropdownChildBuilder: (item) => Row(
                  children: [
                    Text(item?.title ?? ''),
                    const Icon(Icons.keyboard_arrow_down),
                  ],
                ),
      
                dropdownItemBuilder: (item, _) => Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(item?.title ?? ''),
                ),
      
                itemCount: foodItems.length,
                itemBuilder: (_, i) => FoodCard(item: foodItems[i], isCart: false,isSwapTitle: true,),
              ),
            ),
          ],
        ),
      ],),
    );
  }
}



