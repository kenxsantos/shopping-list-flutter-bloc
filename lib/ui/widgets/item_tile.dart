import 'package:dartactivity/repository/models/shopping_model.dart';
import 'package:dartactivity/ui/pages/favorite/widgets/all_list_favorites/bloc/favorite_bloc.dart';
import 'package:dartactivity/ui/pages/home/widgets/list_by_category_widget/bloc/list_by_category_bloc.dart';
import 'package:dartactivity/ui/widgets/item_delete_dialog.dart';
import 'package:dartactivity/ui/widgets/item_edit_dialog.dart';
import 'package:dartactivity/ui/widgets/snackbar.dart';
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
              setState(() {
                widget.isFavorite = !widget.isFavorite;
              });
              final updateFavorite = ShoppingModel(
                id: widget.id,
                name: widget.name,
                tag: widget.tag,
                isFavorite: widget.isFavorite,
              );
              context.read<ListByCategoryBloc>().add(
                ShoppingUpdateItem(item: updateFavorite),
              );
              context.read<FavoriteBloc>().add(GetAllFavoritesEvent());
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
              context.read<ListByCategoryBloc>().add(
                ShoppingUpdateItem(item: updatedItem),
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
              final deletedItem = ShoppingModel(
                id: widget.id,
                name: widget.name,
                tag: widget.tag,
                isFavorite: widget.isFavorite,
              );
              context.read<ListByCategoryBloc>().add(
                ShoppingDeleteItem(id: widget.id, item: deletedItem),
              );
            },
          ),
    );
  }
}
