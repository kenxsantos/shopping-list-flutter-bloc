import 'package:dartactivity/repository/models/shopping_model.dart';

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

class ShoppingSortByName extends ShoppingEvent {
  final String name;
  ShoppingSortByName(this.name);
}

class ShoppingSortByDate extends ShoppingEvent {
  final String date;
  ShoppingSortByDate(this.date);
}

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

class ShoppingSearchItem extends ShoppingEvent {
  final String item;
  ShoppingSearchItem(this.item);
}
