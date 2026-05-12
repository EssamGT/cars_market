part of 'sell_cubit.dart';

@immutable
sealed class SellState {}

final class AddInitial extends SellState {}

class FuelTypeSelected extends SellState {}

class NewCoditionSelected extends SellState {}

class EditMainLoading extends SellState {}

class EditMainSuccess extends SellState {}

class MaxImagesLimitReached extends SellState {
  final int imagesLimit;
  MaxImagesLimitReached({this.imagesLimit = 10});
}

class UploadingError extends SellState {
  final Failure error;
  UploadingError(this.error);
}

class UploadingSuccess extends SellState {}

class UploadingLoading extends SellState {}
