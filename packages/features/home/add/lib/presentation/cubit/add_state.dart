part of 'add_cubit.dart';

@immutable
sealed class AddState {}

final class AddInitial extends AddState {}

class Search extends AddState {}

// ignore: must_be_immutable
class BrandSlected extends AddState {
  String brand;
  BrandSlected(this.brand);
}

// ignore: must_be_immutable
class ModelSlected extends AddState {
  String model;
  ModelSlected(this.model);
}

// ignore: must_be_immutable
class ValidateBrand extends AddState {}

// ignore: must_be_immutable
class ValidateModel extends AddState {}

class ValidateDesc extends AddState {}

class ValidateYear extends AddState {}
