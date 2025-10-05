import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';

class LoginPageText extends StatelessWidget {
  const LoginPageText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: AppSize.s10,
      children: [
        Text(StringsManager.welcome,style: Theme.of(context).textTheme.titleLarge,),
        Text(StringsManager.loginTO,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(height: AppSize.s10,)
      ],
    );
  }
}