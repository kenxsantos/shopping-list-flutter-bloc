// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_bloc.dart';

enum CategoryStatus { initial, loading, success, error, selected }

extension CategoryStateX on CategoryStatus {
  bool get isInitial => this == CategoryStatus.initial;
  bool get isLoading => this == CategoryStatus.loading;
  bool get isSuccess => this == CategoryStatus.success;
  bool get isError => this == CategoryStatus.error;
  bool get isSelected => this == CategoryStatus.selected;
}

class CategoryState extends Equatable {
  const CategoryState({
    this.status = CategoryStatus.initial,
    this.categories = const [],
    this.selectedCategory = '',
  });
  final CategoryStatus status;
  final List<String> categories;
  final String selectedCategory;

  @override
  List<Object?> get props => [status, categories, selectedCategory];

  CategoryState copyWith({
    CategoryStatus? status,
    List<String>? categories,
    String? selectedCategory,
  }) {
    return CategoryState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}
