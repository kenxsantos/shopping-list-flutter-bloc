import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:dartactivity/shopping/models/shopping_model.dart';

class ShoppingRepository {
  final List<ShoppingModel> _items = [];
  List<ShoppingModel> _filteredItems = [];

  Future<List<ShoppingModel>> fetchItems() async {
    _filteredItems.clear();
    await Future.delayed(Duration(milliseconds: 500));
    return List.from(_items);
  }

  Future<List<ShoppingModel>> fetchFilteredItems() async {
    await Future.delayed(Duration(milliseconds: 500));
    return List.from(_filteredItems);
  }

  Future<void> addItem(ShoppingModel item) async {
    _items.add(item);
  }

  Future<void> updateItem(
    String id,
    String newName,
    String newTag,
    bool isFavorite,
  ) async {
    final index = _items.indexWhere((item) => item.id == id);
    if (index != -1) {
      _items[index] = ShoppingModel(
        id: id,
        name: newName,
        tag: newTag,
        isFavorite: isFavorite,
      );
    }
  }

  Future<void> deleteItem(String id) async {
    _items.removeWhere((item) => item.id == id);
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

  Future<void> printShoppingList(
    List<ShoppingModel> items,
    String choose,
  ) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/shopping_list_$choose.txt';
      final file = File(filePath);

      final newPath = '/storage/emulated/0/Download/shopping_list_$choose.txt';

      if (file.existsSync()) {
        await file.writeAsString('');
      }

      final header = 'Shopping List:\n';
      final content = items
          .asMap()
          .entries
          .map((entry) {
            final index = entry.key + 1;
            final item = entry.value;
            return '$index. ID: ${item.id}, Name: ${item.name}, Favorite: ${item.isFavorite ? "Yes" : "No"}';
          })
          .join('\n');

      await file.writeAsString(header + content);
      await file.copy(newPath);

      print(
        'List saved successfully to:\n- App Directory: $filePath\n- Public Directory: $newPath',
      );
    } catch (e) {
      print('Error saving list: $e');
    }
  }
}
