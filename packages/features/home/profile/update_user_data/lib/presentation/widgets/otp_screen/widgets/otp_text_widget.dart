import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';

class OtpTextWidget extends StatelessWidget {
  final String phoneNumber;
  const OtpTextWidget({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( 
        left: AppPadding.p5,
        right: AppPadding.p5,
        top: AppPadding.p10,
        bottom: AppPadding.p40,
        ),
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
