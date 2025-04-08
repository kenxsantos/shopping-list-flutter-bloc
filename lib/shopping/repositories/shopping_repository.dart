import 'dart:io';
import 'package:dartactivity/shopping/bloc/shopping_state.dart';
import 'package:dartactivity/shopping/utils/shopping_database.dart';
import 'package:dartactivity/shopping/utils/shopping_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dartactivity/shopping/models/shopping_model.dart';
import 'package:sqflite/sqflite.dart';

class ShoppingRepository {
  List<ShoppingModel> _filteredItems = [];
  final ShoppingDatabase dbHelper = ShoppingDatabase.instance;

  Future<void> addItem(ShoppingModel item) async {
    final db = await dbHelper.database;
    await db.insert(
      'shopping',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    _filteredItems.add(item);
  }

  Future<List<ShoppingModel>> getItems() async {
    _filteredItems.clear();
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('shopping');
    return List.generate(maps.length, (i) => ShoppingModel.fromJson(maps[i]));
  }

  Future<void> updateItem(ShoppingModel item) async {
    final db = await dbHelper.database;
    await db.update(
      'shopping',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  Future<void> deleteItem(int id) async {
    final db = await dbHelper.database;
    await db.delete('shopping', where: 'id = ?', whereArgs: [id]);
    _filteredItems.removeWhere((item) => item.id == id);
    await Future.delayed(const Duration(milliseconds: 500));
  }

  Future<List<ShoppingModel>> fetchFilteredItems(
    ShoppingModel updatedItem,
  ) async {
    final index = _filteredItems.indexWhere(
      (item) => item.id == updatedItem.id,
    );
    if (index != -1) {
      _filteredItems[index] = updatedItem;
      await Future.delayed(const Duration(milliseconds: 500));
    }
    return List.unmodifiable(_filteredItems);
  }

  Future<List<ShoppingModel>> sortByName() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'shopping',
      orderBy: 'LOWER(name) ASC',
    );

    _filteredItems.sort(
      (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
    );

    if (_filteredItems.isEmpty) {
      await Future.delayed(const Duration(milliseconds: 500));
      return List.generate(maps.length, (i) => ShoppingModel.fromJson(maps[i]));
    }
    return List.from(_filteredItems);
  }

  Future<List<ShoppingModel>> sortByDate() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'shopping',
      orderBy: 'id ASC',
    );

    _filteredItems.sort((a, b) => a.id.compareTo(b.id));

    if (_filteredItems.isEmpty) {
      await Future.delayed(const Duration(milliseconds: 500));
      return List.generate(maps.length, (i) => ShoppingModel.fromJson(maps[i]));
    }
    return List.from(_filteredItems);
  }

  Future<List<ShoppingModel>> filterBy(String category) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'shopping',
      where: 'tag = ?',
      whereArgs: [category],
    );
    _filteredItems = List.generate(
      maps.length,
      (i) => ShoppingModel.fromJson(maps[i]),
    );
    print("Filtered Items: $_filteredItems");
    return List.unmodifiable(_filteredItems);
  }

  Future<void> updateState(
    ShoppingModel item,
    ShoppingState state,
    Emitter<ShoppingState> emit,
  ) async {
    if (state is ShoppingListFiltered) {
      emit(ShoppingListFiltered(await fetchFilteredItems(item)));
      print("List Filtered State: $state");
    } else {
      emit(ShoppingListLoaded(await getItems()));
      print("List Loaded State: $state");
    }
  }

  Future<void> printShoppingList(
    List<ShoppingModel> items,
    String format,
    String type,
  ) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final fileName = 'shopping_list.$format';
      final filePath = '${directory.path}/$fileName';
      final publicPath =
          '/storage/emulated/0/Download/shopping_list_$type.$format';
      final file = File(filePath);
      if (file.existsSync()) {
        await file.writeAsString('');
      }

      final content =
          format == 'txt'
              ? ShoppingHelper().generateTextContent(items)
              : ShoppingHelper().generateCsvContent(items);
      await file.writeAsString(content);
      await file.copy(publicPath);
    } catch (e) {
      print('Error saving list: $e');
      throw Exception(e);
    }
  }
}
