import 'package:data/models/brands_models/brands.dart';
import 'package:data/models/brands_models/car_models.dart';
import 'package:data/models/car/car_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'add_state.dart';

enum SearchCarType { brand, model }

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(AddInitial()) {
    initList();
  }
  static AddCubit get(BuildContext context) => BlocProvider.of(context);
  CarModel car = CarModel();
  final List<String> sug = allCarBrands;
  List<String> filterdBrands = [];
  List<String> models = [];
  List<String> filterdModels = [];
  initList() {
    filterdBrands = sug;
  }

  void search(String query, SearchCarType type) {
    switch (type) {
      case SearchCarType.brand:
        final result = sug
            .where(
              (allBrands) =>
                  allBrands.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
        filterdBrands = result;
        emit(Search());
      case SearchCarType.model:
        final result = models
            .where(
              (allmodels) =>
                  allmodels.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
        filterdModels = result;
        emit(Search());
    }
  }

  void slectBrand(String brand) {
    emit(BrandSlected(brand));
    car.setBrand = brand;
    search('', SearchCarType.brand);
    models = carModels[brand] ?? [];
    filterdModels = models;
    print(brand);
    print(models);
  }

  void slectModel(String model) {
    emit(ModelSlected(model));
    search('', SearchCarType.model);
    car.setModel = model;

    print(car.brand);
    print(car.model);
  }

  bool step1Validation() {
    if (car.brand.isEmpty) {
      emit(ValidateBrand());
      return false;
    }
    if (car.model.isEmpty) {
      emit(ValidateModel());
      return false;
    }
    if (car.description.isEmpty ||
        car.description.isNotEmpty && car.description.length < 100) {
      print(car.description.length);
      emit(ValidateBrand());
      return false;
    } else {
      // sould be true just for testing
      return true;
      // emit()
    }
  }
}
