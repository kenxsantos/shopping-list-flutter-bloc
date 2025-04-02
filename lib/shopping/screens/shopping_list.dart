import 'package:dartactivity/shopping/bloc/shopping_bloc.dart';
import 'package:dartactivity/shopping/bloc/shopping_state.dart';
import 'package:dartactivity/shopping/widgets/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({super.key});

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: BlocBuilder<ShoppingBloc, ShoppingState>(
        builder: (context, state) {
          if (state is ShoppingListLoaded) {
            final items = state.items;
            if (items.isEmpty) {
              return Center(child: Text('No items in the list.'));
            } else {
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    child: ItemTile(
                      id: item.id,
                      name: item.name,
                      tag: item.tag,
                    ),
                  );
                },
              );
            }
          }
          return Center(child: Text('No items in the list.'));
        },
      ),
    );
  }
}
