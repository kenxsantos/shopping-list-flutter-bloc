import 'package:dartactivity/ui/pages/favorite/widgets/all_list_favorites/all_list_success_favorite.dart';
import 'package:dartactivity/ui/pages/favorite/widgets/all_list_favorites/bloc/favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllListFavorite extends StatefulWidget {
  const AllListFavorite({super.key});

  @override
  State<AllListFavorite> createState() => _AllListFavoriteState();
}

class _AllListFavoriteState extends State<AllListFavorite> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteBloc>().add(const GetAllFavoritesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        return state.status.isSuccess
            ? AllListSuccessFavorite(items: state.favoriteItems)
            : state.status.isLoading
            ? const Center(child: CircularProgressIndicator())
            : state.status.isError
            ? const Center(child: Text("Error loading favorites"))
            : Container();
      },
    );
  }
}
