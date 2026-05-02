part of 'favorites_cubit.dart';

sealed class FavoritesState {}

final class FavoritesCubitInitial extends FavoritesState {}

class Loading extends FavoritesState {}

class Error extends FavoritesState {
  Failure failure;
  Error({required this.failure});
}

class Success extends FavoritesState {
  List<CarEntity> favCars;
  Success({required this.favCars});
}
