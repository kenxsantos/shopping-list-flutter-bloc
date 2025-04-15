import 'package:dartactivity/ui/pages/home/widgets/all_list_widget/all_list_success_widget.dart';
import 'package:dartactivity/ui/pages/home/widgets/list_by_category_widget/bloc/list_by_category_bloc.dart';
import 'package:dartactivity/ui/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllListWidget extends StatefulWidget {
  const AllListWidget({super.key});

  @override
  State<AllListWidget> createState() => _AllListWidgetState();
}

class _AllListWidgetState extends State<AllListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListByCategoryBloc, ListByCategoryState>(
      builder: (context, state) {
        return state.status.isSuccess
            ? AllListSuccessWidget(
              items: state.items,
              selectedCategory: state.selectedCategory,
            )
            : state.status.isLoading
            ? const Center(child: CircularProgressIndicator())
            : state.status.isError
            ? ErrorShoppingWidget()
            : Container();
      },
    );
  }
}
