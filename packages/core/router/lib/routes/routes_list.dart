import 'package:create_account/presentation/create_account_screen.dart';
import 'package:forgot_password/presentation/forgot_password_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:home/presentation/home_screen.dart';
import 'package:login/presentation/login_screen.dart';
import 'package:on_bording/presentation/on_bording_screen.dart';
import 'package:router/routes_manager.dart';

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
];
