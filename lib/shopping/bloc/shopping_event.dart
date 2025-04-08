import 'package:dartactivity/shopping/models/shopping_model.dart';

abstract class ShoppingEvent {}

class ShoppingAddItem extends ShoppingEvent {
  final ShoppingModel item;
  ShoppingAddItem(this.item);
}

class ShoppingUpdateItem extends ShoppingEvent {
  final ShoppingModel item;
  ShoppingUpdateItem(this.item);
}

class ShoppingDeleteItem extends ShoppingEvent {
  final ShoppingModel item;
  ShoppingDeleteItem(this.item);
}

class ShoppingFetchItem extends ShoppingEvent {}

class ShoppingSortByName extends ShoppingEvent {}

class ShoppingSortByDate extends ShoppingEvent {}

class ShoppingFilterBy extends ShoppingEvent {
  final String category;
  ShoppingFilterBy(this.category);
}

class ShoppingPrintFormat extends ShoppingEvent {
  final String format;
  final List<ShoppingModel> items;
  final String type;

  ShoppingPrintFormat(this.format, this.items, this.type);
}
