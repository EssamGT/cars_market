part of 'car_edit_cubit.dart';

@immutable
sealed class CarEditState {}

final class AddInitial extends CarEditState {}

class FuelTypeSlected extends CarEditState {}

class NewCoditionSelected extends CarEditState {}

class MaxImagesLimitReached extends CarEditState {
  final int imagesLimit;
  MaxImagesLimitReached({this.imagesLimit = 10});
}

class UploadingError extends CarEditState {
  final String errorMessage;
  UploadingError(this.errorMessage);
}

class UploadingSuccess extends CarEditState {}

class UploadingLoading extends CarEditState {}
