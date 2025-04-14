import 'package:dartactivity/repository/models/shopping_model.dart';
import 'package:dartactivity/ui/pages/home/bloc/shopping_bloc.dart';
import 'package:dartactivity/ui/widgets/item_delete_dialog.dart';
import 'package:dartactivity/ui/widgets/item_edit_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ItemTile extends StatefulWidget {
  ItemTile({
    required this.id,
    required this.name,
    required this.tag,
    required this.isFavorite,
    super.key,
  });
  final int id;
  final String name;
  final String tag;
  bool isFavorite;

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(16),
      title: Text(widget.name, style: TextStyle(color: Colors.white)),
      subtitle: Text(
        widget.tag.toString(),
        style: TextStyle(fontSize: 12, color: Colors.green),
      ),

      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              //TODO; Create a favorite item dialog
            },
            icon:
                widget.isFavorite
                    ? Icon(Icons.favorite, color: Colors.white)
                    : Icon(Icons.favorite_border_outlined, color: Colors.white),
          ),

          PopupMenuButton<String>(
            iconColor: Colors.white,
            itemBuilder:
                (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem(
                    onTap: () {
                      //TODO: Create a edit item dialog
                      _showEditDialog(context);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.edit_square, color: Colors.blue),
                        SizedBox(width: 5),
                        Text('Edit'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      //TODO; Create a delete confirmation dialog
                      _showDeleteConfirmation(context);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.delete, color: Colors.red),
                        SizedBox(width: 5),
                        Text('Delete'),
                      ],
                    ),
                  ),
                ],
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
            currentName: widget.name,
            currentTag: widget.tag,
            currentIsFavorite: widget.isFavorite,
            onSave: (newName, newTag, newIsFavorite) {
              final updatedItem = ShoppingModel(
                id: widget.id,
                name: newName,
                tag: newTag,
                isFavorite: newIsFavorite,
              );
              context.read<ShoppingBloc>().add(UpdateItem(item: updatedItem));
            },
          ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => DeleteConfirmationDialog(
            id: widget.id.toString(),
            onDelete: () {
              context.read<ShoppingBloc>().add(
                DeleteItem(item: widget.id.toString()),
              );
            },
          ),
    );
  }
}
