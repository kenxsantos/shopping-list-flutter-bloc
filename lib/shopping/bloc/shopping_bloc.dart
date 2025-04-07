import 'package:dartactivity/shopping/bloc/shopping_event.dart';
import 'package:dartactivity/shopping/bloc/shopping_state.dart';
import 'package:dartactivity/shopping/repositories/shopping_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingBloc extends Bloc<ShoppingEvent, ShoppingState> {
  final ShoppingRepository shopping;
  ShoppingBloc(this.shopping) : super(ShoppingListInitial()) {
    on<ShoppingAddItem>((event, emit) async {
      await shopping.addItem(event.item);
      final items = await shopping.fetchItems();

      emit(ShoppingListLoaded(items));
    });

    on<ShoppingUpdateItem>((event, emit) async {
      await shopping.updateItem(event.item);
      if (state is ShoppingListFiltered) {
        final filteredItems = await shopping.fetchFilteredItems(event.item);
        emit(ShoppingListFiltered(filteredItems));
      } else {
        final items = await shopping.fetchItems();
        emit(ShoppingListLoaded(items));
      }
    });

    on<ShoppingDeleteItem>((event, emit) async {
      await shopping.deleteItem(event.id);
      final items = await shopping.fetchItems();
      emit(ShoppingListLoaded(items));
    });

    on<ShoppingFetchItem>((event, emit) async {
      final items = await shopping.fetchItems();
      emit(ShoppingListLoaded(items));
    });

    on<ShoppingSortByName>((event, emit) async {
      final items = await shopping.sortByName();
      emit(ShoppingListLoaded(items));
    });

    on<ShoppingSortByDate>((event, emit) async {
      final items = await shopping.sortByDate();
      emit(ShoppingListLoaded(items));
    });

    on<ShoppingFilterBy>((event, emit) async {
      final items = await shopping.filterBy(event.category);
      emit(ShoppingListFiltered(items));
    });

    on<ShoppingPrintFormat>((event, emit) async {
      await shopping.printShoppingList(event.items, event.format, event.type);
      emit(ShoppingPrintList(event.items));
      emit(ShoppingListLoaded(event.items));
    });
  }
}
