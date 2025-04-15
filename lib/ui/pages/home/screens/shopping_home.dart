import 'package:dartactivity/repository/models/shopping_model.dart';
import 'package:dartactivity/ui/pages/home/screens/shopping_layout.dart';
import 'package:dartactivity/ui/pages/home/widgets/list_by_category_widget/bloc/list_by_category_bloc.dart';
import 'package:dartactivity/ui/widgets/item_add_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingHome extends StatefulWidget {
  const ShoppingHome({super.key});

  @override
  State<ShoppingHome> createState() => _ShoppingHomeState();
}

class _ShoppingHomeState extends State<ShoppingHome> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Shopping List"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        surfaceTintColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.grey[800]),
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (context) => ItemDialog(
                      onSubmit: (
                        String addedItem,
                        String addedTag,
                        bool addedFavorite,
                      ) {
                        final newItem = ShoppingModel(
                          name: addedItem,
                          tag: addedTag,
                          isFavorite: addedFavorite,
                        );
                        context.read<ListByCategoryBloc>().add(
                          ShoppingAddItem(item: newItem),
                        );
                      },
                    ),
              );
            },
          ),
          // ShoppingHelper.countIconButton(
          //   icon: Icon(Icons.favorite_border_outlined),
          // ),
        ],
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
              IconButton(
                onPressed: () {
                  //TODO: Navigate to home page
                },
                icon: Icon(Icons.home, color: Colors.white),
              ),
              IconButton(
                onPressed: () {
                  //TODO: Navigate to settings page
                },
                icon: Icon(Icons.settings, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: HomeLayout(),
    );
  }
}
