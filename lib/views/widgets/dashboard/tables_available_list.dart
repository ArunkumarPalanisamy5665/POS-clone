import 'package:flutter/material.dart';

class TableGridView extends StatelessWidget {
  const TableGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Your 3 image paths
    final List<String> tableImages = [
      'assets/images/table1.png',
      'assets/images/table2.png',
      'assets/images/table3.png',
    ];

    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 items per row
        childAspectRatio: 100 / 60, // width / height ratio
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        final imageIndex = index % 3;

        return Image.asset(
          tableImages[imageIndex],
          fit: BoxFit.contain,
        );
      },
    );
  }
}