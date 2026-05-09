import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/interior_type.dart';
import 'package:flutter/material.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:shared_ui/shared_widgets/buttons/selection_page_button.dart';

class InteriorTypeWidget extends StatelessWidget {
  const InteriorTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SellCubit cubit = getIt.get<SellCubit>();
    return SelectionPageButton<InteriorType>(
      values: InteriorType.values.where((e) => e != InteriorType.none).toList(),
      currentValue: cubit.car.interiorType,
      dialogAppBarTitle: StringsManager.selectInteriorType,
      emptyPage: StringsManager.noResultsFound,
      hint: StringsManager.selectInteriorType,
      label: StringsManager.interiorTypeLabel,
      onSelected: (InteriorType interiorType) =>
          cubit.setInteriorType(interiorType),
      search: true,
      labelBuilder: (e) => e.getText,
    );
  }
}
