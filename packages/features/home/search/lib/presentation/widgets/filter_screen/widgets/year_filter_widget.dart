import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:search/presentation/cubit/search_screen_cubit.dart';
import 'package:shared_ui/shared_widgets/text_field/filter_normal_text_field.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class YearFilterWidget extends StatelessWidget {
  const YearFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterNormalTextField(
          carFilter: SearchScreenCubit.get(context).carFilterModel,
          title: StringsManager.yearLabel,
          maxLength: 4,
          width: size.width * 0.44,
          format: false,
          validationType: TextFieldValidationType.minYear,
          hint: StringsManager.min,
          keyboardType: TextInputType.number,
          type: FilterNormalTextFieldType.minYear,
        ),
        FilterNormalTextField(
          carFilter: SearchScreenCubit.get(context).carFilterModel,
          maxLength: 4,
          width: size.width * 0.44,
          format: false,
          validationType: TextFieldValidationType.maxYear,

          hint: StringsManager.max,
          keyboardType: TextInputType.number,
          type: FilterNormalTextFieldType.maxYear,
        ),
      ],
    );
  }
}
