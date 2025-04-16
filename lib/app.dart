import 'package:dartactivity/repository/shopping_repository.dart';
import 'package:dartactivity/ui/pages/favorite/widgets/all_list_favorites/bloc/favorite_bloc.dart';
import 'package:dartactivity/ui/pages/home/screens/shopping_home.dart';
import 'package:dartactivity/ui/pages/home/widgets/category_widget/bloc/category_bloc.dart';
import 'package:dartactivity/ui/pages/home/widgets/list_by_category_widget/bloc/list_by_category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
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
          BlocProvider(
            create:
                (context) => FavoriteBloc(
                  shoppingListRepository:
                      context.read<ShoppingListRepository>(),
                ),
          ),
        ],
        child: MaterialApp(
          title: 'Shopping List',
          theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
          debugShowCheckedModeBanner: false,
          home: ShoppingHome(),
        ),
      ),
    );
  }
}
