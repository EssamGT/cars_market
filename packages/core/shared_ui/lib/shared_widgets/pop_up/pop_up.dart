import 'package:flutter/material.dart';

Future<T?> rightPopUpScreen<T>({
  required BuildContext context,
  required Widget child,
}) {
  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Dismiss',
    barrierColor: Colors.black.withAlpha(130), // background dim
    transitionDuration: const Duration(milliseconds: 350),
    pageBuilder: (_, animation, secondaryAnimation) {
      return child; // actual UI is in transitionBuilder
    },
    transitionBuilder: (_, animation, secondaryAnimation, _) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0), // from right
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
        child: FadeTransition(opacity: animation, child: child),
      );
    },
  );
}

Future<T?> bottomPopUpScreen<T>({
  required BuildContext context,
  required Widget child,
}) {
  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Dismiss',
    barrierColor: Colors.black.withAlpha(130), // background dim
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



customRightNavigation(BuildContext context, Widget child) {
  return Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
    ),
  );
}

customBottomNavigation(BuildContext context, Widget child) {
  return Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.1), // from bottom
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
    ),
  );
}
