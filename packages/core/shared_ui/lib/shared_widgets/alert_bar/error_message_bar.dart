import 'package:another_flushbar/flushbar.dart';
import 'package:constants/color_manager.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';

/// to do error and  success
enum MessageBarType { success, error, warning }

class MessageBar {
  MessageBar({
    required BuildContext context,
    required String message,
    MessageBarType type = MessageBarType.error,
  });

  static void show(
    BuildContext context,
    String message, [
    MessageBarType type = MessageBarType.error,
  ]) {
    Flushbar(
      // titleText: Text(
      //   getTitle(type, context),
      //   style: Theme.of(
      //     context,
      //   ).textTheme.bodyLarge!.copyWith(color: getColor(type)),
      // ),
      boxShadows: [
        BoxShadow(
          color: Theme.of(context).colorScheme.shadow.withAlpha(50),
          // spreadRadius: 0.2,
          blurRadius: 2,
          blurStyle: BlurStyle.outer,
        ),
      ],
      messageText: Text(
        message,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(color: getColor(type)),
      ),
      duration: const Duration(seconds: 5),
      isDismissible: true,
      margin: const EdgeInsets.all(AppPadding.p12),
      borderRadius: BorderRadius.circular(AppSize.s30),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      icon: getIcon(type),
    ).show(context);
  }
}

Icon getIcon(MessageBarType type) {
  switch (type) {
    case MessageBarType.success:
      return Icon(Icons.done, color: getColor(type));
    case MessageBarType.error:
      return Icon(Icons.error, color: getColor(type));

    case MessageBarType.warning:
      return Icon(Icons.warning, color: getColor(type));
  }
}

String getTitle(MessageBarType type, BuildContext context) {
  switch (type) {
    case MessageBarType.success:
      return StringsManager.success;
    case MessageBarType.error:
      return StringsManager.error;

    case MessageBarType.warning:
      return StringsManager.warning;
  }
}

Color getColor(MessageBarType type) {
  switch (type) {
    case MessageBarType.success:
      return ColorManager.onSuccess;
    case MessageBarType.error:
      return ColorManager.error;
    case MessageBarType.warning:
      return ColorManager.warning;
  }
}
