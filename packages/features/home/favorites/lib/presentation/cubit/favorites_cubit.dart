import 'package:cars_market/globle/globle.dart';
import 'package:data/models/failure/failure.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:favorites/domain/usecase/fav_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
part 'favorites_state.dart';

@lazySingleton
class FavoritesCubit extends Cubit<FavoritesState> {
  FavUseCase useCase;
  FavoritesCubit(this.useCase) : super(FavoritesCubitInitial()) {
    getFavCars(userData.favoriteCarsIds);
  }
  FavoritesCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getFavCars(List<String> favCarsIds) async {
    emit(Loading());
    final res = await useCase.getFavCars(favCarsIds);
    res.fold(
      (cars) => emit(Success(favCars: cars)),
      (failure) => emit(Error(failure: failure)),
    );
  }
}
