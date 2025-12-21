import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/views/screens/settings/widgets/add_tax_dialog.dart';

import '../../widgets/appDrawer/custom_drawer.dart';
import '../../widgets/common/custom_container.dart';
import '../../widgets/responsive/responsive.dart';

class Tax {
  final String name;
  final String rate;
  final String type;

  Tax({required this.name, required this.rate, required this.type});
}

class TaxSettingsScreen extends StatefulWidget {
  const TaxSettingsScreen({super.key});

  @override
  State<TaxSettingsScreen> createState() => _TaxSettingsScreenState();
}

class _TaxSettingsScreenState extends State<TaxSettingsScreen> {
  List<Tax> taxes = [
    Tax(name: 'CGST', rate: '9%', type: 'Inclusive / Exclusive'),
    Tax(name: 'SGST', rate: '9%', type: 'Inclusive / Exclusive'),
    Tax(name: 'IGST', rate: '18%', type: 'Inclusive / Exclusive'),
    Tax(name: 'VAT', rate: '10%', type: 'Type'),
    Tax(name: 'Service Tax', rate: '15%', type: 'Exclusive'),
  ];

  void _showAddTaxDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AddTaxDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = Responsive.isMobile(context);

        return CustomDrawer(
          backgroundColor: const Color(0xFFF8F8F8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildTaxSettingsHeaderBar(isMobile),
                      _buildTaxSettingsContent(width, isMobile),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTaxSettingsHeaderBar(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text(
                'Tax Settings',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const SizedBox(width: 10),
              CustomContainer(
                onTap: () {},
                isNeedHover: true,
                padding: const EdgeInsets.all(8),
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/images/refresh_icon.png',
                  height: 16,
                  width: 16,
                ),
              ),
            ],
          ),
          // Add New Button
          ElevatedButton.icon(
            onPressed: _showAddTaxDialog,
            icon: const Icon(Icons.add),
            label: const Text('Add New'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0XFF0D76E1),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaxSettingsContent(double width, bool isMobile) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.grey.shade200,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Table Header
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40,
                        child: Text(
                          '#',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Tax Name',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Rate',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Type',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          'Actions',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Data Rows
                ...List.generate(
                  taxes.length,
                      (index) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey.shade200),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 40,
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            taxes[index].name,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            taxes[index].rate,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            taxes[index].type,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit_outlined),
                                iconSize: 20,
                                color: Colors.grey.shade600,
                                onPressed: () {},
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                              ),
                              const SizedBox(width: 12),
                              IconButton(
                                icon: const Icon(Icons.delete_outline),
                                iconSize: 20,
                                color: Colors.red.shade400,
                                onPressed: () {
                                  setState(() {
                                    taxes.removeAt(index);
                                  });
                                },
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
