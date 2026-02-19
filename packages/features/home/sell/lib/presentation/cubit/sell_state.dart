part of 'sell_cubit.dart';

@immutable
sealed class SellState {}

final class AddInitial extends SellState {}

class FuelTypeSlected extends SellState {}

class NewCoditionSelected extends SellState {}

class MaxImagesLimitReached extends SellState {
  final int imagesLimit;
  MaxImagesLimitReached({this.imagesLimit = 10});
}

class UploadingError extends SellState {
  final String errorMessage;
  UploadingError(this.errorMessage);
}

class UploadingSuccess extends SellState {}

class UploadingLoading extends SellState {}
