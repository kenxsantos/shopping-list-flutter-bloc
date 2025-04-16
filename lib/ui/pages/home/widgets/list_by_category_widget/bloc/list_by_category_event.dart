part of 'list_by_category_bloc.dart';

class ListByCategoryEvent extends Equatable {
  const ListByCategoryEvent();
  @override
  List<Object?> get props => [];
}

class GetAllListsEvent extends ListByCategoryEvent {
  @override
  List<Object?> get props => [];
}

class GetListByCategory extends ListByCategoryEvent {
  const GetListByCategory({required this.categoryName});
  final String categoryName;

  @override
  List<Object?> get props => [categoryName];
}

class ShoppingAddItem extends ListByCategoryEvent {
  const ShoppingAddItem({required this.item});
  final ShoppingModel item;
  @override
  List<Object?> get props => [item];
}

class ShoppingDeleteItem extends ListByCategoryEvent {
  const ShoppingDeleteItem({required this.id, required this.item});
  final int id;
  final ShoppingModel item;
  @override
  List<Object?> get props => [id, item];
}

class ShoppingUpdateItem extends ListByCategoryEvent {
  const ShoppingUpdateItem({required this.item});
  final ShoppingModel item;
  @override
  List<Object?> get props => [item];
}

class SearchItem extends ListByCategoryEvent {
  const SearchItem({required this.searchText});
  final String searchText;
  @override
  List<Object?> get props => [searchText];
}

class SortItem extends ListByCategoryEvent {
  const SortItem({required this.sortType});
  final String sortType;
  @override
  List<Object?> get props => [sortType];
}
