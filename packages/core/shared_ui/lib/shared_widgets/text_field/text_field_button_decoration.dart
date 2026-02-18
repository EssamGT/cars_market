import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';

class TextFieldButtonDecoration {
  // static double textFieldButtonHeight = AppSize.s55;
  static InputDecoration textfieldButtonInputDecoration(
    BuildContext context, {
    bool error = false,
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p8,
        vertical: AppPadding.p14,
      ),
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
          color: error
              ? Theme.of(context).colorScheme.error
              : Theme.of(context).colorScheme.outline,
          width: AppSize.s0_5,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: error
              ? Theme.of(context).colorScheme.error
              : Theme.of(context).colorScheme.outline,
          width: AppSize.s0_5,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      visualDensity: VisualDensity.comfortable,
      isDense: true,
      suffixIcon: Icon(
        Icons.arrow_forward_ios_sharp,
        color: error
            ? Theme.of(context).colorScheme.error
            : Theme.of(context).colorScheme.primary,
        size: AppSize.s20,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
      ),
      errorStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
        color: Theme.of(context).colorScheme.error,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
      ),
    );
  }

  static InputDecoration textfieldInputDecoration(
    BuildContext context,
    String hint, {
    String? prefixText = '',
    bool error = false,
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p8,
        vertical: AppPadding.p14,
      ),

      // prefixIcon: price
      //     ? Icon(
      //         Icons.attach_money,
      //         color: Theme.of(context).colorScheme.outline,
      //       )
      //     : null,
      hintText: hint,
      suffixText: prefixText,
      suffixStyle: Theme.of(context).textTheme.bodyMedium,
      visualDensity: VisualDensity.comfortable,

      hintFadeDuration: const Duration(milliseconds: 300),

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
          color: error
              ? Theme.of(context).colorScheme.error
              : Theme.of(context).colorScheme.outline,
          width: AppSize.s0_5,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: error
              ? Theme.of(context).colorScheme.error
              : Theme.of(context).colorScheme.primary,
          width: AppSize.s0_5,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      errorMaxLines: 2,
      isDense: true,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
      ),
      errorStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
        color: Theme.of(context).colorScheme.error,
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
      ),
    );
  }
}
