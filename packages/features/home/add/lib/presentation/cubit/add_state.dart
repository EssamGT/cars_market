part of 'add_cubit.dart';

@immutable
sealed class AddState {}

final class AddInitial extends AddState {}

class Search extends AddState {}

// ignore: must_be_immutable
class BrandSlected extends AddState {}

// ignore: must_be_immutable
class ModelSlected extends AddState {}

class BodyTypeSlected extends AddState {}

class FuelTypeSlected extends AddState {}

class GearboxTypeSlected extends AddState {}

class PaintColorSlected extends AddState {}

class PainCondetionSlected extends AddState {}

class SafetyOptionsSlected extends AddState {}

// ignore: must_be_immutable
class UploadingError extends AddState {
  String errorMessage;
  UploadingError(this.errorMessage);
}

class UploadingSuccess extends AddState {}

class UploadingLoading extends AddState {}

// ignore: must_be_immutable
class ImagesSelected extends AddState {
  List<XFile> images;
  ImagesSelected(this.images);
}

class EmptyImages extends AddState {}

class EmptyErrorImages extends AddState {}

// ignore: must_be_immutable
class LessThan3ErrorImages extends AddState {
  List<XFile> images;
  LessThan3ErrorImages(this.images);
}

// ignore: must_be_immutable
// class ValidateBrand extends AddState {}

// // ignore: must_be_immutable
// class ValidateModel extends AddState {}

// class ValidateDesc extends AddState {}

// class ValidateYear extends AddState {}
