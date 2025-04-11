import 'package:dartactivity/ui/pages/home/screens/shopping_home.dart';
import 'package:dartactivity/ui/pages/home/widgets/all_list_widget/all_list_widget.dart';
import 'package:dartactivity/ui/pages/home/widgets/all_list_widget/bloc/all_list_bloc.dart';
import 'package:dartactivity/repository/shopping_repository.dart';
import 'package:dartactivity/ui/pages/landing/widgets/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List',
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      debugShowCheckedModeBanner: false,
      home: ShoppingHome(),
    );
  }
}
