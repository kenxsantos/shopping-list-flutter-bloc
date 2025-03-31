import 'package:dartactivity/shopping/bloc/shopping_bloc.dart';
import 'package:dartactivity/shopping/bloc/shopping_event.dart';
import 'package:dartactivity/shopping/bloc/shopping_state.dart';
import 'package:dartactivity/shopping/models/shopping_model.dart';
import 'package:dartactivity/shopping/widgets/item_add_dialog.dart';
import 'package:dartactivity/shopping/widgets/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingHome extends StatefulWidget {
  const ShoppingHome({super.key});

  @override
  State<ShoppingHome> createState() => _ShoppingHomeState();
}

class _ShoppingHomeState extends State<ShoppingHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping List"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        height: 80,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        color: Colors.grey[800],
        child: Padding(padding: const EdgeInsets.all(8)),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.orange,
        onPressed: () {
          showDialog(
            context: context,
            builder:
                (context) => ItemDialog(
                  onSubmit: (stringValue) {
                    final newItem = ShoppingModel(
                      id: DateTime.now().toString(),
                      name: stringValue,
                    );
                    context.read<ShoppingBloc>().add(ShoppingAddItem(newItem));
                    Navigator.of(context).pop();
                  },
                ),
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        padding: EdgeInsets.all(16.0),
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
                    return Card(child: ItemTile(id: item.id, name: item.name));
                  },
                );
              }
            }
            return Center(child: Text('No items in the list.'));
          },
        ),
      ),
    );
  }
}
