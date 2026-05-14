import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:search/presentation/cubit/search_screen_cubit.dart';
import 'package:shared_ui/shared_widgets/text_field/filter_normal_text_field.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class YearFilterWidget extends StatelessWidget {
  const YearFilterWidget({super.key});
  @override
  Widget build(BuildContext context) {
    SearchScreenCubit cubit = SearchScreenCubit.get(context);
    return DoubleFilterTextField(
      title: StringsManager.yearLabel,
      initValue1: cubit.searchModel.minYear,
      initValue2: cubit.searchModel.maxYear,
      hint1: StringsManager.min,
      hint2: StringsManager.max,
      type1: FilterTextFieldValidationType.minYear,
      type2: FilterTextFieldValidationType.maxYear,
      onChanged1: (value) => cubit.setMinYear(value),
      onChanged2: (value) => cubit.setMaxYear(value),
      maxLength: 4,
      format: false,
      keyboardType: TextInputType.number,
    );
  }
}
