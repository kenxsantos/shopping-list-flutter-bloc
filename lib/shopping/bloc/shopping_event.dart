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
  final String id;
  ShoppingDeleteItem(this.id);
}

class ShoppingFetchItem extends ShoppingEvent {}

class ShoppingSortByName extends ShoppingEvent {}

class ShoppingSortByDate extends ShoppingEvent {}

class ShoppingFilterByCategory extends ShoppingEvent {
  final String category;
  ShoppingFilterByCategory(this.category);
}

class ShoppingPrintFormat extends ShoppingEvent {
  final String format;
  final List<ShoppingModel> items;
  final String type;

  ShoppingPrintFormat(this.format, this.items, this.type);
}
