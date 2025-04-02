import 'package:dartactivity/shopping/utils/enum_tags.dart';

class ShoppingHelper {
  String formatCategory(GroceryCategory category) {
    switch (category) {
      case GroceryCategory.fruitsAndVegetable:
        return 'Fruits & Vegetables';
      case GroceryCategory.dairyProducts:
        return 'Dairy Products';
      case GroceryCategory.poultry:
        return 'Poultry';
      case GroceryCategory.breadAndGrains:
        return 'Bread & Grains';
      case GroceryCategory.snacks:
        return 'Snacks';
      case GroceryCategory.cannedGoods:
        return 'Canned Goods';
      case GroceryCategory.frozenGoods:
        return 'Frozen Goods';
      case GroceryCategory.beautyProducts:
        return 'Beauty Products';
      case GroceryCategory.cleaningSupplies:
        return 'Cleaning Supplies';
    }
  }
}
