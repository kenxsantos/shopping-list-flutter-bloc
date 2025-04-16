import 'package:dartactivity/repository/models/shopping_model.dart';
import 'package:dartactivity/ui/widgets/item_tile.dart';
import 'package:flutter/material.dart';

class SearchBarSuccessWidget extends StatelessWidget {
  const SearchBarSuccessWidget({required this.items, super.key});

  final List<ShoppingModel> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Expanded(
        child: Container(
          alignment: Alignment.center,
          child: const Text('No items found.'),
        ),
      );
    }
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            color: Colors.grey[800],
            child: ItemTile(
              id: item.id ?? 0,
              name: item.name,
              tag: item.tag,
              isFavorite: item.isFavorite,
            ),
          );
        },
      ),
    );
  }
}
