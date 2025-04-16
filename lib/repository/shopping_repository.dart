import 'package:dartactivity/repository/models/shopping_model.dart';
import 'package:dartactivity/utils/enum_tags.dart';
import 'package:dartactivity/utils/shopping_database.dart';
import 'package:dartactivity/utils/shopping_helper.dart';

class ShoppingListRepository {
  final ShoppingDatabase dbHelper = ShoppingDatabase.instance;

  Future<List<ShoppingModel>> getItems() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('shopping');
    return maps.map((json) => ShoppingModel.fromJson(json)).toList();
  }

  Future<List<String>> getCategories() async {
    return GroceryCategory.values.map((category) {
      return ShoppingHelper().formatCategory(category);
    }).toList();
  }

  Future<List<ShoppingModel>> getItemsByCategory(String category) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'shopping',
      where: 'tag = ?',
      whereArgs: [category],
    );
    try {
      if (category == 'All') {
        return getItems();
      }
      return maps.map((json) => ShoppingModel.fromJson(json)).toList();
    } catch (e) {
      print("Error converting database rows to ShoppingModel: $e");
      rethrow;
    }
  }

  Future<List<ShoppingModel>> addItem(
    ShoppingModel item,
    String category,
  ) async {
    final db = await dbHelper.database;
    await db.insert('shopping', item.toMap());
    return getItemsByCategory(category);
  }

  Future<List<ShoppingModel>> updateItem(
    ShoppingModel item,
    String category,
  ) async {
    final db = await dbHelper.database;
    await db.update(
      'shopping',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
    return getItemsByCategory(category);
  }

  Future<List<ShoppingModel>> deleteItem(
    int id,
    ShoppingModel item,
    String category,
  ) async {
    final db = await dbHelper.database;
    await db.delete('shopping', where: 'id = ?', whereArgs: [id]);
    return getItemsByCategory(category);
  }

  Future<List<ShoppingModel>> getFavorites() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'shopping',
      where: 'isFavorite = ?',
      whereArgs: [1],
    );
    return maps.map((json) => ShoppingModel.fromJson(json)).toList();
  }

  Future<List<ShoppingModel>> searchItem(String item) async {
    final db = await dbHelper.database;
    final searchKeyword = '%$item%';
    final data = await db.query(
      'shopping',
      where: 'name COLLATE NOCASE LIKE ? OR tag COLLATE NOCASE LIKE ?',
      whereArgs: [searchKeyword, searchKeyword],
    );
    return List.generate(data.length, (i) => ShoppingModel.fromJson(data[i]));
  }

  Future<List<ShoppingModel>> sortItem(String sortType, String category) async {
    final db = await dbHelper.database;
    final orderBy = sortType == "name" ? "name" : "id";

    if (category == "All") {
      final List<Map<String, dynamic>> maps = await db.query(
        'shopping',
        orderBy: orderBy,
      );
      return maps.map((json) => ShoppingModel.fromJson(json)).toList();
    } else {
      final List<Map<String, dynamic>> maps = await db.query(
        'shopping',
        where: 'tag = ?',
        orderBy: orderBy,
        whereArgs: [category],
      );
      return maps.map((json) => ShoppingModel.fromJson(json)).toList();
    }
  }

  Future<List<ShoppingModel>> getFavoriteItems() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'shopping',
      where: 'isFavorite = ?',
      whereArgs: [1],
    );
    return maps.map((json) => ShoppingModel.fromJson(json)).toList();
  }
}
