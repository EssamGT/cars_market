import 'package:cars_market/di/di.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:remote/remote/auth/auth_manager.dart';
import 'package:router/routes_manager.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/car_card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      bottom: false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,

        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenSize.height,
              minWidth: screenSize.width,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      getIt<AuthManager>().logout();
                      context.go(RoutesManager.login);
                    },
                    child: Text('logout'),
                  ),
                  CarCard(),
                  CarCard(),
                  CarCard(),
                  CarCard(),
                  CarCard(),
                  SizedBox(height: AppSize.s100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
