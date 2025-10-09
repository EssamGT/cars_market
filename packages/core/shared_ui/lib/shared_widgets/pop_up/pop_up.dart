import 'package:flutter/material.dart';

Future<T?> popUpScreen<T>({
  required BuildContext context,
  required Widget child,
}) {
  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Dismiss',
    barrierColor: Colors.black.withOpacity(0.5), // background dim
    transitionDuration: const Duration(milliseconds: 350),
    pageBuilder: (_, animation, secondaryAnimation) {
      return child; // actual UI is in transitionBuilder
    },
    transitionBuilder: (_, animation, secondaryAnimation, _) {
      return SlideTransition(
        position:
            Tween<Offset>(
              begin: const Offset(0, 1), // from bottom
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOutCirc),
            ),
        child: FadeTransition(opacity: animation, child: child),
      );
    },
  );
}
