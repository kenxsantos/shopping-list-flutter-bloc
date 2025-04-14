part of 'list_by_category_bloc.dart';

enum ListByCategoryStatus { initial, loading, success, error }

extension ListByCategoryStatusX on ListByCategoryStatus {
  bool get isInitial => this == ListByCategoryStatus.initial;
  bool get isLoading => this == ListByCategoryStatus.loading;
  bool get isSuccess => this == ListByCategoryStatus.success;
  bool get isError => this == ListByCategoryStatus.error;
}

class ListByCategoryState extends Equatable {
  const ListByCategoryState({
    this.status = ListByCategoryStatus.initial,
    this.items = const [],
    this.selectedCategory = 'All Categories',
  });
  final ListByCategoryStatus status;
  final List<ShoppingModel> items;
  final String selectedCategory;

  @override
  List<Object?> get props => [status, items, selectedCategory];

  ListByCategoryState copyWith({
    ListByCategoryStatus? status,
    List<ShoppingModel>? items,
    String? selectedCategory,
  }) {
    return ListByCategoryState(
      status: status ?? this.status,
      items: items ?? this.items,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}
