import 'package:dartactivity/repository/models/shopping_model.dart';
import 'package:dartactivity/repository/shopping_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteItemsEvent, FavoriteState> {
  final ShoppingListRepository shoppingListRepository;
  FavoriteBloc({required this.shoppingListRepository})
    : super(const FavoriteState()) {
    on<GetAllFavoritesEvent>(_onGetAllFavoritesEvent);
  }

  Future<void> _onGetAllFavoritesEvent(
    GetAllFavoritesEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      final items = await shoppingListRepository.getFavoriteItems();
      emit(
        state.copyWith(status: FavoriteStatus.success, favoriteItems: items),
      );
    } catch (e) {
      emit(state.copyWith(status: FavoriteStatus.error));
    }
  }
}
