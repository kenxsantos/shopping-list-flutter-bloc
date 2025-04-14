import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemTile extends StatefulWidget {
  ItemTile({
    required this.name,
    required this.tag,
    required this.isFavorite,
    super.key,
  });

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
}
