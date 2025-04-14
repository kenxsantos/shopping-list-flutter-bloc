// import 'package:dartactivity/ui/pages/home/widgets/all_list_widget/bloc/all_list_bloc.dart';
// import 'package:dartactivity/ui/pages/home/widgets/all_list_widget/bloc/all_list_state.dart';
// import 'package:dartactivity/repository/models/shopping_model.dart';
// import 'package:dartactivity/utils/enum_tags.dart';
// import 'package:dartactivity/utils/shopping_database.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dartactivity/ui/pages/home/widgets/list_by_category_widget/bloc/list_by_category_bloc.dart';
import 'package:dartactivity/utils/enum_tags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  stringToCategory(String tag) {
    switch (tag) {
      case "Fruits & Vegetables":
        return GroceryCategory.fruitsAndVegetable;
      case "Dairy Products":
        return GroceryCategory.dairyProducts;
      case "Poultry":
        return GroceryCategory.poultry;
      case "Bread & Grains":
        return GroceryCategory.breadAndGrains;
      case "Snacks":
        return GroceryCategory.snacks;
      case "Canned Goods":
        return GroceryCategory.cannedGoods;
      case "Frozen Goods":
        return GroceryCategory.frozenGoods;
      case "Beauty Products":
        return GroceryCategory.beautyProducts;
      case "Cleaning Supplies":
        return GroceryCategory.cleaningSupplies;
    }
  }
}
//   String generateTextContent(List<ShoppingModel> items) {
//     final header = 'Shopping List:\n';
//     final content = items
//         .asMap()
//         .entries
//         .map((entry) {
//           final index = entry.key + 1;
//           final item = entry.value;
//           return '$index. ID: ${item.id}, Name: ${item.name}, Category: ${item.tag}';
//         })
//         .join('\n');
//     return header + content;
//   }

//   String generateCsvContent(List<ShoppingModel> items) {
//     final header = 'ID,Name,Tag\n';
//     final content = items
//         .map((item) => '${item.id},${item.name},${item.tag}')
//         .join('\n');
//     return header + content;
//   }

//   Future<int> getLastId() async {
//     final ShoppingDatabase dbHelper = ShoppingDatabase.instance;
//     final db = await dbHelper.database;
//     final List<Map<String, dynamic>> result = await db.rawQuery(
//       'SELECT MAX(id) as lastId FROM shopping',
//     );

//     if (result.isNotEmpty && result.first['lastId'] != null) {
//       return result.first['lastId'] as int; // Get the last ID
//     }
//     return 0; // Return 0 if no records exist
//   }
// }
