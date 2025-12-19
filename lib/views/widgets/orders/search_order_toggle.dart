// import 'package:flutter/material.dart';
// import 'package:new_hrms_flutter/views/widgets/common/custom_textfield.dart';
//
// import '../../../core/constants/app_colors.dart';
//
// class SearchOrderToggle extends StatefulWidget {
//   const SearchOrderToggle({super.key});
//
//   @override
//   State<SearchOrderToggle> createState() => _SearchOrderToggleState();
// }
//
// class _SearchOrderToggleState extends State<SearchOrderToggle> {
//   bool isGridSelected = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 16),
//       child: Row(
//         children: [
//           Container(
//             height: 40,
//             width: 76,
//             padding: const EdgeInsets.all(4),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: Colors.grey.shade200, width: 1),
//             ),
//             child: Row(
//               children: [
//                 _toggleButton(
//                   icon: Icons.grid_view,
//                   selected: isGridSelected,
//                   onTap: () => setState(() => isGridSelected = true),
//                 ),
//                 _toggleButton(
//                   icon: Icons.view_agenda_outlined,
//                   selected: !isGridSelected,
//                   onTap: () => setState(() => isGridSelected = false),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 12),
//           SizedBox(
//             width: 200,
//             child: CustomTextField(
//               height: 48,
//               hint: 'Search',
//               hintStyle: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                 color: Colors.grey
//               ),
//               controller: TextEditingController(),
//               borderColor: AppColors.grey.withAlpha((0.3 * 255).toInt()),
//               focusColor: AppColors.grey.withAlpha((0.3 * 255).toInt()),
//               cursorColor: Colors.black.withAlpha((0.7 * 255).toInt()),
//               borderWidth: 0.75,
//               fillColor: Colors.white,
//               suffixIcon: Icons.search,
//               iconSize: 14,
//               iconColor: Colors.black,
//               textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.white10,
//               ),
// isLabel: false,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _toggleButton({
//     required IconData icon,
//     required bool selected,
//     required VoidCallback onTap,
//   }) {
//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           width: 32,
//           height: 32,
//           decoration: BoxDecoration(
//             color: selected ? const Color(0xFF1E88E5) : Colors.transparent,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Icon(
//             icon,
//             size: 16,
//             color: selected ? Colors.white : Colors.black54,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//

import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/views/widgets/common/custom_textfield.dart';

import '../../../core/constants/app_colors.dart';

class SearchOrderToggle extends StatefulWidget {
  final ValueChanged<bool> onViewChanged;

  const SearchOrderToggle({
    super.key,
    required this.onViewChanged,
  });

  @override
  State<SearchOrderToggle> createState() => _SearchOrderToggleState();
}

class _SearchOrderToggleState extends State<SearchOrderToggle> {
  bool isGridSelected = true;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 76,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200, width: 1),
            ),
            child: Row(
              children: [
                _toggleButton(
                  icon: Icons.grid_view,
                  selected: isGridSelected,
                  onTap: () {
                    setState(() => isGridSelected = true);
                    widget.onViewChanged(true);
                  },
                ),
                _toggleButton(
                  icon: Icons.view_agenda_outlined,
                  selected: !isGridSelected,
                  onTap: () {
                    setState(() => isGridSelected = false);
                    widget.onViewChanged(false);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
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
              borderColor: AppColors.grey.withAlpha((0.3 * 255).toInt()),
              focusColor: AppColors.grey.withAlpha((0.3 * 255).toInt()),
              cursorColor: Colors.black.withAlpha((0.7 * 255).toInt()),
              borderWidth: 0.75,
              fillColor: Colors.white,
              suffixIcon: Icons.search,
              iconSize: 14,
              iconColor: Colors.black,
              textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              isLabel: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _toggleButton({
    required IconData icon,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF1E88E5) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 16,
            color: selected ? Colors.white : Colors.black54,
          ),
        ),
      ),
    );
  }
}