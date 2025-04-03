import 'package:dartactivity/shopping/repositories/action_repository.dart';
import 'package:dartactivity/shopping/widgets/icon_text_button.dart';
import 'package:flutter/material.dart';

class SortFilterContainer extends StatefulWidget {
  const SortFilterContainer({super.key});

  @override
  State<SortFilterContainer> createState() => _SortFilterContainerState();
}

class _SortFilterContainerState extends State<SortFilterContainer> {
  String sortLabel = "Sort";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconTextButton(
                onTap: () {
                  ActionRepository().showPrintMenu(context);
                },
                label: "Print",
                icon: Icons.print,
                size: 18,
                iconColor: Colors.black,
              ),
            ],
          ),
          Row(
            children: [
              IconTextButton(
                onTap: () {
                  ActionRepository().showSortMenu(context, (selectedValue) {
                    if (selectedValue == 'name') {
                      setState(() {
                        sortLabel = "Name";
                      });
                    } else if (selectedValue == 'date') {
                      setState(() {
                        sortLabel = "Date";
                      });
                      print("Sorting by date");
                    }
                  });
                },
                label: sortLabel,
                icon: Icons.swap_vert,
                size: 18,
                iconColor: Colors.black,
              ),
              IconTextButton(
                onTap: () {
                  ActionRepository().showFilterMenu(context);
                },
                label: "Filter",
                icon: Icons.filter_alt,
                size: 18,
                iconColor: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
