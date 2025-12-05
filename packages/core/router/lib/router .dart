import 'package:cars_market/di/di.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:router/routes/routes_list.dart';
import 'package:router/routes_manager.dart';

GoRouter appRouter = createAppRouter();

GoRouter createAppRouter() {
  final initial = getInitialRoute();
  return GoRouter(
    initialLocation: initial,
    routes: [...routes],
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text("404: Page not found"))),
  );
}

String getInitialRoute() {
  var user = getIt<FirebaseAuth>().currentUser;
  if (user == null) {
    return RoutesManager.login;
  }
  user.reload();
  if (user.phoneNumber != null &&
      user.emailVerified &&
      user.displayName != null) {
    return RoutesManager.home;
  }
  if (user.phoneNumber == null &&
          user.emailVerified &&
          user.displayName == null ||
      user.phoneNumber == null ||
      user.emailVerified ||
      user.displayName == null) {
    return RoutesManager.userDetails;
  } else {
    return RoutesManager.login;
  }
}
