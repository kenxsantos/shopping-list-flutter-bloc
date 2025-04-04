import 'package:dartactivity/shopping/models/shopping_model.dart';

abstract class ShoppingEvent {}

class ShoppingAddItem extends ShoppingEvent {
  final ShoppingModel item;
  ShoppingAddItem(this.item);
}

class ShoppingUpdateItem extends ShoppingEvent {
  final String id;
  final String newName;
  final String newTag;
  final bool isFavorite;
  ShoppingUpdateItem(this.id, this.newName, this.newTag, this.isFavorite);
}

class ShoppingDeleteItem extends ShoppingEvent {
  final String id;
  ShoppingDeleteItem(this.id);
}

class ShoppingFetchItem extends ShoppingEvent {}

class ShoppingSortByName extends ShoppingEvent {}

class ShoppingSortByDate extends ShoppingEvent {}

class ShoppingFilterBy extends ShoppingEvent {
  final String category;
  ShoppingFilterBy(this.category);
}
