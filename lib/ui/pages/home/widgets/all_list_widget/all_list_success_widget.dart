import 'package:dartactivity/ui/pages/home/widgets/all_list_widget/all_list_item_tile.dart';
import 'package:flutter/material.dart';
import 'package:dartactivity/repository/models/shopping_model.dart';

class AllListSuccessWidget extends StatelessWidget {
  final List<ShoppingModel> items;

  const AllListSuccessWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(child: Text('No items found.'));
    }
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          color: Colors.grey[800],
          child: ItemTile(
            name: item.name,
            tag: item.tag,
            isFavorite: item.isFavorite,
          ),
        );
      },
    );
  }
}
