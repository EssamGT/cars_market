

import 'package:data/models/car/car_filter_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_screen_state.dart';

class SearchScreenCubit extends Cubit<SearchScreenState> {
  SearchScreenCubit() : super(SearchScreenInitial());
  static SearchScreenCubit get (BuildContext context) => BlocProvider.of(context);
  CarFilterModel carFilterModel = CarFilterModel();
}
