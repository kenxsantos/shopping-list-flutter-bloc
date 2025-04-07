import 'package:dartactivity/shopping/bloc/shopping_bloc.dart';
import 'package:dartactivity/shopping/bloc/shopping_state.dart';
import 'package:dartactivity/shopping/widgets/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
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
            final items = state.items.where((item) => item.isFavorite).toList();
            if (items.isEmpty) {
              return Center(child: Text('No items in the favorites.'));
            } else {
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  print(item.name);
                  if (item.isFavorite) {
                    return Card(
                      child: ItemTile(
                        id: item.id,
                        name: item.name,
                        tag: item.tag,
                        isFavorite: item.isFavorite,
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
              );
            }
          } else if (state is ShoppingListFiltered) {
            final items =
                state.filteredItems.where((item) => item.isFavorite).toList();
            if (items.isEmpty) {
              return Center(child: Text('No items in the favorites.'));
            } else {
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  print(item.name);
                  if (item.isFavorite) {
                    return Card(
                      child: ItemTile(
                        id: item.id,
                        name: item.name,
                        tag: item.tag,
                        isFavorite: item.isFavorite,
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
              );
            }
          }
          return Center(child: Text('No items in the favorites.'));
        },
      ),
    );
  }
}
