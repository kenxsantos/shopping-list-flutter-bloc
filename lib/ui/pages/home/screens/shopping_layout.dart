import 'package:dartactivity/ui/pages/home/widgets/all_list_widget/all_list_widget.dart';
import 'package:dartactivity/ui/pages/home/widgets/category_widget/category_widget.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [CategoryWidget(), AllListWidget()],
      ),
    );
  }
}
