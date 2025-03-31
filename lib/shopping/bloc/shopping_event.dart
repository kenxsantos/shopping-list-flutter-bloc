import 'package:dartactivity/shopping/models/shopping_model.dart';

abstract class ShoppingEvent {}

class ShoppingAddItem extends ShoppingEvent {
  final ShoppingModel item;
  ShoppingAddItem(this.item);
}

class ShoppingUpdateItem extends ShoppingEvent {
  final String id;
  final String newName;
  ShoppingUpdateItem(this.id, this.newName);
}

class ShoppingDeleteItem extends ShoppingEvent {
  final String id;
  ShoppingDeleteItem(this.id);
}

class ShoppingFetchItem extends ShoppingEvent {}
