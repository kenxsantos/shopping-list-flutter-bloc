import 'package:dartactivity/repository/shopping_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ShoppingListRepository shoppingRepository;
  CategoryBloc({required this.shoppingRepository})
    : super(const CategoryState()) {
    on<SelectCategory>(_onSelectCategory);
    on<GetCategories>(_onGetCategory);
  }

  void _onGetCategory(GetCategories event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(status: CategoryStatus.loading));
    try {
      final categories = await shoppingRepository.getCategories();
      emit(
        state.copyWith(status: CategoryStatus.success, categories: categories),
      );
    } catch (error, stacktrace) {
      print(stacktrace);
      emit(state.copyWith(status: CategoryStatus.error));
    }
  }

  void _onSelectCategory(
    SelectCategory event,
    Emitter<CategoryState> emit,
  ) async {
    emit(
      state.copyWith(
        status: CategoryStatus.selected,
        selectedCategory: event.category,
      ),
    );
  }
}
