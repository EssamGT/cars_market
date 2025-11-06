import 'package:cars_market/di/di.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:router/routes/routes_list.dart';
import 'package:router/routes_manager.dart';

final appRouter = GoRouter(
  initialLocation: RoutesManager.login,
  // getIt<FirebaseAuth>().currentUser == null
  //     ? RoutesManager.onBoarding
  //     : RoutesManager.home,
  routes: [...routes],
  errorBuilder: (context, state) =>
      const Scaffold(body: Center(child: Text("404: Page not found"))),
);
