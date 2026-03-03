import 'package:data/models/car/brands_models/body_types.dart';
import 'package:data/models/car/brands_models/brands.dart';
import 'package:data/models/car/brands_models/car_models.dart';
import 'package:data/models/car/brands_models/fuel_type.dart';
import 'package:data/models/car/brands_models/paint_colors.dart';
import 'package:data/models/car/brands_models/transmission_type.dart';
import 'package:data/models/car/car_filter_model.dart';
import 'package:data/models/failure/failure.dart';
import 'package:data/models/location/location_model.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:search/domain/use_case/search_use_case.dart';
import 'package:storage/cache/prefs_helper.dart';

part 'search_screen_state.dart';

@lazySingleton
class SearchScreenCubit extends Cubit<SearchScreenState> {
  final SearchUseCase searchUseCase;
  final PrefsHelper prefsHelper;
  SearchScreenCubit(this.searchUseCase, this.prefsHelper)
    : super(SearchScreenInitial()) {
    carCatalog = prefsHelper.getCarCatalog().forFilter();
    locationCatalog = prefsHelper.getLocationCatalog().locationsCatalog
      ..insert(0, LocationModel.all());
    searchModel = CarFilterModel();
  }
  late List<CarBrand> carCatalog;
  late List<LocationModel> locationCatalog;
  late CarFilterModel searchModel;
  static SearchScreenCubit get(BuildContext context) =>
      BlocProvider.of(context);
  // old Search
  List<Object> cachedSearch = [];
  List<Object> searchSuggestions = [];

  void onSearchChanged(String query) {
    if (query.isEmpty && searchSuggestions.isNotEmpty) {
      searchSuggestions.clear();
      emit(SearchState(searchSuggestions));
      return;
    }
    final results = <Object>[];
    final lowerQuery = query.toLowerCase();

    for (final brand in carCatalog) {
      final brandMatches = brand.name.toLowerCase().contains(lowerQuery);
      // If brand matches, add the brand
      if (brandMatches) {
        results.add(brand);
      }

      // Check for matching models
      for (final model in brand.models) {
        if (model.getFullName().toLowerCase().startsWith(lowerQuery) ||
            model.name.toLowerCase().startsWith(lowerQuery)) {
          results.add(model);
        }
      }
    }
    searchSuggestions = results;
    emit(SearchState(searchSuggestions));
  }

  Future<void> onSearchSelected(int index) async {
    emit(SearchLoading());
    final selected = searchSuggestions[index];
    setCarForSearch(selected);
    final result = await searchUseCase.search(searchModel.toRequest());
    result.fold(
      (fail) {
        emit(SearchFailure(fail));
      },
      (suc) {
        emit(SearchSuccess(suc));
      },
    );
  }

  void filterSearch() {
    emit(SearchLoading());
    searchUseCase.search(searchModel.toRequest()).then((result) {
      result.fold(
        (fail) {
          emit(SearchFailure(fail));
        },
        (suc) {
          emit(SearchSuccess(suc));
        },
      );
    });
  }

  void resetFilter() {
    searchModel.reset();
  }

  void setCarForSearch(Object car) {
    if (car is CarBrand) {
      setCarBrand(car);
    } else if (car is CarModel) {
      setCarModel(car);
    }
  }

  void setCarBrand(CarBrand brand) {
    searchModel.setCarBrand(brand);
  }

  void setCarModel(CarModel model) {
    searchModel.setCarModel(model);
  }

  void setLocation(LocationModel location) {
    searchModel.location = location;
  }

  void setFuelType(FuelType fuelType) {
    searchModel.fuelType = fuelType;
  }

  void setTransmissionType(TransmissionType transmissionType) {
    searchModel.transmissionType = transmissionType;
  }

  void setBodyType(CarBodyType bodyType) {
    searchModel.bodyType = bodyType;
  }

  void setPaintColor(PaintColors paintColor) {
    searchModel.paintColor = paintColor;
  }

  void setPaintCondition(PaintConditions paintCondition) {
    searchModel.paintCondition = paintCondition;
  }

  void setMinYear(String minYear) {
    searchModel.minYear = minYear;
  }

  void setMaxYear(String maxYear) {
    searchModel.maxYear = maxYear;
  }

  void setMinPrice(String minPrice) {
    searchModel.minPrice = minPrice;
  }

  void setMaxPrice(String maxPrice) {
    searchModel.maxPrice = maxPrice;
  }

  void setMaxKm(String maxKm) {
    searchModel.maxKm = maxKm;
  }

  void setMinKm(String minKm) {
    searchModel.minKm = minKm;
  }
}
