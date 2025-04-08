import 'package:dartactivity/shopping/widgets/snackbar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DeleteConfirmationDialog extends StatelessWidget {
  final String id;
  String currentName;
  String currentTag;
  bool currentIsFavorite;
  final void Function(String name, String tag, bool isFavorite) onDelete;

  DeleteConfirmationDialog({
    super.key,
    required this.id,
    required this.currentName,
    required this.currentTag,
    required this.currentIsFavorite,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete Item'),
      content: Text('Are you sure you want to delete this item?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          child: Text('Delete', style: TextStyle(color: Colors.white)),
          onPressed: () {
            onDelete(currentName, currentTag, currentIsFavorite);
            showSnackBarMessage(context, "Deleted successfully!");
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
