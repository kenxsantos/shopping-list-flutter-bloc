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
