part of 'all_list_bloc.dart';

enum AllListStatus { initial, loading, success, error }

extension AllListStateX on AllListStatus {
  bool get isInitial => this == AllListStatus.initial;
  bool get isLoading => this == AllListStatus.loading;
  bool get isSuccess => this == AllListStatus.success;
  bool get isError => this == AllListStatus.error;
}

class AllListState extends Equatable {
  final AllListStatus status;
  final List<ShoppingModel> items;

  const AllListState({required this.status, this.items = const []});

  @override
  List<Object?> get props => [status, items];

  AllListState copyWith({AllListStatus? status, List<ShoppingModel>? items}) {
    return AllListState(
      status: status ?? this.status,
      items: items ?? this.items,
    );
  }
}
