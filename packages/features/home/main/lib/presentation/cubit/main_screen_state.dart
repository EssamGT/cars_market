part of 'main_screen_cubit.dart';

@immutable
sealed class MainScreenState {}

final class MainScreenInitial extends MainScreenState {}

final class MainScreenLoading extends MainScreenState {}

final class MainScreenFailure extends MainScreenState {
  final Failure failure;
  MainScreenFailure(this.failure);
}

final class MainScreenCars extends MainScreenState {
  final List<CarEntity> cars;
  MainScreenCars(this.cars);
}
