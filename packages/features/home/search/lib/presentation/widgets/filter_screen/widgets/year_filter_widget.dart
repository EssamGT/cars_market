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
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FilterNormalTextField(
          carFilter: SearchScreenCubit.get(context).carFilterModel,
          title: StringsManager.dyear,
          maxLength: 4,
          width: size.width * 0.44,
          price: false,
          counter: false,
          format: false,
          validationType: TextFieldValidationType.year,
          hint: StringsManager.min,
          type: FilterNormalTextFieldType.minYear,
        ),
        FilterNormalTextField(
          carFilter: SearchScreenCubit.get(context).carFilterModel,
          maxLength: 4,
          width: size.width * 0.44,
          price: false,
          counter: false,
          format: false,
          validationType: TextFieldValidationType.year,
          hint: StringsManager.max,
          type: FilterNormalTextFieldType.maxYear,
        ),
      ],
    );
  }
}
