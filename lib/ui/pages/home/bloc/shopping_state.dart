part of 'shopping_bloc.dart';

enum ShoppingStatus { initial, loading, success, error }

enum CategoryStatus { initial, loading, success, error, selected }

extension ShoppingStateX on ShoppingStatus {
  bool get isInitial => this == ShoppingStatus.initial;
  bool get isLoading => this == ShoppingStatus.loading;
  bool get isSuccess => this == ShoppingStatus.success;
  bool get isError => this == ShoppingStatus.error;
}

class ShoppingAllListState extends Equatable {
  const ShoppingAllListState({
    this.status = ShoppingStatus.initial,
    this.items = const [],
  });
  final ShoppingStatus status;
  final List<ShoppingModel> items;

  @override
  List<Object?> get props => [status, items];

  ShoppingAllListState copyWith({
    ShoppingStatus? status,
    List<ShoppingModel>? items,
  }) {
    return ShoppingAllListState(
      status: status ?? this.status,
      items: items ?? this.items,
    );
  }
}
