import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';

class TextFieldButtonDecoration {
  static double textFieldButtonHeight = AppSize.s55;
  static InputDecoration textfieldButtonInputDecoration(BuildContext context) {
    return InputDecoration(
      hintText: StringsManager.choose,
      alignLabelWithHint: true,
      hintStyle: Theme.of(context).textTheme.labelLarge,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.outline,
          width: AppSize.s0_5,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.outline,
          width: AppSize.s0_5,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.outline,
          width: AppSize.s0_5,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      prefixIcon: Icon(
        Icons.car_crash_rounded,
        color: Theme.of(context).colorScheme.primary,
        size: AppSize.s24,
      ),
      suffixIcon: Icon(
        Icons.arrow_forward_ios_sharp,
        color: Theme.of(context).colorScheme.primary,
        size: AppSize.s20,
      ),
    );
  }

  static InputDecoration textfieldInputDecoration(
    BuildContext context,
    String hint, {
    bool price = false,
  }) {
    return InputDecoration(
      prefixIcon: price
          ? Icon(
              Icons.attach_money,
              color: Theme.of(context).colorScheme.outline,
            )
          : null,
      hintText: hint,
      hintStyle: Theme.of(context).textTheme.labelLarge,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.outline,
          width: AppSize.s0_5,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.outline,
          width: AppSize.s0_5,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
    );
  }
}
