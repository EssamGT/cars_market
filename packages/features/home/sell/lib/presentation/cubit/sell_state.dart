part of 'sell_cubit.dart';

@immutable
sealed class SellState {}

final class AddInitial extends SellState {}

class FuelTypeSlected extends SellState {}

class UploadingError extends SellState {
  final String errorMessage;
  UploadingError(this.errorMessage);
}

class UploadingSuccess extends SellState {}

class UploadingLoading extends SellState {}




