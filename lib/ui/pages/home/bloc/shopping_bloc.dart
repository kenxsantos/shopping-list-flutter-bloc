import 'package:dartactivity/repository/models/shopping_model.dart';
import 'package:dartactivity/repository/shopping_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shopping_event.dart';
part 'shopping_state.dart';

class ShoppingBloc extends Bloc<ShoppingEvent, ShoppingAllListState> {
  final ShoppingListRepository shoppingRepository;
  ShoppingBloc({required this.shoppingRepository})
    : super(const ShoppingAllListState()) {
    on<AddItem>(_onAddItem);
    on<DeleteItem>(_onDeleteItem);
    on<UpdateItem>(_onUpdateItem);
    on<ShoppingAllListEvent>(_onGetAllItems);
  }

  Future<void> _onGetAllItems(
    ShoppingAllListEvent event,
    Emitter<ShoppingAllListState> emit,
  ) async {
    emit(state.copyWith(status: ShoppingStatus.loading));
    try {
      final items = await shoppingRepository.getItems();
      emit(state.copyWith(status: ShoppingStatus.success, items: items));
    } catch (_) {
      emit(state.copyWith(status: ShoppingStatus.error));
    }
  }

  Future<void> _onAddItem(
    AddItem event,
    Emitter<ShoppingAllListState> emit,
  ) async {
    emit(state.copyWith(status: ShoppingStatus.loading));
    try {
      final items = await shoppingRepository.addItem(event.item);
      emit(state.copyWith(status: ShoppingStatus.success, items: items));
    } catch (_) {
      emit(state.copyWith(status: ShoppingStatus.error));
    }
  }

  Future<void> _onUpdateItem(
    UpdateItem event,
    Emitter<ShoppingAllListState> emit,
  ) async {
    emit(state.copyWith(status: ShoppingStatus.loading));
    try {
      final items = await shoppingRepository.updateItem(event.item);
      emit(state.copyWith(status: ShoppingStatus.success, items: items));
    } catch (_) {
      emit(state.copyWith(status: ShoppingStatus.error));
    }
  }

  Future<void> _onDeleteItem(
    DeleteItem event,
    Emitter<ShoppingAllListState> emit,
  ) async {
    emit(state.copyWith(status: ShoppingStatus.loading));
    try {
      await shoppingRepository.deleteItem(event.item);
      emit(state.copyWith(status: ShoppingStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ShoppingStatus.error));
    }
  }
}
