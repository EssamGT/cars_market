import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/safety.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/text_field/text_field_button.dart';

class SafetyOptions extends StatelessWidget {
  const SafetyOptions({super.key});

  @override
  Widget build(BuildContext context) {
  return TextFieldButton(
      cubit: getIt.get<AddCubit>(),
      givenList: safetyOptions,
      title: StringsManager.safetyOptions,
      inPageTitle: StringsManager.safetyOptions,
      type: TextFieldButtonType.safetyOptions,
    );
  }
}

  // var cubit = AddCubit.get(context);
  //   return BlocBuilder<AddCubit, AddState>(
  //     buildWhen: (previous, current) {
  //       if (current is SafetyOptionsSlected) {
  //         return true;
  //       } else {
  //         return false;
  //       }
  //     },
  //     builder: (context, state) {
  //       return TextFieldButton(
  //         car: getIt.get<AddCubit>().car,
  //         type: TextFieldButtonType.safetyOptions,
  //         onPressed: () async {
  //           (await popUpScreen(
  //                 context: context,
  //                 child: BlocProvider.value(
  //                   value: AddCubit.get(context),

  //                   child: OptionsSelectionPage(
  //                     search: false,
  //                     givenList: safetyOptions,
  //                     title: StringsManager.safetyOptions,
  //                     emptyPage: "",
  //                   ),
  //                 ),
  //               )) ??
  //               "";

  //           // cubit.setBodyType(selected);
  //         },

  //         title: StringsManager.safetyOptions,
  //         gvalue:
  //             "${cubit.car.safetyOptions.length} ${StringsManager.safetyOptionsSelected}",

  //         validationType: TextFieldValidationType.none,
  //       );
  //     },
  //   );