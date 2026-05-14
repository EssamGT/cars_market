import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';

class CustomElevatedButtonDecoration {
  static ButtonStyle customElevatedButtonStyle({
    required BuildContext context,
    required bool isSelected,
    required double width,
    required bool error,
  }) {
    return ElevatedButton.styleFrom(
      minimumSize: Size(width, AppSize.s45),
      maximumSize: Size(width, AppSize.s45),
      backgroundColor: isSelected
          ? Theme.of(context).primaryColor
          : Theme.of(context).colorScheme.surfaceContainerHighest,

      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.s8,
        vertical: AppSize.s14,
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        side: BorderSide(
          color: isSelected
              ? Theme.of(context).primaryColor
              : error
              ? Theme.of(context).colorScheme.error
              : Theme.of(context).colorScheme.outline,
          width: AppSize.s0_5,
        ),
      ),
    );
  }

  static ButtonStyle customElevatedButtonStyle2({
    required BuildContext context,
    required bool isSelected,
    required double width,
    required bool error,
  }) {
    return ElevatedButton.styleFrom(
      // minimumSize: Size(width, AppSize.s45),
      // maximumSize: Size(width, AppSize.s45),
      backgroundColor: isSelected
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.surfaceContainerHighest,

      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.s18,
        vertical: AppSize.s12,
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s30),
        side: BorderSide(
          color: isSelected
              ? Theme.of(context).primaryColor
              : error
              ? Theme.of(context).colorScheme.error
              : Theme.of(context).colorScheme.surfaceContainerHighest,
          width: AppSize.s0_5,
        ),
      ),
    );
  }

  static ButtonStyle customElevatedButtonStyleNonSelectable({
    required BuildContext context,
    required double width,
    required bool error,
  }) {
    return ElevatedButton.styleFrom(
      minimumSize: Size(width, AppSize.s45),
      maximumSize: Size(width, AppSize.s55),
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,

      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.s8,
        vertical: AppSize.s14,
      ),
      // shadowColor: Theme.of(context).colorScheme.shadow,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        side: BorderSide(
          color: error
              ? Theme.of(context).colorScheme.error
              : Theme.of(context).colorScheme.surfaceContainerHighest,
          width: AppSize.s0_5,
        ),
      ),
    );
  }

  static ButtonStyle customElevatedbuttonStyleFeaturesPage({
    required BuildContext context,
    required double width,
  }) {
    return ElevatedButton.styleFrom(
      minimumSize: Size(width, AppSize.s65),
      maximumSize: Size(width, AppSize.s65),
      backgroundColor: Theme.of(context).colorScheme.primary,
      overlayColor: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.s8,
        vertical: AppSize.s14,
      ),
      //  elevation: AppSize.s2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: AppSize.s0_5,
        ),
      ),
    );
  }

  static ButtonStyle customElevatedbuttonStyleFeatures({
    required BuildContext context,
    required double width,
  }) {
    return customElevatedButtonStyleNonSelectable(
      context: context,
      width: width,
      error: false,
    ).copyWith(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary.withAlpha(120),
            width: AppSize.s0_5,
          ),
        ),
      ),
    );
  }
}
