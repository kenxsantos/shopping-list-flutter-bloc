import 'package:dartactivity/ui/widgets/icon_text_button.dart';
import 'package:flutter/material.dart';

class SortFilterContainer extends StatefulWidget {
  const SortFilterContainer({super.key});

  @override
  State<SortFilterContainer> createState() => _SortFilterContainerState();
}

class _SortFilterContainerState extends State<SortFilterContainer> {
  String sortLabel = "Sort";
  String filterLabel = "All Category";
  bool isFiltered = false;

  @override
  void initState() {
    filterLabel == "All Category" ? isFiltered = true : isFiltered = false;
    super.initState();
  }

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
                  // PrintMenu().showPrintMenu(context);
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
                  // SortMenu.showSortMenu(
                  //   context: context,
                  //   onSelected: (selectedValue) {
                  //     setState(() {
                  //       sortLabel =
                  //           selectedValue == 'name'
                  //               ? "Name"
                  //               : selectedValue == "date"
                  //               ? "Date"
                  //               : "Sort";
                  //     });
                  //   },
                  // );
                },
                label: sortLabel,
                icon: Icons.swap_vert,
                size: 18,
                iconColor: Colors.black,
              ),
              IconTextButton(
                onTap: () {
                  // FilterMenu.showFilterMenu(
                  //   context: context,
                  //   onSelected: (selectedValue) {
                  //     setState(() {
                  //       filterLabel = selectedValue;
                  //       filterLabel == "All Category"
                  //           ? isFiltered = true
                  //           : isFiltered = false;
                  //     });
                  //   },
                  // );
                },
                label: filterLabel,
                icon: isFiltered ? Icons.filter_alt_outlined : Icons.filter_alt,
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
