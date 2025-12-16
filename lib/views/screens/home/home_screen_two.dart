import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/core/constants/app_assets.dart';
import 'package:new_hrms_flutter/views/screens/home/widgets/metric_card.dart';
import 'package:new_hrms_flutter/views/screens/home/widgets/revenue_card.dart';
import 'package:new_hrms_flutter/views/screens/home/widgets/side_bar.dart';
import 'package:new_hrms_flutter/views/screens/home/widgets/top_item_widget.dart';

class  HomeScreenTwo extends StatelessWidget {
  const HomeScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Row(
        children: [
           Sidebar(),
          Expanded(
            child: Column(
              children: [
                _buildTopBar(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeader(),
                        const SizedBox(height: 24),
                        // _buildMetricsRow(),
                        const SizedBox(height: 24),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: RevenueChart(),
                            ),
                            const SizedBox(width: 24),
                            const Expanded(
                              child: TopItemsWidget(),
                            ),
                          ],
                        ),
                      ],
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

  Widget _buildTopBar() {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.restaurant,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Streak House',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.expand_more, size: 20),
          const Spacer(),
          _buildTopBarButton(Icons.point_of_sale, 'POS'),
          _buildTopBarButton(Icons.receipt_long, 'Orders'),
          _buildTopBarButton(Icons.kitchen, 'Kitchen'),
          _buildTopBarButton(Icons.event_seat, 'Reservation'),
          _buildTopBarButton(Icons.table_bar, 'Table'),
          const SizedBox(width: 24),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.workspace_premium, size: 18),
            label: const Text('Upgrade'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2196F3),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.dark_mode_outlined),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBarButton(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 18),
        label: Text(label),
        style: TextButton.styleFrom(
          foregroundColor: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 12),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.refresh),
              iconSize: 24,
            ),
          ],
        ),
        Row(
          children: [
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.sync, size: 18),
              label: const Text('Sync Data'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
            const SizedBox(width: 12),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.file_download, size: 18),
              label: const Text('Export'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
            const SizedBox(width: 12),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.calendar_today, size: 18),
              label: const Text('9 Dec 25 - 15 Dec 25'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ],
        ),
      ],
    );
  }

}
