import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search/presentation/cubit/search_screen_cubit.dart';
import 'package:search/presentation/widgets/filter_screen/widgets/filter_body_type_widget.dart';
import 'package:search/presentation/widgets/filter_screen/widgets/filter_brand_model_widget.dart';
import 'package:search/presentation/widgets/filter_screen/widgets/filter_color_widget.dart';
import 'package:search/presentation/widgets/filter_screen/widgets/filter_engine_capacity_widget.dart';
import 'package:search/presentation/widgets/filter_screen/widgets/filter_fuel_type_widget.dart';
import 'package:search/presentation/widgets/filter_screen/widgets/filter_geay_box_type_widget.dart';
import 'package:search/presentation/widgets/filter_screen/widgets/filter_km_widget.dart';
import 'package:search/presentation/widgets/filter_screen/widgets/filter_location_widget.dart';
import 'package:search/presentation/widgets/filter_screen/widgets/filter_paint_condition_widget.dart';
import 'package:search/presentation/widgets/filter_screen/widgets/filter_screen_app_bar.dart';
import 'package:search/presentation/widgets/filter_screen/widgets/price_filter_widget.dart';
import 'package:search/presentation/widgets/filter_screen/widgets/year_filter_widget.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FilterScreenAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: BlocProvider<SearchScreenCubit>(
            create: (context) => SearchScreenCubit(),
            child: Column(
              spacing: AppSize.s20,
              children: [
                FilterBrandModelWidget(),
                YearFilterWidget(),
                PriceFilterWidget(),
                // to do location filter
                FilterLocationWidget(),
                FilterKmWidget(),
                FilterFuelTypeWidget(),
                FilterGearBoxTypeWidget(),
                FilterBodyTypeWidget(),
                FilterEngineCapacityWidget(),
                FilterColorWidget(),
                FilterPaintConditionWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
