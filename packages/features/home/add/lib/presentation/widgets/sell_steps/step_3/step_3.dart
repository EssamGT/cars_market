import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:add/presentation/widgets/sell_steps/step_3/widgets/d_text_field.dart';
import 'package:add/presentation/widgets/sell_steps/step_3/widgets/loading_screen.dart';
import 'package:add/presentation/widgets/sell_steps/step_3/widgets/location_text_field.dart';
import 'package:add/presentation/widgets/sell_steps/step_3/widgets/negotiable.dart';
import 'package:add/presentation/widgets/sell_steps/step_3/widgets/price_text_field.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Step3 extends StatelessWidget {
  const Step3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: BlocListener<AddCubit, AddState>(
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
              errorMessage: state.errorMessage,
            );
          }
        },
        child: Column(
          spacing: AppSize.s10,
          children: [
            PriceTextField(),
            Negotiable(),
            DTextField(),
            LocationTextField(),
          ],
        ),
      ),
    );
  }
}
