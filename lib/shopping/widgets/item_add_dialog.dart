import 'package:flutter/material.dart';

class ItemDialog extends StatefulWidget {
  final void Function(String) onSubmit;

  const ItemDialog({required this.onSubmit, super.key});

  @override
  State<ItemDialog> createState() => _ItemDialogState();
}

class _ItemDialogState extends State<ItemDialog> {
  final String date = DateTime.now().toString();
  final TextEditingController _itemController = TextEditingController();

  @override
  void dispose() {
    _itemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Shopping List'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(date),
          SizedBox(height: 16),
          TextField(
            controller: _itemController,
            decoration: InputDecoration(labelText: 'Enter an Item'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_itemController.text.isNotEmpty) {
              widget.onSubmit(_itemController.text);
            } else {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Item cannot be empty!')));
            }
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}
