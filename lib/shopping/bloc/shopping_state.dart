import 'package:dartactivity/shopping/models/shopping_model.dart';

sealed class ShoppingState {}

class ShoppingListInitial extends ShoppingState {}

class ShoppingLoadingState extends ShoppingState {}

class ShoppingErrorState extends ShoppingState {
  final String message;

  ShoppingErrorState(this.message);
}

class ShoppingListLoaded extends ShoppingState {
  final List<ShoppingModel> items;
  ShoppingListLoaded(this.items);
}
