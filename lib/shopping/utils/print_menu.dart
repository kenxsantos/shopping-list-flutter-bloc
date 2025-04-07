import 'package:dartactivity/shopping/bloc/shopping_bloc.dart';
import 'package:dartactivity/shopping/bloc/shopping_state.dart';
import 'package:dartactivity/shopping/widgets/item_print_dialog.dart';
import 'package:dartactivity/shopping/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrintMenu {
  Future<void> showPrintMenu(BuildContext context) async {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(0, 130, 0, 0),
      items: [
        PopupMenuItem(
          value: 'all',
          child: Row(
            children: const [
              Icon(Icons.receipt_long, size: 18),
              SizedBox(width: 5),
              Text('All Items'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'favorites',
          child: Row(
            children: const [
              Icon(Icons.favorite, size: 18),
              SizedBox(width: 5),
              Text('Favorites'),
            ],
          ),
        ),
      ],
    ).then((selectedValue) {
      if (selectedValue == 'all') {
        handleShoppingList(context, 'all');
      } else if (selectedValue == 'favorites') {
        handleShoppingList(context, 'favorites');
      }
    });
  }

  Future<void> handleShoppingList(BuildContext context, String type) async {
    final state = context.read<ShoppingBloc>().state;

    if (state is ShoppingListLoaded) {
      final items =
          type == 'favorites'
              ? state.items.where((item) => item.isFavorite).toList()
              : state.items;

      if (items.isNotEmpty) {
        showPrintDialog(context, items, type);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              type == 'favorites'
                  ? 'No favorite items to print!'
                  : 'No items to print!',
            ),
          ),
        );
      }
    } else {
      showSnackBarMessage(context, "No items available to print!");
    }
  }
}
