import 'package:flutter/material.dart';

// Model for Order Items
class OrderItem {
  final String name;
  final int quantity;
  final String? notes;
  final bool isVeg;

  OrderItem({
    required this.name,
    required this.quantity,
    this.notes,
    this.isVeg = true,
  });
}

// Model for Order Card
class KdsOrder {
  final String customerName;
  final String orderType;
  final String tokenNumber;
  final String orderId;
  final DateTime orderTime;
  final List<OrderItem> items;
  final Duration totalTime;
  final Duration? elapsedTime;
  final OrderStatus status;
  final Color statusColor;

  KdsOrder({
    required this.customerName,
    required this.orderType,
    required this.tokenNumber,
    required this.orderId,
    required this.orderTime,
    required this.items,
    required this.totalTime,
    this.elapsedTime,
    required this.status,
    required this.statusColor,
  });
}

enum OrderStatus {
  notStarted,
  inProgress,
  delayed,
  completed,
}

// Main KDS Order Card Widget
class KdsOrderCard extends StatelessWidget {
  final KdsOrder order;
  final VoidCallback? onStart;
  final VoidCallback? onPause;
  final VoidCallback? onMarkDone;
  final VoidCallback? onPrintOrder;

  const KdsOrderCard({
    super.key,
    required this.order,
    this.onStart,
    this.onPause,
    this.onMarkDone,
    this.onPrintOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade200),
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
          _buildHeader(),
          _buildOrderInfo(),
          _buildItemsList(),
          _buildProgressBar(),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: order.statusColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(6),
          topRight: Radius.circular(6),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.restaurant_menu,
              color: Colors.black87,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.customerName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  order.orderType,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              order.orderId,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderInfo() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text(
                'Token No : ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
              Text(
                order.tokenNumber,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          Text(
            _formatDateTime(order.orderTime),
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemsList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: order.items.map((item) => _buildOrderItem(item)).toList(),
      ),
    );
  }

  Widget _buildOrderItem(OrderItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: item.isVeg ? Colors.green : Colors.red,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Center(
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: item.isVeg ? Colors.green : Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
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
          if (item.notes != null)
            Padding(
              padding: const EdgeInsets.only(left: 26, top: 4),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    size: 14,
                    color: Colors.black54,
                  ),
                  const SizedBox(width: 4),
                  SizedBox(
                    width: 190,
                    child: Text(
                      'Notes : ${item.notes}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    final progress = order.elapsedTime != null
        ? (order.elapsedTime!.inSeconds / order.totalTime.inSeconds).clamp(0.0, 1.0)
        : 0.0;

    String statusText = '';
    Color statusTextColor = Colors.black87;

    if (order.status == OrderStatus.delayed) {
      final delayedBy = order.elapsedTime!.inMinutes - order.totalTime.inMinutes;
      statusText = '⏰ Delayed By $delayedBy Mins';
      statusTextColor = Colors.red;
    } else if (order.status == OrderStatus.completed) {
      final servedBefore = order.totalTime.inMinutes - order.elapsedTime!.inMinutes;
      statusText = '✓ ${order.elapsedTime!.inMinutes}:${(order.elapsedTime!.inSeconds % 60).toString().padLeft(2, '0')} Mins - Served Before $servedBefore Mins';
      statusTextColor = Colors.green;
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          if (statusText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                statusText,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: statusTextColor,
                ),
              ),
            ),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      order.status == OrderStatus.delayed
                          ? Colors.red
                          : order.status == OrderStatus.completed
                          ? Colors.green
                          : order.statusColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 16, color: Colors.black54),
                  const SizedBox(width: 4),
                  Text(
                    '${order.totalTime.inMinutes}:${(order.totalTime.inSeconds % 60).toString().padLeft(2, '0')}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
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

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          if (order.status == OrderStatus.notStarted)
            Expanded(
              child: _buildButton(
                onPressed: onStart,
                icon: Icons.play_arrow,
                label: 'Start ${order.elapsedTime?.inMinutes.toString().padLeft(2, '0') ?? '00'}:${((order.elapsedTime?.inSeconds ?? 0) % 60).toString().padLeft(2, '0')}',
                isPrimary: false,
              ),
            )
          else if (order.status == OrderStatus.inProgress || order.status == OrderStatus.delayed)
            Expanded(
              child: _buildButton(
                onPressed: onPause,
                icon: Icons.pause,
                label: 'Pause ${order.elapsedTime?.inMinutes.toString().padLeft(2, '0') ?? '00'}:${((order.elapsedTime?.inSeconds ?? 0) % 60).toString().padLeft(2, '0')}',
                isPrimary: false,
              ),
            )
          else
            Expanded(
              child: _buildButton(
                onPressed: onPrintOrder,
                icon: Icons.print,
                label: 'Print Order',
                isPrimary: false,
              ),
            ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildButton(
              onPressed: onMarkDone,
              icon: Icons.check,
              label: 'Mark Done',
              isPrimary: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required VoidCallback? onPressed,
    required IconData icon,
    required String label,
    required bool isPrimary,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? Colors.black87 : Colors.white,
        foregroundColor: isPrimary ? Colors.white : Colors.black87,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: isPrimary ? Colors.transparent : Colors.grey.shade300,
          ),
        ),
      ),
      icon: Icon(icon, size: 18),
      label: Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    final day = dateTime.day;
    final month = months[dateTime.month - 1];
    final year = dateTime.year;
    final hour = dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = dateTime.hour >= 12 ? 'PM' : 'AM';

    return '$day $month $year, ${hour.toString().padLeft(2, '0')}:$minute $period';
  }
}

