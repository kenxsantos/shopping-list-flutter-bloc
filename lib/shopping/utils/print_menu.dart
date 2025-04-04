import 'package:dartactivity/shopping/bloc/shopping_bloc.dart';
import 'package:dartactivity/shopping/bloc/shopping_state.dart';
import 'package:dartactivity/shopping/models/shopping_model.dart';
import 'package:dartactivity/shopping/repositories/shopping_repository.dart';
import 'package:dartactivity/shopping/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrintMenu {
  Future<void> showPrintMenu(BuildContext context) async {
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
