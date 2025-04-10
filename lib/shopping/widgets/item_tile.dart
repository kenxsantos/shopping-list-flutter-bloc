import 'package:dartactivity/shopping/bloc/shopping_bloc.dart';
import 'package:dartactivity/shopping/bloc/shopping_event.dart';
import 'package:dartactivity/shopping/models/shopping_model.dart';
import 'package:dartactivity/shopping/widgets/item_delete_dialog.dart';
import 'package:dartactivity/shopping/widgets/item_edit_dialog.dart';
import 'package:dartactivity/shopping/widgets/snackbar.dart';
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

  final String name;
  final String tag;
  final String id;
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
              setState(() {
                widget.isFavorite = !widget.isFavorite;
              });

              final updatedItem = ShoppingModel(
                id: widget.id,
                name: widget.name,
                tag: widget.tag,
                isFavorite: widget.isFavorite,
              );
              context.read<ShoppingBloc>().add(ShoppingUpdateItem(updatedItem));
              showSnackBarMessage(
                context,
                widget.isFavorite
                    ? 'Added to favorites'
                    : 'Remove from favorites',
              );
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
              context.read<ShoppingBloc>().add(ShoppingUpdateItem(updatedItem));
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
            currentName: widget.name,
            currentTag: widget.tag,
            currentIsFavorite: widget.isFavorite,
            onDelete: (name, tag, isFavorite) {
              final deletedItem = ShoppingModel(
                id: widget.id,
                name: name,
                tag: tag,
                isFavorite: isFavorite,
              );
              context.read<ShoppingBloc>().add(ShoppingDeleteItem(deletedItem));
            },
          ),
    );
  }
}
