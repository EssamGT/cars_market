import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:sell/presentation/widgets/sell_steps/step_3/widgets/description_text_field.dart';
import 'package:sell/presentation/widgets/sell_steps/step_3/widgets/loading_screen.dart';
import 'package:sell/presentation/widgets/sell_steps/step_3/widgets/location_text_field.dart';
import 'package:sell/presentation/widgets/sell_steps/step_3/widgets/negotiable_widget.dart';
import 'package:sell/presentation/widgets/sell_steps/step_3/widgets/payment_options_widget.dart';
import 'package:sell/presentation/widgets/sell_steps/step_3/widgets/price_text_field.dart';
import 'package:sell/presentation/widgets/sell_steps/step_3/widgets/whatsapp_message_widget.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Step3 extends StatelessWidget {
  const Step3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
      child: BlocListener<SellCubit, SellState>(
        listener: (context, state) {
          if (state is UploadingLoading) {
            PopUpManager.show(context: context, type: PopupType.loading);
          }
          if (state is UploadingSuccess) {
            PopUpManager.show(context: context, type: PopupType.success);
          }
          if (state is UploadingError) {
            PopUpManager.show(
              context: context,
              type: PopupType.error,
              errorMessage: state.error.message,
            );
          }
        },
        child: Column(
          key: ValueKey('step_3'),
          spacing: AppSize.s10,
          children: [
            PriceTextField(),
            NegotiableWidget(),
            PaymentOptionsWidget(),
            LocationTextField(),
            WhatsAppMessageWidget(),
            DescriptionTextField(),
          ],
        ),
      ),
    );
  }
}
