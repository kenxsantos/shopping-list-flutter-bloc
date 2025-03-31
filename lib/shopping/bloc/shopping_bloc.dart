import 'package:dartactivity/shopping/bloc/shopping_event.dart';
import 'package:dartactivity/shopping/bloc/shopping_state.dart';
import 'package:dartactivity/shopping/models/shopping_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingBloc extends Bloc<ShoppingEvent, ShoppingState> {
  final List<ShoppingModel> _items = [];

  ShoppingBloc() : super(ShoppingListInitial()) {
    on<ShoppingAddItem>((event, emit) {
      _items.add(event.item);
      emit(ShoppingListLoaded(List.from(_items)));
    });

    on<ShoppingUpdateItem>((event, emit) {
      final index = _items.indexWhere((item) => item.id == event.id);
      if (index != -1) {
        _items[index] = ShoppingModel(id: event.id, name: event.newName);
        emit(ShoppingListLoaded(List.from(_items)));
      }
    });

    on<ShoppingDeleteItem>((event, emit) {
      _items.removeWhere((item) => item.id == event.id);
      emit(ShoppingListLoaded(List.from(_items)));
    });

    on<ShoppingFetchItem>((event, emit) {
      emit(ShoppingListLoaded(List.from(_items)));
    });
  }
}
