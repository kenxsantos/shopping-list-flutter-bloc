import 'package:dartactivity/repository/shopping_repository.dart';
import 'package:dartactivity/ui/pages/home/screens/shopping_layout.dart';
import 'package:dartactivity/ui/pages/home/widgets/category_widget/bloc/category_bloc.dart';
import 'package:dartactivity/ui/pages/home/widgets/list_by_category_widget/bloc/list_by_category_bloc.dart';
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
      body: RepositoryProvider(
        create: (context) => ShoppingListRepository(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create:
                  (context) => CategoryBloc(
                    shoppingRepository: context.read<ShoppingListRepository>(),
                  )..add(GetCategories()),
            ),
            BlocProvider(
              create:
                  (context) => ListByCategoryBloc(
                    shoppingRepository: context.read<ShoppingListRepository>(),
                  ),
            ),
          ],
          child: HomeLayout(),
        ),
      ),
    );
  }
}
