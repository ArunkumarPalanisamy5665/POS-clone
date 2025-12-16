import 'package:flutter/material.dart';

// Model class for reservation data
class Reservation {
  final DateTime date;
  final String customerName;
  final ReservationStatus status;
  final String time;
  final String tableNumber;
  final int guests;

  Reservation({
    required this.date,
    required this.customerName,
    required this.status,
    required this.time,
    required this.tableNumber,
    required this.guests,
  });
}

enum ReservationStatus { booked, paid, cancelled }

// Main Reservations Widget
class ReservationsWidget extends StatelessWidget {
  final List<Reservation> reservations;

  const ReservationsWidget({Key? key, required this.reservations})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: reservations.length,
      itemBuilder: (context, index) {
        return ReservationCard(reservation: reservations[index]);
      },
    );
  }
}

// Individual Reservation Card
class ReservationCard extends StatelessWidget {
  final Reservation reservation;

  const ReservationCard({Key? key, required this.reservation})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          _buildDateBox(),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      reservation.customerName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 10),
                    _buildStatusBadge(),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    _buildInfoItem(Icons.access_time, reservation.time),
                    const SizedBox(width: 12),
                    _buildContainer(),
                    const SizedBox(width: 12),
                    _buildInfoItem(
                      Icons.table_restaurant,
                      'Table ${reservation.tableNumber}',
                    ),
                    const SizedBox(width: 12),
                    _buildContainer(),
                    const SizedBox(width: 12),
                    _buildInfoItem(
                      Icons.people_outline,
                      'Guests : ${reservation.guests}',
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

  Widget _buildContainer() {
    return Container(
      width: 0,
      height: 11,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: const Color(0XFFE2E8F0)),
      ),
    );
  }

  Widget _buildDateBox() {
    final day = reservation.date.day;
    final month = _getMonthAbbreviation(reservation.date.month);
    final year = reservation.date.year;

    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!, width: 2),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0XFFFFA80B),
            Color(0XFF0D76E1),
            Color(0XFF000000),
            Color(0XFF000000),
            Color(0XFF000000),
          ],
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$month $day',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '$year',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge() {
    Color backgroundColor;
    Color textColor;
    String text;

    switch (reservation.status) {
      case ReservationStatus.booked:
        backgroundColor = Colors.green[50]!;
        textColor = Colors.green[700]!;
        text = 'Booked';
        break;
      case ReservationStatus.paid:
        backgroundColor = Colors.purple[50]!;
        textColor = Colors.purple[700]!;
        text = 'Paid';
        break;
      case ReservationStatus.cancelled:
        backgroundColor = Colors.red[50]!;
        textColor = Colors.red[700]!;
        text = 'Cancelled';
        break;
    }

    return Container(
      padding: const EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.black),
        const SizedBox(width: 6),
        Text(text, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
      ],
    );
  }

  String _getMonthAbbreviation(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }
}
