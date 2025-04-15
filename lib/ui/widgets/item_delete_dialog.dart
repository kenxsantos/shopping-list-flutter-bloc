import 'package:dartactivity/ui/widgets/snackbar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DeleteConfirmationDialog extends StatelessWidget {
  final int id;

  final void Function() onDelete;

  const DeleteConfirmationDialog({
    super.key,
    required this.id,
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
            onDelete();
            showSnackBarMessage(context, "Deleted successfully!");
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
