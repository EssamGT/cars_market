import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/body_types.dart';
import 'package:flutter/material.dart';
import 'package:search/presentation/cubit/search_screen_cubit.dart';
import 'package:shared_ui/shared_widgets/text_field/filter_text_field_button.dart';

class FilterBodyTypeWidget extends StatelessWidget {
  const FilterBodyTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FilterTextFieldButton(
      title: StringsManager.dBodyType,
      type: FilterTextFieldButtonType.bodyType,
      car: SearchScreenCubit.get(context).carFilterModel,
      givenList: carBodyTypes,
      enable: true,
      inPageTitle: StringsManager.bodyTypes,
    );
    
  }
}