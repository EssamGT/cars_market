import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/payment_options.dart';
import 'package:flutter/material.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:shared_ui/shared_widgets/buttons/selection_page_button.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class PaymentOptionsWidget extends StatelessWidget {
  const PaymentOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SellCubit cubit = getIt.get<SellCubit>();
    return SelectionPageButton<PaymentOptions>(
      values: PaymentOptions.values
          .where((e) => e != PaymentOptions.none)
          .toList(),
      currentValue: cubit.car.paymentOptions,
      dialogAppBarTitle: StringsManager.nonePaymentLabel,
      emptyPage: StringsManager.noResultsFound,
      hint: StringsManager.nonePaymentLabel,
      label: StringsManager.paymentOptionsLabel,
      onSelected: (PaymentOptions paymentOptions) =>
          cubit.setPaymentOptions(paymentOptions),
      search: true,
      labelBuilder: (e) => e.getText,
      validator: (value)=> TextFieldValidator.validateNormal(
        TextFieldValidationType.paymentOptions,
        value?.getText ?? "",
      )
    );
  }
}
