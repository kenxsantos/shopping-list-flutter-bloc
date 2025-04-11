// import 'package:dartactivity/ui/pages/home/widgets/all_list_widget/bloc/all_list_bloc.dart';
// import 'package:dartactivity/ui/pages/home/widgets/all_list_widget/bloc/all_list_state.dart';
// import 'package:dartactivity/ui/widgets/item_tile.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class FavoritePage extends StatefulWidget {
//   const FavoritePage({super.key});

//   @override
//   State<FavoritePage> createState() => _FavoritePageState();
// }

// class _FavoritePageState extends State<FavoritePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: EdgeInsets.all(16),
//       child: BlocBuilder<ShoppingBloc, ShoppingState>(
//         builder: (context, state) {
//           final favoriteItems = _getFavoriteItems(state);
//           return favoriteItems.isEmpty
//               ? const Center(child: Text('No items in the favorites.'))
//               : _buildItemList(favoriteItems);
//         },
//       ),
//     );
//   }

//   List _getFavoriteItems(ShoppingState state) {
//     if (state is ShoppingListLoaded) {
//       return state.items.where((item) => item.isFavorite).toList();
//     } else if (state is ShoppingListFiltered) {
//       return state.filteredItems.where((item) => item.isFavorite).toList();
//     }
//     return [];
//   }

//   Widget _buildItemList(List favoriteItems) {
//     return ListView.builder(
//       itemCount: favoriteItems.length,
//       itemBuilder: (context, index) {
//         final item = favoriteItems[index];
//         return Card(
//           color: Colors.grey[800],
//           child: ItemTile(
//             id: item.id,
//             name: item.name,
//             tag: item.tag,
//             isFavorite: item.isFavorite,
//           ),
//         );
//       },
//     );
//   }
// }
