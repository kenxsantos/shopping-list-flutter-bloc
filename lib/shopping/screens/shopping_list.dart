import 'package:dartactivity/shopping/bloc/shopping_bloc.dart';
import 'package:dartactivity/shopping/bloc/shopping_event.dart';
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
  void initState() {
    super.initState();
    context.read<ShoppingBloc>().add(ShoppingFetchItem());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: BlocBuilder<ShoppingBloc, ShoppingState>(
        builder: (context, state) => _buildStateContent(state),
      ),
    );
  }

  Widget _buildStateContent(ShoppingState state) {
    if (state is ShoppingLoadingState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is ShoppingListLoaded) {
      return _buildItemList(state.items);
    } else if (state is ShoppingListFiltered) {
      return _buildItemList(state.filteredItems);
    } else if (state is ShoppingErrorState) {
      return Center(child: Text('Error: ${state.message}'));
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  Widget _buildItemList(List items) {
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
            id: item.id,
            name: item.name,
            tag: item.tag,
            isFavorite: item.isFavorite,
          ),
        );
      },
    );
  }
}
