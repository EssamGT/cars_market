import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';

Future<bool> showExitDialog(BuildContext context) async {
  return await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            StringsManager.confirmExitLab,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          content: Text(
            StringsManager.confirmExitSub,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          actionsAlignment: MainAxisAlignment.start,
          actions: [
            TextButton(
              onPressed: () => false,
              child: Text(
                StringsManager.cancel,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            TextButton(
              onPressed: () => true,
              child: Text(
                StringsManager.exit,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ) ??
      false; // default to false if null
}
