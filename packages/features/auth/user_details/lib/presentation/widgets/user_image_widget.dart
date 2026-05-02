import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:redacted/redacted.dart';

class UserImageWidget extends StatelessWidget {
  final bool loading;
  const UserImageWidget({super.key, required this.loading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p14),
      child: Center(
        child: SizedBox(
          height: AppSize.s140,
          child: CircleAvatar(
            radius: 60,
            child: Icon(Icons.person, size: AppSize.s60),
          ).redacted(context: context, redact: loading),
        ),
      ),
    );
  }
}
