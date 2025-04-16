import 'package:dartactivity/ui/pages/favorite/screens/favorite_page.dart';
import 'package:dartactivity/ui/pages/favorite/widgets/all_list_favorites/bloc/favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCountIcon extends StatefulWidget {
  const FavoriteCountIcon({super.key, required this.icon});
  final Icon icon;

  @override
  State<FavoriteCountIcon> createState() => _FavoriteCountIconState();
}

class _FavoriteCountIconState extends State<FavoriteCountIcon> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavoriteBloc>(context).add(GetAllFavoritesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        int countItem = 0;
        countItem = state.favoriteItems.length;
        return IconButton(
          icon: Badge.count(count: countItem, child: widget.icon),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FavoritePage()),
            );
          },
          tooltip: 'Favorites',
          iconSize: 24,
          color: Colors.grey[800],
        );
      },
    );
  }
}
