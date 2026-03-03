import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/brands_models/transmission_type.dart';
import 'package:flutter/material.dart';
import 'package:search/presentation/cubit/search_screen_cubit.dart';
import 'package:shared_ui/shared_widgets/buttons/one_selected_button.dart';

class FilterGearBoxTypeWidget extends StatelessWidget {
  const FilterGearBoxTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SearchScreenCubit cubit = SearchScreenCubit.get(context);
    return OneSelectedButton<TransmissionType>(
      label: StringsManager.transmissionTypeLabel,
      currentValue: cubit.searchModel.transmissionType,
      values: TransmissionType.values,
      spacing: AppSize.s8,
      labelBuilder: (e) => e.getTransmissionTypeNameForFilter(),
      padding: EdgeInsets.only(bottom: AppPadding.p10),
      onSelected: (TransmissionType value) {
        cubit.setTransmissionType(value);
    
       
      },
    );
  }
}
