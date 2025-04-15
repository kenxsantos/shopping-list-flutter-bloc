// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_by_category_bloc.dart';

enum ListByCategoryStatus { initial, loading, success, error, allItems }

extension ListByCategoryStatusX on ListByCategoryStatus {
  bool get isInitial => this == ListByCategoryStatus.initial;
  bool get isLoading => this == ListByCategoryStatus.loading;
  bool get isSuccess => this == ListByCategoryStatus.success;
  bool get isError => this == ListByCategoryStatus.error;
  bool get isAllItems => this == ListByCategoryStatus.allItems;
}

class ListByCategoryState extends Equatable {
  const ListByCategoryState({
    this.status = ListByCategoryStatus.initial,
    this.items = const [],
    this.selectedCategory = '',
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
