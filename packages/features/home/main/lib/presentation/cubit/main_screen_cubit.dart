import 'package:data/models/failure/failure.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:main/domain/usecase/main_screen_use_case.dart';

part 'main_screen_state.dart';

@lazySingleton
class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenUseCase useCase;
  MainScreenCubit(this.useCase) : super(MainScreenInitial()) {
    getMainScreenCars();
  }
  MainScreenCubit get(BuildContext context) => BlocProvider.of(context);
  Future getMainScreenCars() async {
    emit(MainScreenLoading());
    final result = await useCase.getMainScreenCars();
    result.fold(
      (failure) => emit(MainScreenFailure(failure)),
      (cars) => emit(MainScreenCars(cars)),
    );
  }
}
