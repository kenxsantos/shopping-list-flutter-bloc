import 'package:dartactivity/shopping/models/shopping_model.dart';

class ShoppingRepository {
  final List<ShoppingModel> _items = [];

  Future<List<ShoppingModel>> fetchItems() async {
    await Future.delayed(Duration(milliseconds: 500));
    return List.from(_items);
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

  Future<void> favoriteItem(
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

  Future<List<ShoppingModel>> sortByName() async {
    _items.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    await Future.delayed(Duration(milliseconds: 500));
    return List.from(_items);
  }

  Future<List<ShoppingModel>> sortByDate() async {
    _items.sort((a, b) => a.id.compareTo(b.id));
    await Future.delayed(Duration(milliseconds: 500));
    return List.from(_items);
  }
}
