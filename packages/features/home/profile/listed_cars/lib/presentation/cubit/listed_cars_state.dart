part of 'listed_cars_cubit.dart';

@immutable
sealed class ListedCarsState {}

final class ListedCarsInitial extends ListedCarsState {}

final class ListedCarsLoaded extends ListedCarsState {
  final List<CarEntity> listedCars;
  ListedCarsLoaded(this.listedCars);
}

final class ListedCarsError extends ListedCarsState {
  final Failure failure;
  ListedCarsError(this.failure);
}

final class ListedCarErrorPopUp extends ListedCarsState {
  final Failure failure;
  ListedCarErrorPopUp(this.failure);
}

final class ListedCarsLoading extends ListedCarsState {}

final class ListedPopUpLoading extends ListedCarsState {}
