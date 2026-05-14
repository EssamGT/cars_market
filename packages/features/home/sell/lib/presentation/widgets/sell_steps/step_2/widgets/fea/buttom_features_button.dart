import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/buttons/elevated_button_decoration.dart';

class ButtomFeaturesButton extends StatelessWidget {
  const ButtomFeaturesButton({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      color: Colors.transparent,
      height: size.height * 0.08,
      width: size.width - AppSize.s40,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        style:
            CustomElevatedButtonDecoration.customElevatedbuttonStyleFeaturesPage(
              context: context,
              width: size.width - AppSize.s40,
            ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          StringsManager.save,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
