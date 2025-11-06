import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';

class OtpTextWidget extends StatelessWidget {
  final String phoneNumber;
  const OtpTextWidget({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            StringsManager.otpTitle,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: AppSize.s30),
          Text(
            StringsManager.otpSubTitle + phoneNumber,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
