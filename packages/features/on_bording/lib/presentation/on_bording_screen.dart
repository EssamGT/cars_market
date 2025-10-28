import 'package:assets/assets_manager.dart';
import 'package:constants/constants_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:on_bording/presentation/cubit/on_bording_cubit_cubit.dart';
import 'package:on_bording/presentation/widgets/bottom_widget.dart';
import 'package:router/routes_manager.dart';

class OnBordingScreen extends StatelessWidget {
  OnBordingScreen({super.key});
  final List<String> images = [
    AssetsManager.b1,
    AssetsManager.b2,
    AssetsManager.b3,
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.secondary,

      body: BlocProvider(
        create: (context) => OnBordingCubit(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            BlocListener<OnBordingCubit, OnBordingState>(
              listener: (context, state) {
                if (state is Login) {
                  context.go(RoutesManager.login);
                }
              },
              child: BlocBuilder<OnBordingCubit, OnBordingState>(
                builder: (context, state) {
                  var cubit = OnBordingCubit.get(context);
                  return Expanded(
                    flex: 2,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      switchInCurve: Curves.easeIn,
                      switchOutCurve: Curves.easeOut,
                      child: Image.asset(
                        images[cubit.index],
                        key: ValueKey(
                          cubit.index,
                        ), 
                        package: AppConstants.assetsPackage,
                        fit: BoxFit.cover,
                        height: screenSize.height / 1.5,
                        width: screenSize.width,
                        errorBuilder: (context, error, stackTrace) {
                          return Text('$error');
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(flex: 1, child: BottomWidget(length: images.length)),
          ],
        ),
      ),
    );
  }
}
