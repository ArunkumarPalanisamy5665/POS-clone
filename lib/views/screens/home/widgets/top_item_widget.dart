import 'package:flutter/material.dart';

class TopItemsWidget extends StatelessWidget {
  const TopItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.trending_up, size: 24),
                  SizedBox(width: 8),
                  Text(
                    'Top Selling Item',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Text('All'),
                    SizedBox(width: 4),
                    Icon(Icons.keyboard_arrow_down, size: 20),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.green[200]!),
            ),
            child: const Row(
              children: [
                Text(
                  '🔥',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Most Ordered : Veggie Supreme Pizza',
                    style: TextStyle(
                      color: Color(0xFF2E7D32),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildTopItem(
            imagePath: '🍕',
            name: 'Veggie Supreme Pizza',
            orders: 'No of Orders : 520',
          ),
          const SizedBox(height: 20),
          _buildItemBar(
            rank: '#2',
            name: 'Chicken Taco',
            count: '250',
            color: const Color(0xFF2196F3),
            percentage: 0.8,
          ),
          const SizedBox(height: 16),
          _buildItemBar(
            rank: '#3',
            name: 'Grilled Chicken',
            count: '175',
            color: const Color(0xFFFFC107),
            percentage: 0.6,
          ),
          const SizedBox(height: 16),
          _buildItemBar(
            rank: '#4',
            name: 'Lemon Mint Juice',
            count: '160',
            color: const Color(0xFF4CAF50),
            percentage: 0.55,
          ),
        ],
      ),
    );
  }

  Widget _buildTopItem({
    required String imagePath,
    required String name,
    required String orders,
  }) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              imagePath,
              style: const TextStyle(fontSize: 32),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                orders,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItemBar({
    required String rank,
    required String name,
    required String count,
    required Color color,
    required double percentage,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 30,
          child: Text(
            rank,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    count,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: percentage,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                  minHeight: 8,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
