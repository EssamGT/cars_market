import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:sell/presentation/widgets/sell_steps/step_2/widgets/fea/features_selection_page.dart';
import 'package:shared_ui/shared_widgets/buttons/elevated_button_decoration.dart';
import 'package:shared_ui/shared_widgets/pop_up/pop_up.dart';

class FeaturesButton extends StatefulWidget {
  const FeaturesButton({super.key});

  @override
  State<FeaturesButton> createState() => _FeaturesButtonState();
}

class _FeaturesButtonState extends State<FeaturesButton> {
  @override
  Widget build(BuildContext context) {
    var cubit = SellCubit.get(context);
    Size size = MediaQuery.of(context).size;
    double buttonWidth = size.width - AppSize.s24;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
          child: Text(
            StringsManager.featuresLabel,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),

        ElevatedButton(
          style:
              CustomElevatedButtonDecoration.customElevatedbuttonStyleFeatures(
                context: context,
                width: buttonWidth,
              ),
          onPressed: () async {
            await customBottomNavigation(context, FeaturesSelectionPage());
            setState(() {});
          },
          child: SizedBox(
            width: buttonWidth - AppSize.s16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringsManager.featuresHint,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: cubit.car.features.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
            child: Text(
              "${cubit.getSelectedFeaturesCount()} ${StringsManager.featuresSelected}",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
      ],
    );
  }
}


