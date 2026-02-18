import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/negotiation.dart';
import 'package:flutter/material.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:shared_ui/shared_widgets/buttons/new_one_selected_button.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class NegotiableWidget extends StatefulWidget {
  const NegotiableWidget({super.key});

  @override
  State<NegotiableWidget> createState() => _NegotiableWidgetState();
}

class _NegotiableWidgetState extends State<NegotiableWidget> {
  @override
  Widget build(BuildContext context) {
    SellCubit cubit = SellCubit.get(context);
    return NewOneSelectedButton<NegotiationType>(
      label: StringsManager.negotiableLabel,
      currentValue: cubit.car.negotiable,
      values: NegotiationType.values
          .where((e) => e != NegotiationType.none)
          .toList(),
      labelBuilder: (e) => e.getConditionText(),
      onSelected: (value) {
        cubit.setNegotiationType(value);
      },
      validator: (value) => TextFieldValidator.validateNormal(
        TextFieldValidationType.negotiable,
        value?.getConditionText() ?? "",
      ),
    );
  }
}
