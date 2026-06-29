import '../../domain/usecase/car_listing_use_case.dart';
import 'package:cars_market/globle/globle.dart';
import 'package:data/models/failure/failure.dart';
import 'package:data/models/user/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'car_listing_state.dart';

@singleton
class CarListingCubit extends Cubit<CarListingState> {
  final CarListingUseCase useCase;
  CarListingCubit(this.useCase) : super(CarListingInitial());
  Future<void> getUserData(String userId) async {
    emit(UserDataLoading());
    final result = await useCase.getUserData(userId);
    result.fold(
      (failure) => emit(UserDataError(failure: failure)),
      (userData) => emit(UserDataLoaded(userData: userData)),
    );
  }

  Future<void> newView(String carId, String carUserId) async {
    if (userData.id != carUserId) {
      await useCase.view(carId, userData.id);
    }
  }

  Future<void> lead(String carId, String carUserId) async {
    if (userData.id != carUserId) {
      await useCase.lead(carId, userData.id);
    }
  }
}
