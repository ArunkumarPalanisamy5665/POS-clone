import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/core/constants/app_export.dart';

import '../../widgets/common/custom_button2.dart';
import '../../widgets/common/custom_pagination_widget.dart';
import '../../widgets/common/custom_textfield.dart';
import '../../widgets/common/section_header.dart';

class Table {
  final int id;
  final int floor;
  final int capacity;
  final bool isBooked;
  final Color color;

  Table({
    required this.id,
    required this.floor,
    required this.capacity,
    required this.isBooked,
    required this.color,
  });
}

class TableScreen extends StatefulWidget {
  const TableScreen({Key? key}) : super(key: key);

  @override
  State<TableScreen> createState() => _TablesScreenState();
}

class _TablesScreenState extends State<TableScreen> {
  int currentPage = 1;
  final int itemsPerPage = 16;

  final List<Table> tables = [
    Table(id: 1, floor: 1, capacity: 6, isBooked: false, color: Colors.blue),
    Table(id: 2, floor: 1, capacity: 4, isBooked: false, color: Colors.blue),
    Table(id: 3, floor: 1, capacity: 6, isBooked: true, color: Colors.blue),
    Table(id: 4, floor: 1, capacity: 10, isBooked: true, color: Colors.purple),
    Table(id: 5, floor: 1, capacity: 10, isBooked: true, color: Colors.purple),
    Table(id: 6, floor: 1, capacity: 10, isBooked: false, color: Colors.orange),
    Table(id: 7, floor: 1, capacity: 6, isBooked: false, color: Colors.blue),
    Table(id: 8, floor: 2, capacity: 6, isBooked: true, color: Colors.blue),
    Table(id: 9, floor: 2, capacity: 6, isBooked: false, color: Colors.blue),
    Table(id: 10, floor: 2, capacity: 6, isBooked: true, color: Colors.blue),
    Table(id: 11, floor: 2, capacity: 4, isBooked: false, color: Colors.blue),
    Table(
      id: 12,
      floor: 2,
      capacity: 10,
      isBooked: false,
      color: Colors.orange,
    ),
    Table(id: 13, floor: 3, capacity: 4, isBooked: false, color: Colors.blue),
    Table(
      id: 14,
      floor: 3,
      capacity: 10,
      isBooked: false,
      color: Colors.purple,
    ),
    Table(id: 15, floor: 3, capacity: 4, isBooked: false, color: Colors.blue),
    Table(
      id: 16,
      floor: 3,
      capacity: 10,
      isBooked: false,
      color: Colors.orange,
    ),
  ];

  final googleKey = GlobalKey<State<StatefulWidget>>();

  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final totalPages = (tables.length / itemsPerPage).ceil();
    // final startIndex = (currentPage - 1) * itemsPerPage;
    // final endIndex = (startIndex + itemsPerPage).clamp(0, tables.length);
    // final paginatedTables = tables.sublist(startIndex, endIndex);

    return CustomDrawer(
      backgroundColor: const Color(0xFFF8F8F8),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SectionHeader(
                    title: 'Table',
                    titleStyle: Theme.of(context).textTheme.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 24),
                    iconAsset: AppAssets.refreshMainIcon,
                    onIconTap: () {},
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 200,
                        child: CustomTextField(
                          height: 48,
                          hint: 'Search',
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          controller: _searchController,
                          borderColor: AppColors.grey.withAlpha(
                            (0.3 * 255).toInt(),
                          ),
                          focusColor: AppColors.grey.withAlpha(
                            (0.3 * 255).toInt(),
                          ),
                          cursorColor: Colors.black.withAlpha(
                            (0.7 * 255).toInt(),
                          ),
                          borderWidth: 0.75,
                          fillColor: Colors.white,
                          suffixIcon: Icons.search,
                          iconSize: 14,
                          iconColor: Colors.black,
                          textStyle: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                          isLabel: false,
                        ),
                      ),
                      const SizedBox(width: 12),
        
                      CustomButton2(
                        key: googleKey,
                        onPressed: () {},
                        btnName: 'Add New',
                        isDisable: false,
                        isAnimate: true,
                        isBold: true,
                        buttonHeight: 35,
                        buttonWidth: 130,
                        size: ButtonSize.medium,
                        textSize: 14,
                        textColor: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        buttonColor: AppColors.primaryColor,
                        borderColor: Colors.black.withAlpha(
                          (0.2 * 255).toInt(),
                        ),
                        hideBackground: false,
                        icon: SvgPicture.asset(
                          AppAssets.plusIcon,
                          width: 20,
                          height: 20,
                        ),
                        iconNeed: true,
                        showBorder: false,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
        
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: tables.length,
                itemBuilder: (context, index) {
                  return TableCard(table: tables[index]);
                },
              ),
              SizedBox(height: 10),
              CustomPaginationWidget(
                currentPage: currentPage,
                totalPages: 10,
                onPageChanged: (page) {
                  setState(() => currentPage = page);
        
                },
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

}

class TableCard extends StatelessWidget {
  final Table table;

  const TableCard({Key? key, required this.table}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderRadius: BorderRadius.circular(4),
      decoration: BoxDecoration(
         color: Colors.white,
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomContainer(
                  borderRadius: BorderRadius.circular(8),
                  decoration: const BoxDecoration(
                    color:  AppColors.greySide,
                  ),
                  child: TableVisualization(color: table.color),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Table ${table.id}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.all(2),
                               decoration:  BoxDecoration(
                                 color: table.isBooked ? Colors.red.withOpacity(0.1): AppColors.lightGg,
                                 borderRadius: BorderRadius.circular(4),
                               ),
                              child: Text(
                                table.isBooked ? 'Booked' : 'Available',
                                style: TextStyle(
                                  color: table.isBooked ? Colors.red : Colors.green,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Floor : ${table.floor}st    Capacity : ${table.capacity}',
                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {},
                      constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                      padding: EdgeInsets.zero,
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

class TableVisualization extends StatelessWidget {
  final Color color;

  const TableVisualization({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 60,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: color.withOpacity(0.3), width: 2),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Positioned(top: 10, left: 10, child: _SeatIcon(color: color)),
            Positioned(top: 10, right: 10, child: _SeatIcon(color: color)),
            Positioned(bottom: 10, left: 10, child: _SeatIcon(color: color)),
            Positioned(bottom: 10, right: 10, child: _SeatIcon(color: color)),
          ],
        ),
      ),
    );
  }
}

class _SeatIcon extends StatelessWidget {
  final Color color;

  const _SeatIcon({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 12,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
