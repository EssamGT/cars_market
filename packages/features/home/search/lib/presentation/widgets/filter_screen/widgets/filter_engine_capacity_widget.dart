// import 'package:constants/strings_manager.dart';
import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:search/presentation/cubit/search_screen_cubit.dart';
import 'package:shared_ui/shared_widgets/text_field/filter_normal_text_field.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';
// import 'package:search/presentation/cubit/search_screen_cubit.dart';
// import 'package:shared_ui/shared_widgets/text_field/filter_normal_text_field.dart';
// import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class FilterEngineCapacityWidget extends StatelessWidget {
  const FilterEngineCapacityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SearchScreenCubit cubit = SearchScreenCubit.get(context);
    return DoubleFilterTextField(
      title: StringsManager.engineCapacity,
      initValue1: cubit.searchModel.minEngineCapacity,
      initValue2: cubit.searchModel.maxEngineCapacity,
      type1: FilterTextFieldValidationType.minEngineCapacity,
      type2: FilterTextFieldValidationType.maxEngineCapacity,
      maxLength: 4,
      hint1: StringsManager.min,
      hint2: StringsManager.max,
      onChanged1: (value) => cubit.setMinEngineCapacity(value),
      onChanged2: (value) => cubit.setMaxEngineCapacity(value),
      keyboardType: TextInputType.number,
      format: false,
    );
  }
}
