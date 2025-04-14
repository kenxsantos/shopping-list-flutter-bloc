part of 'category_bloc.dart';

class CategoryEvent extends Equatable {
  const CategoryEvent();
  @override
  List<Object?> get props => [];
}

class GetCategories extends CategoryEvent {}

class SelectCategory extends CategoryEvent {
  const SelectCategory({required this.category});
  final String category;
  @override
  List<Object?> get props => [category];
}

//Filter List By Category
class ListByCategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetListByCategory extends ListByCategoryEvent {
  GetListByCategory({required this.categoryName});
  final String categoryName;

  @override
  List<Object?> get props => [categoryName];
}
