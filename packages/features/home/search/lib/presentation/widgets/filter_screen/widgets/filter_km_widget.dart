import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:search/presentation/cubit/search_screen_cubit.dart';
import 'package:shared_ui/shared_widgets/text_field/filter_normal_text_field.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class FilterKmWidget extends StatelessWidget {
  const FilterKmWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SearchScreenCubit cubit = SearchScreenCubit.get(context);
    return DoubleFilterTextField(
      title: StringsManager.kmLabel,
      initValue1: cubit.searchModel.minKm,
      initValue2: cubit.searchModel.maxKm,
      type1: FilterTextFieldValidationType.minKm,
      type2: FilterTextFieldValidationType.maxKm,
      hint1: StringsManager.min,
      hint2: StringsManager.max,
      onChanged1: (value) => cubit.setMinKm(value),
      onChanged2: (value) => cubit.setMaxKm(value),
      keyboardType: TextInputType.number,
    );
  }
}
