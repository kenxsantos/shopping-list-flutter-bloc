import 'package:dartactivity/shopping/bloc/shopping_bloc.dart';
import 'package:dartactivity/shopping/bloc/shopping_event.dart';
import 'package:dartactivity/shopping/bloc/shopping_state.dart';
import 'package:dartactivity/shopping/models/shopping_model.dart';
import 'package:dartactivity/shopping/repositories/shopping_repository.dart';
import 'package:dartactivity/shopping/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionRepository {
  Future<void> showSortMenu(
    BuildContext context,
    Function(String selectedValue) onSelected,
  ) async {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        100,
        130,
        60,
        0,
      ), // Adjust position dynamically
      items: [
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
    ).then((selectedValue) {
      if (selectedValue == 'name') {
        context.read<ShoppingBloc>().add(ShoppingSortByName());
        print("Sorting by name");
      } else if (selectedValue == 'date') {
        context.read<ShoppingBloc>().add(ShoppingSortByDate());
        print("Sorting by date");
      } else {
        print("No sorting option selected");
      }
    });
  }

  Future<void> showFilterMenu(BuildContext context) async {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100, 130, 0, 0),
      items: [
        PopupMenuItem(
          value: 'name',
          onTap: () {},
          child: Row(
            children: [
              Icon(Icons.sort_by_alpha, size: 18),
              SizedBox(width: 5),
              Text('Name'),
            ],
          ),
        ),
      ],
    );
  }

  showPrintMenu(BuildContext context) {
    final ShoppingRepository shopping = ShoppingRepository();

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(0, 130, 0, 0),
      items: [
        PopupMenuItem(
          value: 'all',
          child: Row(
            children: [
              Icon(Icons.receipt_long, size: 18),
              SizedBox(width: 5),
              Text('All'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'favorites',
          child: Row(
            children: [
              Icon(Icons.favorite, size: 18),
              SizedBox(width: 5),
              Text('Favorites'),
            ],
          ),
        ),
      ],
    ).then((selectedValue) {
      if (selectedValue == 'all') {
        handleShoppingList(context, shopping.printShoppingList, "all");
      } else if (selectedValue == 'favorites') {
        handleShoppingList(context, shopping.printShoppingList, "favorites");
      }
    });
  }

  Future<void> handleShoppingList(
    BuildContext context,
    Future<void> Function(List<ShoppingModel>, String)
    printShoppingListCallback,
    String type,
  ) async {
    final state = context.read<ShoppingBloc>().state;

    if (state is ShoppingListLoaded) {
      final filteredItems =
          type == "favorites"
              ? state.items.where((item) => item.isFavorite).toList()
              : state.items;

      if (filteredItems.isEmpty) {
        final message =
            type == "favorites" ? 'No favorite items' : 'No list items';
        print(message);
        showSnackBarMessage(context, message);
      } else {
        await printShoppingListCallback(filteredItems, type);
        showSnackBarMessage(context, "Printed $type successfully!");
      }
    } else {
      print('No items available to print.');
    }
  }
}

// PopupMenuItem(
//           value: 'name',
//           onTap: () {
//             context.read<ShoppingBloc>().add(ShoppingSortByName());
//             print("sorting");
//           },
//           child: Row(
//             children: [
//               Icon(Icons.sort_by_alpha, size: 18),
//               SizedBox(width: 5),
//               Text('Name'),
//             ],
//           ),
//         ),
//         PopupMenuItem(
//           value: 'date',
//           onTap: () {
//             context.read<ShoppingBloc>().add(ShoppingSortByDate());
//             print("sorting");
//           },
//           child: Row(
//             children: [
//               Icon(Icons.today, size: 18),
//               SizedBox(width: 5),
//               Text('Date'),
//             ],
//           ),
//         ),
