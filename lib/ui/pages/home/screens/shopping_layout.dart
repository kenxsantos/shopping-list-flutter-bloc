import 'package:dartactivity/ui/pages/home/widgets/category_widget/category_widget.dart';
import 'package:dartactivity/ui/pages/home/widgets/list_by_category_widget/list_by_category_widget.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [CategoryWidget(), ListByCategoryWidget()],
      ),
    );
  }
}
