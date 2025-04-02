import 'package:dartactivity/shopping/bloc/shopping_bloc.dart';
import 'package:dartactivity/shopping/bloc/shopping_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortingRepository {
  Future<void> showSortMenu(BuildContext context) async {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100, 130, 60, 0),
      items: [
        PopupMenuItem(
          value: 'name',
          onTap: () {
            context.read<ShoppingBloc>().add(ShoppingSortByName());
            print("sorting");
          },
          child: Row(
            children: [
              Icon(Icons.sort_by_alpha, size: 18),
              SizedBox(width: 5),
              Text('Name'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'date',
          onTap: () {
            context.read<ShoppingBloc>().add(ShoppingSortByDate());
            print("sorting");
          },
          child: Row(
            children: [
              Icon(Icons.today, size: 18),
              SizedBox(width: 5),
              Text('Date'),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> showFilterMenu(BuildContext context) async {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100, 130, 60, 0),
      items: [
        PopupMenuItem(
          value: 'name',
          onTap: () {},
          child: Row(
            children: [
              Icon(Icons.sort_by_alpha, size: 18),
              SizedBox(width: 5),
              Text('Name'),
            ],
          ),
        ),
      ],
    );
  }
}


// PopupMenuItem(
//           value: 'name',
//           onTap: () {
//             context.read<ShoppingBloc>().add(ShoppingSortByName());
//             print("sorting");
//           },
//           child: Row(
//             children: [
//               Icon(Icons.sort_by_alpha, size: 18),
//               SizedBox(width: 5),
//               Text('Name'),
//             ],
//           ),
//         ),
//         PopupMenuItem(
//           value: 'date',
//           onTap: () {
//             context.read<ShoppingBloc>().add(ShoppingSortByDate());
//             print("sorting");
//           },
//           child: Row(
//             children: [
//               Icon(Icons.today, size: 18),
//               SizedBox(width: 5),
//               Text('Date'),
//             ],
//           ),
//         ),