import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:add/presentation/widgets/sell_steps/step_1/widgets/brand_slection.dart';
import 'package:constants/strings_manager.dart' show StringsManager;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_ui/shared_widgets/pop_up/pop_up.dart';
import 'package:shared_ui/shared_widgets/text_field/text_field_button.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_filed_validate.dart';

class ModelButton extends StatelessWidget {
  const ModelButton({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AddCubit.get(context);
    return BlocBuilder<AddCubit, AddState>(
      buildWhen: (previous, current) {
        if (current is BrandSlected ||
            current is ModelSlected ||
            current is ValidateModel) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        return TextFieldButton(
          onPressed: () async {
            cubit.car.brand.isNotEmpty
                ? popUpScreen(
                    context: context,
                    child: BlocProvider.value(
                      value: AddCubit.get(context),
                      child: BrandSlection(type: SearchCarType.model),
                    ),
                  )
                : popUpScreen(
                    context: context,
                    child: BlocProvider.value(
                      value: AddCubit.get(context),
                      child: BrandSlection(type: SearchCarType.brand),
                    ),
                  );
          },
          // hint: StringsMA,
          validationType: TextFieldValidationType.model,
          title: StringsManager.model,
          gvalue: cubit.car.model,
        );
      },
    );
  }
}
