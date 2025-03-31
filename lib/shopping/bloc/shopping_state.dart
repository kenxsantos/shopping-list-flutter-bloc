import 'package:dartactivity/shopping/models/shopping_model.dart';

sealed class ShoppingState {}

class ShoppingListInitial extends ShoppingState {}

class ShoppingListLoaded extends ShoppingState {
  final List<ShoppingModel> items;
  ShoppingListLoaded(this.items);
}
