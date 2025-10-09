import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';

class CreateAccountText extends StatelessWidget {
  const CreateAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( 
        left:  AppPadding.p16,
        right:  AppPadding.p16,
        bottom:  AppPadding.p40,
        ),
      child: Row(
        children: [
          Text(StringsManager.cYourAccount,style: Theme.of(context).textTheme.displayMedium,)
        ],
      ),
    );
  }
}