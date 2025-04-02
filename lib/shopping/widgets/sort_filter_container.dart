import 'package:dartactivity/shopping/repositories/sorting_repository.dart';
import 'package:dartactivity/shopping/widgets/sort_filter_button.dart';
import 'package:flutter/material.dart';

class SortFilterContainer extends StatelessWidget {
  const SortFilterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SortFilterButton(
            onTap: () {
              SortingRepository().showSortMenu(context);
            },
            label: "Sort",
            icon: Icons.swap_vert,
          ),

          SortFilterButton(
            onTap: () {
              // _showFilterMenu(context);
            },
            label: "Filter",
            icon: Icons.filter_alt,
          ),
        ],
      ),
    );
  }
}

// void _showFilterMenu(BuildContext context) {
//   showMenu(
//     context: context,
//     position: RelativeRect.fromLTRB(100, 130, 60, 0),
//     items: [
//       PopupMenuItem(
//         value: 'name',
//         child: Row(
//           children: [
//             Icon(Icons.sort_by_alpha, size: 18),
//             SizedBox(width: 5),
//             Text('Name'),
//           ],
//         ),
//       ),
//       PopupMenuItem(
//         value: 'date',
//         child: Row(
//           children: [
//             Icon(Icons.today, size: 18),
//             SizedBox(width: 5),
//             Text('Date'),
//           ],
//         ),
//       ),
//       PopupMenuItem(
//         value: 'tag',
//         child: Row(
//           children: [
//             Icon(Icons.category, size: 18),
//             SizedBox(width: 5),
//             Text('Tag'),
//           ],
//         ),
//       ),
//     ],
//   );
// }
