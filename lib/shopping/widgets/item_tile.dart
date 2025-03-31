import 'package:dartactivity/shopping/bloc/shopping_bloc.dart';
import 'package:dartactivity/shopping/bloc/shopping_event.dart';
import 'package:dartactivity/shopping/widgets/item_delete_dialog.dart';
import 'package:dartactivity/shopping/widgets/item_edit_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemTile extends StatefulWidget {
  const ItemTile({required this.id, required this.name, super.key});

  final String name;
  final String id;

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(16),
      title: Text(widget.name),
      trailing: PopupMenuButton<String>(
        itemBuilder:
            (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem(
                onTap: () {
                  _showEditDialog(context);
                },
                child: Row(
                  children: [
                    Icon(Icons.edit_square, color: Colors.blue),
                    Text('Edit'),
                  ],
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  _showDeleteConfirmation(context);
                },
                child: Row(
                  children: [
                    Icon(Icons.delete, color: Colors.red),
                    Text('Delete'),
                  ],
                ),
              ),
            ],
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => EditDialog(
            id: widget.id,
            currentValue: widget.name,
            onSave: (newValue) {
              context.read<ShoppingBloc>().add(
                ShoppingUpdateItem(widget.id, newValue),
              );
            },
          ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => DeleteConfirmationDialog(
            id: widget.id,
            onDelete: () {
              context.read<ShoppingBloc>().add(ShoppingDeleteItem(widget.id));
            },
          ),
    );
  }
}
