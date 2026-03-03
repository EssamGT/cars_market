import 'package:cars_market/di/di.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search/presentation/cubit/search_screen_cubit.dart';
import 'package:search/presentation/widgets/filter_screen/widgets/filter_body_type_widget.dart';
import 'package:search/presentation/widgets/filter_screen/widgets/filter_brand_model_widget.dart';
import 'package:search/presentation/widgets/filter_screen/widgets/filter_color_widget.dart';
import 'package:search/presentation/widgets/filter_screen/widgets/filter_engine_capacity_widget.dart';
import 'package:search/presentation/widgets/filter_screen/widgets/filter_fuel_type_widget.dart';
import 'package:search/presentation/widgets/filter_screen/widgets/filter_transmission_type_widget.dart';
import 'package:search/presentation/widgets/filter_screen/widgets/filter_km_widget.dart';
import 'package:search/presentation/widgets/filter_screen/widgets/filter_location_widget.dart';
import 'package:search/presentation/widgets/filter_screen/widgets/filter_paint_condition_widget.dart';
import 'package:search/presentation/widgets/filter_screen/widgets/filter_screen_app_bar.dart';
import 'package:search/presentation/widgets/filter_screen/widgets/price_filter_widget.dart';
import 'package:search/presentation/widgets/filter_screen/widgets/save_buttons.dart';
import 'package:search/presentation/widgets/filter_screen/widgets/year_filter_widget.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<SearchScreenCubit>(),
      child: Scaffold(
        appBar: const FilterScreenAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Form(
              key: formKey,
              child: Column(
                spacing: AppSize.s20,
                children: [
                  FilterBrandModelWidget(),
                  YearFilterWidget(),
                  PriceFilterWidget(),
                  FilterLocationWidget(),
                  FilterKmWidget(),
                  FilterGearBoxTypeWidget(),
                  FilterFuelTypeWidget(),
                  FilterBodyTypeWidget(),
                  FilterEngineCapacityWidget(),
                  FilterColorWidget(),
                  FilterPaintConditionWidget(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SaveButtons(formKey: formKey),
      ),
    );
  }
}
