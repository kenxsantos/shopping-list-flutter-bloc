part of 'shopping_bloc.dart';

class ShoppingEvent extends Equatable {
  const ShoppingEvent();
  @override
  List<Object?> get props => [];
}

class AddItem extends ShoppingEvent {
  const AddItem({required this.item});
  final ShoppingModel item;
  @override
  List<Object?> get props => [item];
}

class DeleteItem extends ShoppingEvent {
  const DeleteItem({required this.item});
  final String item;
  @override
  List<Object?> get props => [item];
}

class UpdateItem extends ShoppingEvent {
  const UpdateItem({required this.item});
  final ShoppingModel item;
  @override
  List<Object?> get props => [item];
}

class ShoppingAllListEvent extends ShoppingEvent {
  @override
  List<Object?> get props => [];
}

class ShoppingGetListByCategory extends ShoppingEvent {
  const ShoppingGetListByCategory({required this.categoryName});
  final String categoryName;

  @override
  List<Object?> get props => [categoryName];
}
