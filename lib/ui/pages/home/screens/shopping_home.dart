import 'package:dartactivity/repository/shopping_repository.dart';
import 'package:dartactivity/ui/pages/home/screens/shopping_layout.dart';
import 'package:dartactivity/ui/pages/home/widgets/all_list_widget/bloc/all_list_bloc.dart';
import 'package:dartactivity/ui/pages/home/widgets/category_widget/bloc/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingHome extends StatelessWidget {
  const ShoppingHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Shopping List"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        surfaceTintColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: RepositoryProvider(
                create: (context) => ShoppingListRepository(),
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider<AllListBloc>(
                      create:
                          (context) => AllListBloc(
                            shoppingRepository:
                                context.read<ShoppingListRepository>(),
                          )..add(GetListsEvent()),
                    ),
                    BlocProvider(
                      create:
                          (context) => CategoryBloc(
                            shoppingRepository:
                                context.read<ShoppingListRepository>(),
                          )..add(GetCategories()),
                    ),
                  ],
                  child: HomeLayout(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
