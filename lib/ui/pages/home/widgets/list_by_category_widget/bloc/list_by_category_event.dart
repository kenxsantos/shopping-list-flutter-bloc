part of 'list_by_category_bloc.dart';

class ListByCategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAllListsEvent extends ListByCategoryEvent {
  @override
  List<Object?> get props => [];
}

class GetListByCategory extends ListByCategoryEvent {
  GetListByCategory({required this.categoryName});
  final String categoryName;

  @override
  List<Object?> get props => [categoryName];
}
