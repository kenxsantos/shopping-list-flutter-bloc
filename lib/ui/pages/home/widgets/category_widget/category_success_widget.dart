import 'package:dartactivity/ui/pages/home/widgets/list_by_category_widget/bloc/list_by_category_bloc.dart';
import 'package:dartactivity/ui/widgets/category_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorySuccessWidget extends StatelessWidget {
  const CategorySuccessWidget({required this.categories, super.key});

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CategoryButton(
            label: "All Categories",
            onPressed: () {
              context.read<ListByCategoryBloc>().add(
                GetListByCategory(categoryName: "All"),
              );
            },
          ),
          ...List.generate(categories.length, (index) {
            final item = categories[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CategoryButton(
                label: item,
                onPressed: () {
                  context.read<ListByCategoryBloc>().add(
                    GetListByCategory(categoryName: item),
                  );
                  print("Selected category: $item");
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
