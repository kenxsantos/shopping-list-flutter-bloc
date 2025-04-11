import 'package:dartactivity/repository/models/shopping_model.dart';
import 'package:dartactivity/repository/shopping_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_list_event.dart';
part 'all_list_state.dart';

class AllListBloc extends Bloc<AllListEvent, AllListState> {
  final ShoppingListRepository shoppingRepository;

  AllListBloc({required this.shoppingRepository})
    : super(const AllListState(status: AllListStatus.initial)) {
    on<GetListsEvent>(_onGetLists);
  }

  Future<void> _onGetLists(
    GetListsEvent event,
    Emitter<AllListState> emit,
  ) async {
    emit(state.copyWith(status: AllListStatus.loading));
    try {
      final items = await shoppingRepository.getItems();
      emit(state.copyWith(status: AllListStatus.success, items: items));
    } catch (_) {
      emit(state.copyWith(status: AllListStatus.error));
    }
  }
}
