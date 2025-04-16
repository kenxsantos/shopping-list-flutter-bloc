import 'package:dartactivity/ui/pages/home/widgets/all_list_widget/all_list_success_widget.dart';
import 'package:dartactivity/ui/pages/home/widgets/list_by_category_widget/bloc/list_by_category_bloc.dart';
import 'package:dartactivity/ui/pages/home/widgets/list_by_category_widget/list_by_category_success_widget.dart';
import 'package:dartactivity/ui/pages/home/widgets/seach_bar_widget/search_bar_success_widget.dart';
import 'package:dartactivity/ui/pages/home/widgets/sort_list_widget/sort_list_success_widget.dart';
import 'package:dartactivity/ui/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListByCategoryWidget extends StatefulWidget {
  const ListByCategoryWidget({super.key});

  @override
  State<ListByCategoryWidget> createState() => _ListByCategoryWidgetState();
}

class _ListByCategoryWidgetState extends State<ListByCategoryWidget> {
  @override
  void initState() {
    super.initState();
    context.read<ListByCategoryBloc>().add(
      GetListByCategory(categoryName: "All"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListByCategoryBloc, ListByCategoryState>(
      builder: (context, state) {
        return state.status.isSuccess
            ? ListByCategorySuccessWidget(
              items: state.items,
              selectedCategory: state.selectedCategory,
            )
            : state.status.isAllItems
            ? AllListSuccessWidget(
              items: state.items,
              selectedCategory: state.selectedCategory,
            )
            : state.status.isSearchItem
            ? SearchBarSuccessWidget(items: state.items)
            : state.status.isSortItem
            ? SortListSuccessWidget(items: state.items)
            : state.status.isLoading
            ? const Center(child: CircularProgressIndicator())
            : state.status.isError
            ? ErrorShoppingWidget()
            : Container();
      },
    );
  }
}
