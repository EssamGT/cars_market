import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:search/presentation/cubit/search_screen_cubit.dart';
import 'package:shared_ui/shared_widgets/text_field/filter_normal_text_field.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class PriceFilterWidget extends StatelessWidget {
  const PriceFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SearchScreenCubit cubit = SearchScreenCubit.get(context);
    return DoubleFilterTextField(
      title: StringsManager.priceLabel,
      initValue1: cubit.searchModel.minPrice,
      initValue2: cubit.searchModel.maxPrice,
      type1: FilterTextFieldValidationType.minPrice,
      type2: FilterTextFieldValidationType.maxPrice,
      onChanged1: (value) => cubit.setMinPrice(value),
      onChanged2: (value) => cubit.setMaxPrice(value),
      keyboardType: TextInputType.number,
    );
  }
}
