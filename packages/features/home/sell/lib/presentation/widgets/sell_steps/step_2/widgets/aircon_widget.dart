import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/air_con_types.dart';
import 'package:flutter/material.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:shared_ui/shared_widgets/buttons/new_selection_page_button.dart';

class AirConWidget extends StatelessWidget {
  const AirConWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    SellCubit cubit = getIt.get<SellCubit>();
    return NewSelectionPageButton<AirConTypes>(
      values: AirConTypes.values.where((e) => e != AirConTypes.none).toList(),
      currentValue: cubit.car.airConType,
      dialogAppBarTitle: StringsManager.selectAircon,
      emptyPage: StringsManager.noResultsFound,
      hint: StringsManager.selectAircon,
      label: StringsManager.acTypeLabel,
      onSelected: (AirConTypes airConType) => cubit.setAirConType(airConType),
      search: true,
      labelBuilder: (e) => e.getText,
    );
  }
}
