// import 'package:flutter/material.dart';
//
// class OrderStatusTab extends StatelessWidget {
//   final int selectedIndex;
//   final Function(int) onTabSelected;
//
//   const OrderStatusTab({
//     Key? key,
//     required this.selectedIndex,
//     required this.onTabSelected,
//   }) : super(key: key);
//
//   final List<Map<String, dynamic>> tabs = const [
//     {'label': 'All Orders', 'count': 48},
//     {'label': 'Pending', 'count': 12},
//     {'label': 'In Progress', 'count': 12},
//     {'label': 'Completed', 'count': 22},
//     {'label': 'Cancelled', 'count': 2},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       padding: const EdgeInsets.all(16),
//       child: Row(
//         children: List.generate(tabs.length, (index) {
//           final isSelected = selectedIndex == index;
//           return Padding(
//             padding: EdgeInsets.only(right: index < tabs.length - 1 ? 12 : 0),
//             child: MouseRegion(
//               cursor:  SystemMouseCursors.click,
//               child: GestureDetector(
//                 onTap: () => onTabSelected(index),
//                 child: Container(
//                   height: 37,
//                   width: 129,
//
//                   decoration: BoxDecoration(
//                     color: isSelected ? const Color(0xFF1E88E5) : Colors.white,
//                     borderRadius: BorderRadius.circular(6),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.05),
//                         blurRadius: 8,
//                         offset: const Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         tabs[index]['label'],
//                         style: TextStyle(
//                           color: isSelected ? Colors.white : Colors.black,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       Text(
//                         '(${tabs[index]['count']})',
//                         style: TextStyle(
//                           color: isSelected ? Colors.white : Colors.black,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//     }
// }

import 'package:flutter/material.dart';

class OrderStatusTab extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;
  final int allOrdersCount;
  final int pendingCount;
  final int inProgressCount;
  final int completedCount;
  final int cancelledCount;

  const OrderStatusTab({
    Key? key,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.allOrdersCount,
    required this.pendingCount,
    required this.inProgressCount,
    required this.completedCount,
    required this.cancelledCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tabs = [
      {'label': 'All Orders', 'count': allOrdersCount},
      {'label': 'Pending', 'count': pendingCount},
      {'label': 'In Progress', 'count': inProgressCount},
      {'label': 'Completed', 'count': completedCount},
      {'label': 'Cancelled', 'count': cancelledCount},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isSelected = selectedIndex == index;
          return Padding(
            padding: EdgeInsets.only(right: index < tabs.length - 1 ? 12 : 0),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => onTabSelected(index),
                child: Container(
                  height: 37,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF1E88E5) : Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        tabs[index]['label'],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '(${tabs[index]['count']})',
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}