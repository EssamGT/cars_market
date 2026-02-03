import 'package:flutter/material.dart';
import 'package:search/presentation/cubit/search_screen_cubit.dart';
import 'package:shared_ui/shared_widgets/text_field/filter_brand_model_button.dart';

class FilterBrandModelWidget extends StatelessWidget {
  const FilterBrandModelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [FilterTextFieldButtonBrandAndModel(car: SearchScreenCubit.get(context).carFilterModel)],
    );
  }
}
