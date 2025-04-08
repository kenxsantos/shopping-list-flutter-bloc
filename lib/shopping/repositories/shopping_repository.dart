import 'dart:convert';
import 'dart:io';
import 'package:dartactivity/shopping/bloc/shopping_state.dart';
import 'package:dartactivity/shopping/utils/shopping_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dartactivity/shopping/models/shopping_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingRepository {
  List<ShoppingModel> _items = [];
  List<ShoppingModel> _filteredItems = [];

  Future<void> _saveItemsToStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedItems = jsonEncode(
      _items.map((item) => item.toJson()).toList(),
    );
    await prefs.setString('shopping_list', encodedItems);
    print("Updated SharedPreferences: $encodedItems");
  }

  Future<List<ShoppingModel>> fetchItems() async {
    _filteredItems.clear();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? encodedItems = prefs.getString('shopping_list');
    if (encodedItems != null && encodedItems.isNotEmpty) {
      _items =
          (jsonDecode(encodedItems) as List)
              .map((json) => ShoppingModel.fromJson(json))
              .toList();
    } else {
      _items = [];
    }
    await Future.delayed(const Duration(milliseconds: 500));
    return List.unmodifiable(_items);
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
      await _saveItemsToStorage();
    }

    return List.unmodifiable(_filteredItems);
  }

  Future<void> addItem(ShoppingModel item) async {
    _items.add(item);
    _filteredItems.add(item);
    await Future.delayed(const Duration(milliseconds: 500));
    await _saveItemsToStorage();
  }

  Future<void> updateItem(ShoppingModel updatedItem) async {
    final index = _items.indexWhere((item) => item.id == updatedItem.id);
    if (index != -1) {
      _items[index] = updatedItem;
      await Future.delayed(const Duration(milliseconds: 500));
      await _saveItemsToStorage();
    }
  }

  Future<void> deleteItem(ShoppingModel deletedItems) async {
    _items.removeWhere((item) => item.id == deletedItems.id);
    _filteredItems.removeWhere((item) => item.id == deletedItems.id);
    await Future.delayed(const Duration(milliseconds: 500));
    await _saveItemsToStorage();
  }

  Future<List<ShoppingModel>> _sortItems(
    int Function(ShoppingModel a, ShoppingModel b) comparator,
  ) async {
    _items.sort(comparator);
    _filteredItems.sort(comparator);

    if (_filteredItems.isEmpty) {
      await Future.delayed(const Duration(milliseconds: 500));
      return List.from(_items);
    }
    return List.from(_filteredItems);
  }

  Future<List<ShoppingModel>> sortByName() async {
    return _sortItems(
      (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
    );
  }

  Future<List<ShoppingModel>> sortByDate() async {
    return _sortItems((a, b) => a.id.compareTo(b.id));
  }

  Future<List<ShoppingModel>> filterBy(String category) async {
    _filteredItems = _items.where((item) => item.tag == category).toList();
    await Future.delayed(const Duration(milliseconds: 500));
    return List.from(_filteredItems);
  }

  Future<void> updateState(
    ShoppingModel item,
    ShoppingState state,
    Emitter<ShoppingState> emit,
  ) async {
    if (state is ShoppingListFiltered) {
      emit(ShoppingListFiltered(await fetchFilteredItems(item)));
    } else {
      emit(ShoppingListLoaded(await fetchItems()));
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
