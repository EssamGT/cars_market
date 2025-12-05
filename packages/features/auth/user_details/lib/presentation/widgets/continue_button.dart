import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/buttons/text_button.dart';
import 'package:user_details/presentation/cubit/user_details_cubit.dart';
import 'package:user_details/presentation/user_details_screen.dart';

class ContinueButton extends StatelessWidget {
  final bool loading;
  const ContinueButton({super.key, required this.loading});

  @override
  Widget build(BuildContext context) {
    var cubit = UserDetailsCubit.get(context);
    return SizedBox(
      height: AppSize.s100,
      child: CTextButton(
        loading: loading ,
        onTap: () {
          if (formKey.currentState!.validate()) {
            cubit.confirmUserDetails();
          }
        },
        text: StringsManager.cnext,
        // enable: loading,
      ),
    );
  }
}
