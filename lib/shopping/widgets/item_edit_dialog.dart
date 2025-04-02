import 'package:flutter/material.dart';

class EditDialog extends StatelessWidget {
  final String id;
  final String currentValue;
  final String tag;
  final void Function(String newValue) onSave;

  const EditDialog({
    super.key,
    required this.id,
    required this.tag,
    required this.currentValue,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController _editController = TextEditingController(
      text: currentValue,
    );

    return AlertDialog(
      title: Text('Edit Item'),
      content: TextField(
        controller: _editController,
        decoration: InputDecoration(labelText: 'Enter new value'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_editController.text.isNotEmpty) {
              onSave(_editController.text);
              Navigator.of(context).pop();
            } else {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Value cannot be empty!')));
            }
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
