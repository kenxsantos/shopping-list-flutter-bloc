import 'package:dartactivity/shopping/bloc/shopping_bloc.dart';
import 'package:dartactivity/shopping/bloc/shopping_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortMenu {
  static Future<void> showSortMenu({
    required BuildContext context,
    required Function(String selectedValue) onSelected,
  }) async {
    final selectedValue = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(100, 130, 60, 0),
      items: [
        PopupMenuItem(
          value: 'default',
          child: Row(
            children: [
              Icon(Icons.sort, size: 18),
              SizedBox(width: 5),
              Text('Default'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'name',
          child: Row(
            children: [
              Icon(Icons.sort_by_alpha, size: 18),
              SizedBox(width: 5),
              Text('Name'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'date',
          child: Row(
            children: [
              Icon(Icons.today, size: 18),
              SizedBox(width: 5),
              Text('Date'),
            ],
          ),
        ),
      ],
    );

    if (selectedValue != null) {
      onSelected(selectedValue);

      if (selectedValue == 'name') {
        context.read<ShoppingBloc>().add(ShoppingSortByName());
        print("Sorting by name");
      } else if (selectedValue == 'date') {
        context.read<ShoppingBloc>().add(ShoppingSortByDate());
        print("Sorting by date");
      } else {
        context.read<ShoppingBloc>().add(ShoppingSortByDate());
        print("Sorting by default");
      }
    }
  }
}
