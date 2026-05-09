import 'package:cars_market/globle/globle.dart';
import 'package:data/models/failure/failure.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:listed_cars/domain/usecase/listed_cars_use_case.dart';

part 'listed_cars_state.dart';

@lazySingleton
class ListedCarsCubit extends Cubit<ListedCarsState> {
  ListedCarsUseCase useCase;

  ListedCarsCubit(this.useCase) : super(ListedCarsInitial()) {
    getListedCars();
  }
  static ListedCarsCubit get(BuildContext context) =>
      BlocProvider.of<ListedCarsCubit>(context);
  Future<void> getListedCars() async {
    emit(ListedCarsLoading());
    final result = await useCase.getListedCars(userData.listedCarsIds);
    result.fold(
      (failure) => emit(ListedCarsError(failure)),
      (cars) => emit(ListedCarsLoaded(cars)),
    );
  }
}
