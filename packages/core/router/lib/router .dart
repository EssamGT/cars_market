import 'package:cars_market/di/di.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:router/routes/routes_list.dart';
import 'package:router/routes_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final appRouter = GoRouter(
  initialLocation: getIt<Supabase>().client.auth.currentSession==null
      ? RoutesManager.onBoarding
      : RoutesManager.home,
  routes: [...routes],
  errorBuilder: (context, state) =>
      const Scaffold(body: Center(child: Text("404: Page not found"))),
);
