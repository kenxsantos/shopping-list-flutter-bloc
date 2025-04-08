import 'package:dartactivity/shopping/bloc/shopping_bloc.dart';
import 'package:dartactivity/shopping/bloc/shopping_event.dart';
import 'package:dartactivity/shopping/bloc/shopping_state.dart';
import 'package:dartactivity/shopping/models/shopping_model.dart';
import 'package:dartactivity/shopping/screens/favorite_page.dart';
import 'package:dartactivity/shopping/screens/shopping_list.dart';
import 'package:dartactivity/shopping/utils/shopping_database.dart';
import 'package:dartactivity/shopping/utils/shopping_helper.dart';
import 'package:dartactivity/shopping/widgets/item_add_dialog.dart';
import 'package:dartactivity/shopping/widgets/sort_filter_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingHome extends StatefulWidget {
  const ShoppingHome({super.key});

  @override
  State<ShoppingHome> createState() => _ShoppingHomeState();
}

class _ShoppingHomeState extends State<ShoppingHome> {
  int pageIndex = 0;
  late ShoppingListLoaded list;
  final screens = [const ShoppingList(), const FavoritePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(pageIndex == 0 ? "Shopping List" : "Favorite List"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        surfaceTintColor: Colors.white,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        height: 80,
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
        color: Colors.grey[800],
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShoppingHelper.countIconButton(
                currentPageIndex: pageIndex,
                icon:
                    pageIndex == 0
                        ? Icon(Icons.receipt_long, size: 26)
                        : Icon(Icons.receipt_long_outlined),
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                showFavoritesOnly: false,
              ),
              ShoppingHelper.countIconButton(
                currentPageIndex: pageIndex,
                icon:
                    pageIndex == 1
                        ? Icon(Icons.favorite, size: 26)
                        : Icon(Icons.favorite_border_outlined),
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                showFavoritesOnly: true,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.orange,
        onPressed: () {
          showDialog(
            context: context,
            builder:
                (context) => ItemDialog(
                  onSubmit: (
                    String addedItem,
                    String addedTag,
                    bool addedFavorite,
                  ) async {
                    final ShoppingHelper helper = ShoppingHelper();
                    int lastId = await helper.getLastId();
                    final newItem = ShoppingModel(
                      id: lastId + 1,
                      name: addedItem,
                      tag: addedTag,
                      isFavorite: addedFavorite,
                    );
                    context.read<ShoppingBloc>().add(ShoppingAddItem(newItem));
                  },
                ),
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [SortFilterContainer(), Expanded(child: screens[pageIndex])],
      ),
    );
  }
}
