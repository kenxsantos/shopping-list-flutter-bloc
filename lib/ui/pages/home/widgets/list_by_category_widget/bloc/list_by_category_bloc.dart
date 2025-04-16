import 'package:dartactivity/repository/models/shopping_model.dart';
import 'package:dartactivity/repository/shopping_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'list_by_category_event.dart';
part 'list_by_category_state.dart';

class ListByCategoryBloc
    extends Bloc<ListByCategoryEvent, ListByCategoryState> {
  final ShoppingListRepository shoppingRepository;
  ListByCategoryBloc({required this.shoppingRepository})
    : super(const ListByCategoryState()) {
    on<GetListByCategory>(_onGetListByCategory);
    on<GetAllListsEvent>(_onGetLists);
    on<ShoppingAddItem>(_onAddItem);
    on<ShoppingUpdateItem>(_onUpdateItem);
    on<ShoppingDeleteItem>(_onDeleteItem);
    on<SearchItem>(_onSearchItem);
    on<SortItem>(_onSortItem);
  }

  Future<void> _onGetLists(
    GetAllListsEvent event,
    Emitter<ListByCategoryState> emit,
  ) async {
    emit(state.copyWith(status: ListByCategoryStatus.loading));
    try {
      final items = await shoppingRepository.getItems();
      emit(state.copyWith(status: ListByCategoryStatus.allItems, items: items));
    } catch (_) {
      emit(state.copyWith(status: ListByCategoryStatus.error));
    }
  }

  Future<void> _onGetListByCategory(
    GetListByCategory event,
    Emitter<ListByCategoryState> emit,
  ) async {
    try {
      if (event.categoryName == 'All') {
        emit(state.copyWith(status: ListByCategoryStatus.loading));
        final items = await shoppingRepository.getItems();
        emit(
          state.copyWith(
            status: ListByCategoryStatus.allItems,
            items: items,
            selectedCategory: event.categoryName,
          ),
        );
      } else {
        emit(state.copyWith(status: ListByCategoryStatus.loading));
        final items = await shoppingRepository.getItemsByCategory(
          event.categoryName,
        );
        emit(
          state.copyWith(
            status: ListByCategoryStatus.success,
            items: items,
            selectedCategory: event.categoryName,
          ),
        );
      }
    } catch (error) {
      emit(state.copyWith(status: ListByCategoryStatus.error));
    }
  }

  Future<void> _onAddItem(
    ShoppingAddItem event,
    Emitter<ListByCategoryState> emit,
  ) async {
    try {
      final category = state.status.isAllItems ? "All" : event.item.tag;
      final items = await shoppingRepository.addItem(event.item, category);
      final status =
          state.status.isAllItems
              ? ListByCategoryStatus.allItems
              : ListByCategoryStatus.success;
      emit(state.copyWith(status: ListByCategoryStatus.loading));
      await Future.delayed(const Duration(milliseconds: 500));
      emit(state.copyWith(status: status, items: items));
    } catch (error) {
      emit(state.copyWith(status: ListByCategoryStatus.error));
    }
  }

  Future<void> _onUpdateItem(
    ShoppingUpdateItem event,
    Emitter<ListByCategoryState> emit,
  ) async {
    try {
      final category = state.status.isAllItems ? "All" : event.item.tag;
      final items = await shoppingRepository.updateItem(event.item, category);
      final status =
          state.status.isAllItems
              ? ListByCategoryStatus.allItems
              : ListByCategoryStatus.success;
      emit(state.copyWith(status: status, items: items));
    } catch (_) {
      emit(state.copyWith(status: ListByCategoryStatus.error));
    }
  }

  Future<void> _onDeleteItem(
    ShoppingDeleteItem event,
    Emitter<ListByCategoryState> emit,
  ) async {
    try {
      final category = state.status.isAllItems ? "All" : event.item.tag;
      final items = await shoppingRepository.deleteItem(
        event.id,
        event.item,
        category,
      );
      final status =
          state.status.isAllItems
              ? ListByCategoryStatus.allItems
              : ListByCategoryStatus.success;

      emit(state.copyWith(status: ListByCategoryStatus.loading));
      await Future.delayed(const Duration(milliseconds: 500));
      emit(state.copyWith(status: status, items: items));
    } catch (e) {
      emit(state.copyWith(status: ListByCategoryStatus.error));
    }
  }

  Future<void> _onSearchItem(
    SearchItem event,
    Emitter<ListByCategoryState> emit,
  ) async {
    try {
      emit(state.copyWith(status: ListByCategoryStatus.searchItem));
      if (state.status.isSearchItem) {
        final items = shoppingRepository.searchItem(event.searchText);
        emit(state.copyWith(status: ListByCategoryStatus.loading));
        emit(
          state.copyWith(
            status: ListByCategoryStatus.success,
            items: await items,
          ),
        );
      } else {
        emit(state.copyWith(status: ListByCategoryStatus.searchItem));
      }
    } catch (error) {
      emit(state.copyWith(status: ListByCategoryStatus.error));
    }
  }

  Future<void> _onSortItem(
    SortItem event,
    Emitter<ListByCategoryState> emit,
  ) async {
    try {
      emit(state.copyWith(status: ListByCategoryStatus.loading));
      final category = state.selectedCategory;
      final sortedItems = await shoppingRepository.sortItem(
        event.sortType,
        category,
      );
      emit(
        state.copyWith(
          status: ListByCategoryStatus.sortItem,
          items: sortedItems,
          selectedCategory: category,
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: ListByCategoryStatus.error));
    }
  }
}
