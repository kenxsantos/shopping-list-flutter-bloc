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
              SortingRepository().showFilterMenu(context);
            },
            label: "Filter",
            icon: Icons.filter_alt,
          ),
        ],
      ),
    );
  }
}
