import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/core/constants/app_export.dart';
import 'package:new_hrms_flutter/views/widgets/common/custom_button2.dart';

import '../../widgets/common/custom_edit_delete_btn.dart';
import '../../widgets/common/custom_pagination_widget.dart';
import '../../widgets/common/custom_textfield.dart';
import '../../widgets/common/section_header.dart';
import '../../widgets/subHeader/sub_header_top_widget.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationScreen> {
  int currentPage = 1;
  String searchQuery = '';

  final List<Reservation> reservations = [
    Reservation(
      date: 'Nov 8',
      year: '2025',
      name: 'Michael Carter',
      time: '10:45',
      table: 'Table 3',
      guests: 2,
      createdOn: '8 Nov 2025, 2:45PM',
      status: 'Booked',
    ),
    Reservation(
      date: 'Nov 9',
      year: '2025',
      name: 'Jennifer Brooks',
      time: '10:45',
      table: 'Table 8',
      guests: 6,
      createdOn: '9 Nov 2025, 1:30PM',
      status: 'Cancelled',
    ),
    Reservation(
      date: 'Nov 10',
      year: '2025',
      name: 'Christopher Adams',
      time: '10:45',
      table: 'Table 2',
      guests: 3,
      createdOn: '10 Nov 2025, 4:00PM',
      status: 'Paid',
    ),
    Reservation(
      date: 'Nov 9',
      year: '2025',
      name: 'Daniel Mitchell',
      time: '10:45',
      table: 'Table 5',
      guests: 4,
      createdOn: '9 Nov 2025, 2:30PM',
      status: 'Booked',
    ),
    Reservation(
      date: 'Nov 10',
      year: '2025',
      name: 'Emily Parker',
      time: '10:45',
      table: 'Table 2',
      guests: 1,
      createdOn: '10 Nov 2025, 3:15PM',
      status: 'Booked',
    ),
    Reservation(
      date: 'Nov 11',
      year: '2025',
      name: 'Matthew Collins',
      time: '10:45',
      table: 'Table 4',
      guests: 3,
      createdOn: '11 Nov 2025, 4:00PM',
      status: 'Booked',
    ),
    Reservation(
      date: 'Dec 15',
      year: '2025',
      name: 'Jacob Morgan',
      time: '10:45',
      table: 'Table 5',
      guests: 4,
      createdOn: '15 Dec 2025, 3:30PM',
      status: 'Booked',
    ),
    Reservation(
      date: 'Jan 22',
      year: '2025',
      name: 'Olivia Reed',
      time: '10:45',
      table: 'Table 12',
      guests: 8,
      createdOn: '22 Jan 2026, 2:00PM',
      status: 'Booked',
    ),
    Reservation(
      date: 'Feb 28',
      year: '2025',
      name: 'Ethan Sullivan',
      time: '10:45',
      table: 'Table 7',
      guests: 5,
      createdOn: '28 Feb 2026, 4:15PM',
      status: 'Paid',
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
    final double width = MediaQuery.of(context).size.width;
    final int crossAxisCount = width < 700
        ? 1
        : width < 1200
        ? 2
        : 3;




    return CustomDrawer(
      backgroundColor: const Color(0xFFF8F8F8),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SubHeaderTopWidget(
            title: 'Reservations',
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


          GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 230,
                  // childAspectRatio: 1.8,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return ReservationCard(
                    reservation: reservations[index],
                    onEdit: () {},
                    onDelete: () {},
                  );
                },
              ),
              const SizedBox(height: 32),

            CustomPaginationWidget(
              currentPage: currentPage,
              totalPages: 10,
              onPageChanged: (page) {
                setState(() => currentPage = page);

              },
            ),


            const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class ReservationCard extends StatelessWidget {
  final Reservation reservation;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ReservationCard({
    Key? key,
    required this.reservation,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Booked':
        return const Color(0xFF22C55E);
      case 'Cancelled':
        return const Color(0xFFEF4444);
      case 'Paid':
        return const Color(0xFFEC4899);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderRadius: BorderRadius.circular(6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black.withAlpha((0.2 * 255).toInt()), width: 0.30),

      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          reservation.date,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        CustomText(
                          reservation.year,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      reservation.name,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 12,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        CustomText(
                          reservation.time,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                        ),
                        const SizedBox(width: 2),
                        const Icon(
                          Icons.door_sliding,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 2),
                        CustomText(
                          reservation.table,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                        ),
                        const SizedBox(width: 2),
                        const Icon(Icons.people, size: 14, color: Colors.grey),
                        const SizedBox(width: 2),
                        CustomText(
                          'Guests : ${reservation.guests}',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  'Created on',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF475569),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                CustomText(
                  reservation.createdOn,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  'Status',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF475569),
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 6,
                    right: 6,
                    top: 4,
                    bottom: 4,
                  ),
                  decoration:  BoxDecoration(
                    color: _getStatusColor(reservation.status).withValues(alpha: 0.090),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: CustomText(
                    reservation.status,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: _getStatusColor(reservation.status),
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            CustomDivider.dotted(
              thickness: 0.56,
              verticalPadding: 0,
              dotSize: 1.4,
              dotGap: 3,
              color: Colors.black.withAlpha((0.2 * 255).toInt()),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomContainer(
                  width: 90,
                  height: 34,
                  onTap: () {},
                  borderRadius: BorderRadius.circular(6),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black.withAlpha((0.2 * 255).toInt()),
                      width: 0.30,
                    ),
                  ),
                  child: Center(
                    child: CustomText(
                      'View Note',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                CustomEditDeleteBtn(
                  onDelete: (){

                  },
                  onEdit: (){

                  },

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Reservation {
  final String date;
  final String year;
  final String name;
  final String time;
  final String table;
  final int guests;
  final String createdOn;
  final String status;

  Reservation({
    required this.date,
    required this.year,
    required this.name,
    required this.time,
    required this.table,
    required this.guests,
    required this.createdOn,
    required this.status,
  });
}
