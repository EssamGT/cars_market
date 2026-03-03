import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/brands_models/body_types.dart';
import 'package:flutter/material.dart';
import 'package:search/presentation/cubit/search_screen_cubit.dart';
import 'package:shared_ui/shared_widgets/buttons/selection_page_button.dart';

class FilterBodyTypeWidget extends StatelessWidget {
  const FilterBodyTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SearchScreenCubit cubit = SearchScreenCubit.get(context);
    return SelectionPageButton<CarBodyType>(
      values: CarBodyType.values,
      currentValue: cubit.searchModel.bodyType,
      search: true,
      dialogAppBarTitle: StringsManager.selectCarBodyType,
      emptyPage: StringsManager.noCarBodyTypesFound,
      hint: StringsManager.selectCarBodyType,
      label: StringsManager.carBodyTypeLabel,
      onSelected: (CarBodyType bodyType) => cubit.setBodyType(bodyType),

      labelBuilder: (e) => e.getCarBodyTypeName(true),
      onlyInPageLeading: true,
      leadingBuilder: (e) {
        return Icon(e.getCarBodyTypeIcon(), size: AppSize.s40);
      },
    );
  }
}
