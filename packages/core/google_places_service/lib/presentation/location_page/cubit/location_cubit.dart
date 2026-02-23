import 'package:data/models/failure/failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_places_service/domain/entity/google_maps_entity.dart';
import 'package:google_places_service/domain/usecase/gps_use_case.dart';
import 'package:injectable/injectable.dart';

part 'location_state.dart';

@injectable
class LocationCubit extends Cubit<LocationState> {
  GpsUseCase useCase;
  @factoryMethod
  LocationCubit(this.useCase) : super(LocationInitial());
  static LocationCubit get(BuildContext context) => BlocProvider.of(context);
  Future<void> search(String query) async {
    // emit(Loading());
    final result = await useCase.autoComplete(query);
    result.fold(
      (failure) {
        emit(Error(failure));
      },
      (data) async {
        // data.predictions.removeWhere((prediction) {
        //   final types = prediction.types;
        //   for (var type in types) {
        //     if (blockedTypes.contains(type)) {
        //       return true;
        //     }
        //   }
        //   return false;
        // });
        emit(Success(data));
      },
    );
  }
}
