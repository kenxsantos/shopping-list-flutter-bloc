import 'package:dartactivity/ui/widgets/icon_text_button.dart';
import 'package:dartactivity/utils/sort_menu.dart';
import 'package:flutter/material.dart';

class SortListWidget extends StatefulWidget {
  const SortListWidget({super.key});

  @override
  State<SortListWidget> createState() => _SortListWidgetState();
}

class _SortListWidgetState extends State<SortListWidget> {
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
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconTextButton(
            onTap: () {
              SortMenu.showSortMenu(
                context: context,
                onSelected: (selectedValue) {
                  setState(() {
                    sortLabel =
                        selectedValue == 'name'
                            ? "Name"
                            : selectedValue == "date"
                            ? "Date"
                            : "Sort";
                  });
                },
              );
            },
            label: sortLabel,
            icon: Icons.swap_vert,
            size: 18,
            iconColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
