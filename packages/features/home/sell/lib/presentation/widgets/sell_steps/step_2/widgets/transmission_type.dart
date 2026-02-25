import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/transmission_type.dart';
import 'package:flutter/material.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:shared_ui/shared_widgets/buttons/one_selected_button.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class TransmissionTypeWidget extends StatelessWidget {
  const TransmissionTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SellCubit cubit = getIt<SellCubit>();
    return OneSelectedButton<TransmissionType>(
      label: StringsManager.transmissionTypeLabel,
      currentValue: cubit.car.transmissionType,
      values: TransmissionType.values
          .where((e) => e != TransmissionType.none)
          .toList(),
      labelBuilder: (e) => e.getTransmissionTypeName(),
      onSelected: (value) {
        cubit.setTransmissionType(value);
      },
      validator: (value) => TextFieldValidator.validateNormal(
        TextFieldValidationType.transmissionType,
        value?.getTransmissionTypeName() ?? "",
      ),
    );
  }
}
