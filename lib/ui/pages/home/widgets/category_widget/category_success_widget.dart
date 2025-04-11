import 'package:flutter/material.dart';

class CategorySuccessWidget extends StatelessWidget {
  const CategorySuccessWidget({required this.categories, super.key});

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  // Handle delete action here
                },
              ),
            ],
          );
        },
      ),
    );

    // ListView.builder(
    //   itemCount: categories.length,
    //   itemBuilder: (context, index) {
    //     return;
    //   },
    // );
  }
}
