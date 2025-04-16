// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorite_bloc.dart';

enum FavoriteStatus { initial, loading, success, error }

extension FavoriteStatusX on FavoriteStatus {
  bool get isInitial => this == FavoriteStatus.initial;
  bool get isLoading => this == FavoriteStatus.loading;
  bool get isSuccess => this == FavoriteStatus.success;
  bool get isError => this == FavoriteStatus.error;
}

class FavoriteState {
  final FavoriteStatus status;
  final List<ShoppingModel> favoriteItems;

  const FavoriteState({
    this.status = FavoriteStatus.initial,
    this.favoriteItems = const [],
  });

  FavoriteState copyWith({
    FavoriteStatus? status,
    List<ShoppingModel>? favoriteItems,
  }) {
    return FavoriteState(
      status: status ?? this.status,
      favoriteItems: favoriteItems ?? this.favoriteItems,
    );
  }
}
