import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';

Widget loadingC(BuildContext context) {
  return Center(
    child: CircularProgressIndicator(
      color: Theme.of(context).colorScheme.primary,
      strokeWidth: AppSize.s1,
      constraints: BoxConstraints(minWidth: AppSize.s40, minHeight: AppSize.s40),
    ),
  );
}
