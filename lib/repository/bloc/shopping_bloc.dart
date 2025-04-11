// import 'dart:math';

// import 'package:dartactivity/ui/pages/home/widgets/all_list_widget/bloc/all_list_event.dart';
// import 'package:dartactivity/ui/pages/home/widgets/all_list_widget/bloc/all_list_state.dart';
// import 'package:dartactivity/repository/models/shopping_model.dart';
// import 'package:dartactivity/repository/shopping_repository.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ShoppingBloc extends Bloc<ShoppingEvent, ShoppingState> {
//   final ShoppingRepository shopping;
//   ShoppingBloc(this.shopping) : super(ShoppingListInitial()) {
//     on<ShoppingAddItem>((event, emit) async {
//       print("Initial State: $state");
//       await shopping.addItem(event.item);
//       await shopping.updateListState(event.item, state, emit);
//     });

//     on<ShoppingFetchItem>((event, emit) async {
//       final items = await shopping.getItems();
//       emit(ShoppingListLoaded(items));
//     });

//     on<ShoppingDeleteItem>((event, emit) async {
//       final db = await shopping.dbHelper.database;
//       final List<Map<String, dynamic>> maps = await db.query(
//         'shopping',
//         where: 'id = ?',
//         whereArgs: [int.parse(event.id)],
//       );

//       if (maps.isNotEmpty) {
//         ShoppingModel deletedItem = ShoppingModel.fromJson(maps.first);
//         await shopping.deleteItem(int.parse(event.id));
//         await shopping.updateListState(deletedItem, state, emit);
//       }
//     });

//     on<ShoppingUpdateItem>((event, emit) async {
//       await shopping.updateItem(event.item);
//       await shopping.updateListState(event.item, state, emit);
//     });

//     on<ShoppingSortByName>((event, emit) async {
//       await shopping.updateSortState(event.name, state, emit);
//     });
//     on<ShoppingSortByDate>((event, emit) async {
//       await shopping.updateSortState(event.date, state, emit);
//     });

//     // on<ShoppingSortByDate>((event, emit) async {
//     //   final db = await shopping.dbHelper.database;
//     //   final List<Map<String, dynamic>> maps = await db.query(
//     //     'shopping',
//     //     where: 'tag = ?',
//     //     whereArgs: [event.date],
//     //   );
//     //   if (maps.isNotEmpty) {
//     //     ShoppingModel sortedByDate = ShoppingModel.fromJson(maps.first);
//     //     await shopping.sortByDate(sortedByDate);
//     //   }
//     // });

//     on<ShoppingFilterByCategory>((event, emit) async {
//       final filteredItems = await shopping.filterBy(event.category);
//       emit(ShoppingListFiltered(filteredItems));
//     });

//     on<ShoppingPrintFormat>((event, emit) async {
//       await shopping.printShoppingList(event.items, event.format, event.type);
//       emit(ShoppingPrintList(event.items));
//       emit(ShoppingListLoaded(event.items));
//     });

//     on<ShoppingSearchItem>((event, emit) async {
//       final list = await shopping.searchItem(event.item);
//       emit(ShoppingSearchItemState(list));
//     });
//   }
// }
