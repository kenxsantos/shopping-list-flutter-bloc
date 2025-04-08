import 'package:dartactivity/shopping/bloc/shopping_event.dart';
import 'package:dartactivity/shopping/bloc/shopping_state.dart';
import 'package:dartactivity/shopping/models/shopping_model.dart';
import 'package:dartactivity/shopping/repositories/shopping_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingBloc extends Bloc<ShoppingEvent, ShoppingState> {
  final ShoppingRepository shopping;
  ShoppingBloc(this.shopping) : super(ShoppingListInitial()) {
    on<ShoppingAddItem>((event, emit) async {
      print("Initial State: $state");
      await shopping.addItem(event.item);
      await shopping.updateState(event.item, state, emit);
    });

    on<ShoppingFetchItem>((event, emit) async {
      final items = await shopping.getItems();
      emit(ShoppingListLoaded(items));
    });

    on<ShoppingDeleteItem>((event, emit) async {
      final db = await shopping.dbHelper.database;
      final List<Map<String, dynamic>> maps = await db.query(
        'shopping',
        where: 'id = ?',
        whereArgs: [int.parse(event.id)],
      );

      if (maps.isNotEmpty) {
        ShoppingModel deletedItem = ShoppingModel.fromJson(maps.first);
        await shopping.deleteItem(int.parse(event.id));
        await shopping.updateState(deletedItem, state, emit);
      }
    });

    on<ShoppingUpdateItem>((event, emit) async {
      await shopping.updateItem(event.item);
      await shopping.updateState(event.item, state, emit);
    });

    on<ShoppingSortByName>((event, emit) async {
      final sortedItems = await shopping.sortByName();
      emit(ShoppingListLoaded(sortedItems));
    });

    on<ShoppingSortByDate>((event, emit) async {
      final sortedItems = await shopping.sortByDate();
      emit(ShoppingListLoaded(sortedItems));
    });

    on<ShoppingFilterByCategory>((event, emit) async {
      final filteredItems = await shopping.filterBy(event.category);
      emit(ShoppingListFiltered(filteredItems));
    });

    on<ShoppingPrintFormat>((event, emit) async {
      await shopping.printShoppingList(event.items, event.format, event.type);
      emit(ShoppingPrintList(event.items));
      emit(ShoppingListLoaded(event.items));
    });

    on<ShoppingSearchItem>((event, emit) async {
      final list = await shopping.searchItem(event.item);
      emit(ShoppingSearchItemState(list));
    });
  }
}
