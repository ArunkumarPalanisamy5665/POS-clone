import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/core/constants/app_export.dart';

class OrderStatusCardOne extends StatelessWidget {
  final List<OrderCard> orderCards;
  final ScrollController controller;
  const OrderStatusCardOne({Key? key, required this.orderCards, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(0),
          child: SizedBox(
            height: 122,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                scrollbars: false,
              ),
              child: ListView.builder(
                controller: controller,
                scrollDirection: Axis.horizontal,
                primary: false,
                physics: const ClampingScrollPhysics(),
                itemCount: orderCards.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: OrderCard(
                      orderId: orderCards[index].orderId,
                      customerName: orderCards[index].customerName,
                      time: orderCards[index].time,
                      type: orderCards[index].type,
                      eta: orderCards[index].eta,
                      progress: orderCards[index].progress,
                      totalTime: orderCards[index].totalTime,
                      isLate: orderCards[index].isLate,
                    ),
                  );
                },
              ),
            ),
          ),
        ),

      ],
    );
  }
}

class OrderCard extends StatelessWidget {
  final String orderId;
  final String customerName;
  final String time;
  final String type;
  final String eta;
  final double progress;
  final String totalTime;
  final bool isLate;

  const OrderCard({
    Key? key,
    required this.orderId,
    required this.customerName,
    required this.time,
    required this.type,
    required this.eta,
    required this.progress,
    required this.totalTime,
    this.isLate = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: 254,
      borderRadius: BorderRadius.circular(6),
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                orderId,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF666666),
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.check_circle, size: 16, color: Colors.green),
                  const SizedBox(width: 4),
                  Text(
                    type,
                    style:Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),

                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Customer Name
          Text(
            customerName,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          // Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                time,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF666666),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox.shrink(),
                    Row(
                      children: [
                        Container(
                          width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Icon(Icons.access_time, size: 14, color: Colors.black)),
                        const SizedBox(width: 4),
                        Text(
                          totalTime,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 12),
          // ETA Badge and Progress
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Progress Bar
              Expanded(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 4,
                        backgroundColor: const Color(0xFFE0E0E0),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF4CAF50),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // ETA Chip
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.schedule,
                    size: 12,
                    color: Color(0xFF999999),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    eta,
                    style:  Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF999999),
                    ),
                  ),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}