import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/buttons/text_button.dart';

class ContinueButton extends StatelessWidget {
  final bool enable;
  const ContinueButton({super.key, required this.enable});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s100,
      child: CTextButton(
        onTap: () {},
        text: StringsManager.cnext,
        enable: enable,
      ),
    );
  }
}
