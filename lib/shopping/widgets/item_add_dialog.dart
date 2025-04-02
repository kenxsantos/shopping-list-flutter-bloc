import 'package:dartactivity/shopping/utils/enum_tags.dart';
import 'package:dartactivity/shopping/utils/shopping_helper.dart';
import 'package:dartactivity/shopping/widgets/grocery_chip.dart';
import 'package:flutter/material.dart';

class ItemDialog extends StatefulWidget {
  final void Function(String item, String tag) onSubmit;

  const ItemDialog({required this.onSubmit, super.key});

  @override
  State<ItemDialog> createState() => _ItemDialogState();
}

class _ItemDialogState extends State<ItemDialog> {
  final String date = DateTime.now().toString();

  GroceryCategory? selectedCategory;
  final TextEditingController _itemController = TextEditingController();

  @override
  void dispose() {
    _itemController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add an Item', textAlign: TextAlign.center),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(date),
          SizedBox(height: 16),
          TextField(
            controller: _itemController,
            decoration: InputDecoration(labelText: 'Enter an Item'),
          ),
          GroceryChip(
            onCategorySelected: (GroceryCategory? category) {
              setState(() {
                selectedCategory = category;
              });
            },
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
            if (_itemController.text.isNotEmpty && selectedCategory != null) {
              widget.onSubmit(
                _itemController.text,
                ShoppingHelper().formatCategory(selectedCategory!),
              );
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Added Successfully'),
                  duration: Duration(seconds: 2),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Fields cannot be empty!'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}
