import 'package:dartactivity/ui/pages/favorite/screens/favorite_page.dart';
import 'package:dartactivity/ui/pages/favorite/widgets/all_list_favorites/all_list_favorite.dart';
import 'package:dartactivity/ui/pages/home/widgets/seach_bar_widget/search_bar_widget.dart';
import 'package:flutter/material.dart';

class FavoriteLayout extends StatelessWidget {
  const FavoriteLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [AllListFavorite()],
      ),
    );
  }
}
