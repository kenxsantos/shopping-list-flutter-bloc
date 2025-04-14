class ShoppingModel {
  final int? id;
  final String name;
  final String tag;
  final bool isFavorite;

  ShoppingModel({
    this.id,
    required this.name,
    required this.tag,
    required this.isFavorite,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'tag': tag,
      'isFavorite': isFavorite ? 1 : 0,
    };
  }

  factory ShoppingModel.fromJson(Map<String, dynamic> json) {
    try {
      return ShoppingModel(
        id: json['id'] as int?,
        name: json['name'] ?? '',
        tag: json['tag'] ?? '',
        isFavorite: (json['isFavorite'] ?? 0) == 1,
      );
    } catch (e) {
      print("Error parsing ShoppingModel: $e");
      throw FormatException("Invalid ShoppingModel JSON: $json");
    }
  }
}
