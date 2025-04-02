import 'package:dartactivity/shopping/utils/enum_tags.dart';
import 'package:dartactivity/shopping/utils/shopping_helper.dart';
import 'package:flutter/material.dart';

class GroceryChip extends StatefulWidget {
  const GroceryChip({required this.onCategorySelected, super.key});
  final void Function(GroceryCategory? selectedCategory) onCategorySelected;
  @override
  State<GroceryChip> createState() => _GroceryChipState();
}

class _GroceryChipState extends State<GroceryChip> {
  GroceryCategory? selectedCategory;
  final ShoppingHelper helper = ShoppingHelper();
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 10),
          Text('Choose a Category', style: textTheme.labelLarge),
          const SizedBox(height: 5.0),

          Wrap(
            spacing: 5.0,
            children:
                GroceryCategory.values.map((GroceryCategory grocery) {
                  return FilterChip(
                    selectedColor: Colors.grey,
                    backgroundColor: Colors.greenAccent,
                    label: Text(
                      (helper.formatCategory(grocery)),
                      style: TextStyle(fontSize: 12),
                    ),
                    selected: selectedCategory == grocery,
                    onSelected: (bool isSelected) {
                      setState(() {
                        if (isSelected) {
                          selectedCategory = grocery; // Set selected category
                          widget.onCategorySelected(selectedCategory);
                        } else {
                          selectedCategory = null; // Clear selection
                          widget.onCategorySelected(null);
                        }
                      });
                    },
                  );
                }).toList(),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
