class ShoppingModel {
  final String id;
  final String name;
  final String tag;
  final bool isFavorite;

  ShoppingModel({
    required this.id,
    required this.name,
    required this.tag,
    required this.isFavorite,
  });

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'tag': tag, 'isFavorite': isFavorite};
  }

  factory ShoppingModel.fromJson(Map<String, dynamic> json) {
    return ShoppingModel(
      id: json['id'],
      name: json['name'],
      tag: json['tag'],
      isFavorite: json['isFavorite'],
    );
  }
}
