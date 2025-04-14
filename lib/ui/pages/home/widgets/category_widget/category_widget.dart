import 'package:dartactivity/ui/pages/home/widgets/category_widget/bloc/category_bloc.dart';
import 'package:dartactivity/ui/pages/home/widgets/category_widget/category_success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      buildWhen: (previous, current) => current.status.isSuccess,
      builder: (context, state) {
        return Container(
          child:
              state.status.isSuccess
                  ? CategorySuccessWidget(categories: state.categories)
                  : state.status.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state.status.isError
                  ? const Center(child: Text('Error loading categories'))
                  : const Center(child: Text('No categories found')),
        );
      },
    );
  }
}
