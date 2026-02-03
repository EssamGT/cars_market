import 'package:add/presentation/add_screen.dart';
import 'package:create_account/presentation/create_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:forgot_password/presentation/forgot_password_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:home/presentation/home_screen.dart';
import 'package:login/presentation/login_screen.dart';
import 'package:on_bording/presentation/on_bording_screen.dart';
import 'package:router/routes_manager.dart';
import 'package:search/presentation/widgets/filter_screen/filter_screen.dart';
import 'package:user_details/presentation/user_details_screen.dart';
import 'package:user_details/presentation/widgets/otp_screen/otp_verify_screen.dart';

final routes = <RouteBase>[
  GoRoute(
    path: RoutesManager.onBoarding,
    builder: (context, state) => OnBordingScreen(),
  ),
  GoRoute(
    path: RoutesManager.login,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: RoutesManager.createAccount,
    builder: (context, state) => const CreateAccountScreen(),
  ),
  GoRoute(
    path: RoutesManager.forgotPasword,
    builder: (context, state) => const ForgotPasswordScreen(),
  ),
  GoRoute(
    path: RoutesManager.home,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: RoutesManager.add,
    builder: (context, state) => const AddScreen(),
  ),
  GoRoute(
    path: RoutesManager.userDetails,
    pageBuilder: (context, state) {
      return customAnimationPage(child: UserDetailsScreen(), state: state);
    },
  ),
  GoRoute(
    path: RoutesManager.otpScreen,
    pageBuilder: (context, state) {
      return customAnimationPage(child: OtpVerifyScreen(), state: state);
    },
  ),
  GoRoute(
    path: RoutesManager.filterScreen,
    pageBuilder: (context, state) {
      return customAnimationPage(child: FilterScreen(), state: state);
    },
  ),
];

CustomTransitionPage customAnimationPage({
  required Widget child,
  required GoRouterState state,
  Duration duration = const Duration(milliseconds: 400),
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Example: Fade + Slide animation
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0), // from right
          end: Offset.zero,
        ).animate(animation),
        child: FadeTransition(opacity: animation, child: child),
      );
    },
    transitionDuration: duration,
  );
}
