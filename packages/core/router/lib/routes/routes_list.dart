import 'package:car_listing/presentation/car_details_screen.dart';

import 'package:create_account/presentation/create_account_screen.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:forgot_password/presentation/forgot_password_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:home/presentation/home_screen.dart';
import 'package:language/presentation/language_screen.dart';
import 'package:listed_cars/presentation/listed_cars_screen.dart';
import 'package:login/presentation/login_screen.dart';
import 'package:notifications/presentation/notifications_screen.dart';
import 'package:on_bording/presentation/on_bording_screen.dart';
import 'package:router/routes_manager.dart';
import 'package:search/presentation/widgets/filter_screen/filter_screen.dart';
import 'package:search/presentation/widgets/search_result/search_result_screen.dart';
import 'package:sell/presentation/sell_screen.dart';
import 'package:update_user_data/data/models/card_model.dart';
import 'package:update_user_data/presentation/personal_info_screen.dart';
import 'package:update_user_data/presentation/widgets/edit_user_profile/edit_user_profile.dart';
import 'package:update_user_data/presentation/widgets/otp_screen/otp_verify_screen.dart';
import 'package:user_details/presentation/user_details_screen.dart';
import 'package:user_details/presentation/widgets/otp_screen/otp_verify_screen.dart';

final routes = <RouteBase>[
  GoRoute(
    path: RoutesManager.onBoarding,
    builder: (context, state) => OnBoardingScreen(),
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
    path: RoutesManager.forgotPassword,
    builder: (context, state) => const ForgotPasswordScreen(),
  ),
  GoRoute(
    path: RoutesManager.home,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: RoutesManager.sellCarScreen,
    // builder: (context, state) => const AddScreen(),
    pageBuilder: (context, state) {
      return customBottomAnimationPage(child: const SellScreen(), state: state);
    },
  ),

  GoRoute(
    path: RoutesManager.userDetails,
    pageBuilder: (context, state) {
      return customRightAnimationPage(child: UserDetailsScreen(), state: state);
    },
  ),
  GoRoute(
    path: RoutesManager.otpScreen,
    pageBuilder: (context, state) {
      return customRightAnimationPage(child: OtpVerifyScreen(), state: state);
    },
  ),
  GoRoute(
    path: RoutesManager.otpScreenForPhoneUpdate,
    pageBuilder: (context, state) {
      return customRightAnimationPage(
        child: OtpVerifyScreenForPhoneUpdate(),
        state: state,
      );
    },
  ),
  GoRoute(
    path: RoutesManager.filterScreen,
    pageBuilder: (context, state) {
      return customRightAnimationPage(child: FilterScreen(), state: state);
    },
  ),
  GoRoute(
    path: RoutesManager.searchResults,
    pageBuilder: (context, state) {
      return customRightAnimationPage(
        child: SearchResultScreen(),
        state: state,
      );
    },
  ),
  GoRoute(
    path: RoutesManager.personalInfo,
    pageBuilder: (context, state) {
      return customRightAnimationPage(
        child: PersonalInfoScreen(),
        state: state,
      );
    },
  ),
  GoRoute(
    path: RoutesManager.listedCars,
    pageBuilder: (context, state) {
      return customRightAnimationPage(child: ListedCarsScreen(), state: state);
    },
  ),
  GoRoute(
    path: RoutesManager.language,
    pageBuilder: (context, state) {
      return customRightAnimationPage(child: LanguageScreen(), state: state);
    },
  ),
  GoRoute(
    path: RoutesManager.notifications,
    pageBuilder: (context, state) {
      return customRightAnimationPage(
        child: NotificationsScreen(),
        state: state,
      );
    },
  ),
  GoRoute(
    path: RoutesManager.editUserProfile,
    pageBuilder: (context, state) {
      return customRightAnimationPage(
        child: EditUserProfile(editType: state.extra as PersonalInfoEditType),
        state: state,
      );
    },
  ),
  GoRoute(
    path: RoutesManager.carDetails,
    pageBuilder: (context, state) {
      return customRightAnimationPage(
        child: CarDetailsScreen(car: state.extra as CarEntity),
        state: state,
      );
    },
  ),
];

CustomTransitionPage customRightAnimationPage({
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

CustomTransitionPage customBottomAnimationPage({
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
          begin: const Offset(0, 1), // from bottom
          end: Offset.zero,
        ).animate(animation),
        child: FadeTransition(opacity: animation, child: child),
      );
    },
    transitionDuration: duration,
  );
}
