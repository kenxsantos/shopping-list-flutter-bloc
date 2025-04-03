import 'package:dartactivity/shopping/repositories/sorting_repository.dart';
import 'package:dartactivity/shopping/widgets/icon_text_button.dart';
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
          IconTextButton(
            onTap: () {
              SortingRepository().showSortMenu(context);
            },
            label: "Sort",
            icon: Icons.swap_vert,
            size: 18,
            iconColor: Colors.black,
          ),
          IconTextButton(
            onTap: () {
              SortingRepository().showFilterMenu(context);
            },
            label: "Filter",
            icon: Icons.filter_alt,
            size: 18,
            iconColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
