import 'package:dartactivity/shopping/bloc/shopping_bloc.dart';
import 'package:dartactivity/shopping/bloc/shopping_event.dart';
import 'package:dartactivity/shopping/utils/enum_tags.dart';
import 'package:dartactivity/shopping/utils/shopping_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterMenu {
  static Future<void> showFilterMenu({
    required BuildContext context,
    required Function(String selectedValue) onSelected,
  }) async {
    final selectedValue = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(100, 130, 0, 0),
      items: [
        PopupMenuItem(
          value: "All Category",
          child: Text('All Category'),
          onTap: () {
            context.read<ShoppingBloc>().add(ShoppingFetchItem());
          },
        ),
        ...GroceryCategory.values.map((category) {
          final items = ShoppingHelper().formatCategory(category);
          return PopupMenuItem<String>(
            value: items,
            onTap: () {
              context.read<ShoppingBloc>().add(ShoppingFilterByCategory(items));
            },
            child: Text(items),
          );
        }),
      ],
    );
    if (selectedValue != null) {
      onSelected(selectedValue);
    }
  }
}
