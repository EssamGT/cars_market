import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/whatsapp_message.dart';
import 'package:flutter/material.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:shared_ui/shared_widgets/buttons/one_selected_button.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class WhatsAppMessageWidget extends StatefulWidget {
  const WhatsAppMessageWidget({super.key});

  @override
  State<WhatsAppMessageWidget> createState() => _WhatsAppMessageWidgetState();
}

class _WhatsAppMessageWidgetState extends State<WhatsAppMessageWidget> {
  @override
  Widget build(BuildContext context) {
    SellCubit cubit = SellCubit.get(context);
    return OneSelectedButton<WhatsAppMessage>(
      label: StringsManager.whatsappMessageLabel,
      currentValue: cubit.car.whatsappMessage,
      values: WhatsAppMessage.values
          .where((e) => e != WhatsAppMessage.none)
          .toList(),
      labelBuilder: (e) => e.getConditionText(),
      onSelected: (value) {
        cubit.setWahtsaapMessage(value);
      },
      validator: (value) => TextFieldValidator.validateNormal(
        TextFieldValidationType.whatsappMessage,
        value?.getConditionText() ?? "",
      ),
    );
  }
}
