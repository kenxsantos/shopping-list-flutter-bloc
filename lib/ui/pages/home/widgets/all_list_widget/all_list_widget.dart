import 'package:dartactivity/ui/pages/home/widgets/all_list_widget/all_list_success_widget.dart';
import 'package:dartactivity/ui/pages/home/widgets/all_list_widget/bloc/all_list_bloc.dart';
import 'package:dartactivity/ui/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllListWidget extends StatelessWidget {
  const AllListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllListBloc, AllListState>(
      builder: (context, state) {
        return Container(
          child:
              state.status.isSuccess
                  ? Expanded(child: AllListSuccessWidget(items: state.items))
                  : state.status.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state.status.isError
                  ? ErrorShoppingWidget()
                  : const Center(child: Text('No items found')),
        );
      },
    );
  }
}
