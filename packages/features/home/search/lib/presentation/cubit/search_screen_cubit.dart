import 'package:data/models/car/brands_models/brands.dart';
import 'package:data/models/car/brands_models/car_models.dart';
import 'package:data/models/car/car_filter_model.dart';
import 'package:data/models/failure/failure.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:search/domain/use_case/search_use_case.dart';
  // cSpell:disable
import 'package:storage/cache/prefs_helper.dart';

part 'search_screen_state.dart';

@lazySingleton
class SearchScreenCubit extends Cubit<SearchScreenState> {
  final SearchUseCase searchUseCase;
  final PrefsHelper prefsHelper;
  SearchScreenCubit(this.searchUseCase, this.prefsHelper)
    : super(SearchScreenInitial()) {
    carCatalog = prefsHelper.getCarCatalog().toFilterModel().brands;
    searchModel = CarFilterModel();
    searchModel.brand = carCatalog[0];
  }
  late List<CarBrandFilter> carCatalog;
  late CarFilterModel searchModel;
  static SearchScreenCubit get(BuildContext context) =>
      BlocProvider.of(context);
  CarFilterModel carFilterModel = CarFilterModel();
  // old Search
  List<Object> cachedSearch = [];
  List<Object> searchSuggestions = [];

  void onSearchChanged(String query) {
    if (query.isEmpty && searchSuggestions.isNotEmpty) {
      searchSuggestions.clear();
      emit(SearchState(searchSuggestions));
      return;
    }
    print('searching for: $query');
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
    print('found ${results.length} results');
  }

  Future<void> onSearchSelected(int index) async {
    emit(SearchLoading());
    final selected = searchSuggestions[index];
    setCarForSearch(selected);
    final result = await searchUseCase.search(searchModel);
    result.fold(
      (fail) {
        emit(SearchFailure(fail));
      },
      (suc) {
        emit(SearchSuccess(suc));
      },
    );
  }

  void setCarForSearch(Object car) {
    if (car is CarBrandFilter) {
      setCarBrand(car);
    } else if (car is CarModelFilter) {
      setCarModel(car);
    }
  }

  void setCarBrand(CarBrandFilter brand) {
    searchModel.setCarBrand(brand);
  }

  void setCarModel(CarModelFilter model) {
    searchModel.setCarModel(model);
  }
}
