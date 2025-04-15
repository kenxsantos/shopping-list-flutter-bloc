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
      return maps.map((json) => ShoppingModel.fromJson(json)).toList();
    } catch (e) {
      print("Error converting database rows to ShoppingModel: $e");
      rethrow;
    }
  }

  Future<List<ShoppingModel>> addItem(ShoppingModel item) async {
    final db = await dbHelper.database;
    await db.insert('shopping', item.toMap());
    return getItemsByCategory(item.tag);
  }

  Future<List<ShoppingModel>> updateItem(ShoppingModel item) async {
    final db = await dbHelper.database;
    await db.update(
      'shopping',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
    return getItemsByCategory(item.tag);
  }

  Future<List<ShoppingModel>> deleteItem(int id, ShoppingModel item) async {
    final db = await dbHelper.database;
    await db.delete('shopping', where: 'id = ?', whereArgs: [id]);
    return getItemsByCategory(item.tag);
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
}
