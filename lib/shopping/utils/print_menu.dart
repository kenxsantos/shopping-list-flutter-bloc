import 'package:dartactivity/shopping/bloc/shopping_bloc.dart';
import 'package:dartactivity/shopping/bloc/shopping_state.dart';
import 'package:dartactivity/shopping/models/shopping_model.dart';
import 'package:dartactivity/shopping/widgets/item_print_dialog.dart';
import 'package:dartactivity/shopping/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrintMenu {
  Future<void> showPrintMenu(BuildContext context) async {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(0, 130, 0, 0),
      items: _buildMenuItems(),
    ).then((selectedValue) {
      if (selectedValue != null) {
        _handleShoppingList(context, selectedValue);
      }
    });
  }

  /// **Helper method to create menu items dynamically**
  List<PopupMenuEntry<String>> _buildMenuItems() {
    return [
      _buildMenuItem('all', Icons.receipt_long, 'All Items'),
      _buildMenuItem('favorites', Icons.favorite, 'Favorites'),
    ];
  }

  PopupMenuItem<String> _buildMenuItem(
    String value,
    IconData icon,
    String label,
  ) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [Icon(icon, size: 18), SizedBox(width: 5), Text(label)],
      ),
    );
  }

  Future<void> _handleShoppingList(BuildContext context, String type) async {
    final state = context.read<ShoppingBloc>().state;
    final items = _getFilteredItems(state, type);

    items.isNotEmpty
        ? showPrintDialog(context, items, type)
        : _showNoItemsMessage(context, type);
  }

  List<ShoppingModel> _getFilteredItems(ShoppingState state, String type) {
    switch (state) {
      case ShoppingListLoaded():
        return type == 'favorites'
            ? state.items.where((item) => item.isFavorite).toList()
            : state.items;
      case ShoppingListFiltered():
        return type == 'favorites'
            ? state.filteredItems.where((item) => item.isFavorite).toList()
            : state.filteredItems;
      default:
        return [];
    }
  }

  void _showNoItemsMessage(BuildContext context, String type) {
    final message =
        type == 'favorites'
            ? 'No favorite items to print!'
            : 'No items to print!';
    showSnackBarMessage(context, message);
  }
}
