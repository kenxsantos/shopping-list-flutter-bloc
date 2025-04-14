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
  }

  Future<void> _onGetLists(
    GetAllListsEvent event,
    Emitter<ListByCategoryState> emit,
  ) async {
    emit(state.copyWith(status: ListByCategoryStatus.loading));
    try {
      final items = await shoppingRepository.getItems();
      emit(state.copyWith(status: ListByCategoryStatus.success, items: items));
    } catch (_) {
      emit(state.copyWith(status: ListByCategoryStatus.error));
    }
  }

  void _onGetListByCategory(
    GetListByCategory event,
    Emitter<ListByCategoryState> emit,
  ) async {
    try {
      emit(state.copyWith(status: ListByCategoryStatus.loading));
      final items = shoppingRepository.getItemsByCategory(event.categoryName);
      emit(
        state.copyWith(
          status: ListByCategoryStatus.success,
          items: await items,
          selectedCategory: event.categoryName,
        ),
      );

      print("Items by category: ${state.items}");
    } catch (error, stacktrace) {
      print(stacktrace);
      emit(state.copyWith(status: ListByCategoryStatus.error));
    }
  }
}
