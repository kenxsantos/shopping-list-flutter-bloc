import 'package:dartactivity/shopping/utils/enum_tags.dart';
import 'package:flutter/material.dart';

class GroceryChips extends StatefulWidget {
  const GroceryChips({super.key});

  @override
  _GroceryChipsState createState() => _GroceryChipsState();
}

class _GroceryChipsState extends State<GroceryChips> {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TextField to display the selected category
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(
              labelText: 'Selected Category',
              border: OutlineInputBorder(),
            ),
          ),
        ),

        // Chips to list GroceryCategory items
        Wrap(
          spacing: 8.0, // Space between chips
          runSpacing: 4.0, // Space between rows of chips
          children:
              GroceryCategory.values.map((category) {
                return ActionChip(
                  label: Text(
                    category
                        .toString()
                        .split('.')
                        .last, // Display category name without enum prefix
                  ),
                  onPressed: () {
                    // Set the selected chip value to TextField
                    _textFieldController.text =
                        category.toString().split('.').last;
                  },
                );
              }).toList(),
        ),
      ],
    );
  }
}
