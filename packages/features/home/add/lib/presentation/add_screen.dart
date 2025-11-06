import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:add/presentation/widgets/add_screen_app_bar.dart';
import 'package:add/presentation/widgets/buttom_buttons.dart';
import 'package:add/presentation/widgets/controller/sell_steps_controller.dart';
import 'package:add/presentation/widgets/steps_indicator.dart';
import 'package:cars_market/di/di.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_places_service/presentation/cubit/location_cubit.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  late SellStepsController controller;
  @override
  void initState() {
    // controller = Get.put(SellStepsController());

    controller = Get.put(SellStepsController(), permanent: false);
    getIt.resetLazySingleton<AddCubit>();
    getIt.resetLazySingleton<LocationCubit>();

    super.initState();
  }

  @override
  void dispose() {
    // controller.dispose();
    if (Get.isRegistered<SellStepsController>()) {
      Get.delete<SellStepsController>();
    }
    getIt<AddCubit>().close();
    getIt<LocationCubit>().close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final double indicatorHeight = AppSize.s60;
    return BlocProvider.value(
      value: getIt.get<AddCubit>(),
      child: Scaffold(
        appBar: AddScreenAppBar(),
        bottomNavigationBar: ButtomButtons(controller: controller),
        // pin the indicator to the top using a Stack and give the scrollable content
        // top padding equal to the indicator height + top safe area
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: controller.scrollController,
              padding: EdgeInsets.only(top: indicatorHeight + AppPadding.p8),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: AppSize.s100,
                  minWidth: screenSize.width,
                ),
                child: IntrinsicHeight(
                  child: PopScope(
                    canPop: false,

                    child: Obx(
                      () => Column(
                        children: [
                          // keep only the current step in the scrollable area
                          Form(
                            key: controller.key,
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              switchInCurve: Curves.easeOut,
                              switchOutCurve: Curves.easeIn,
                              transitionBuilder: (child, animation) =>
                                  FadeTransition(
                                    opacity: animation,
                                    child: ScaleTransition(
                                      scale: Tween<double>(
                                        begin: 0.50,
                                        end: 1.0,
                                      ).animate(animation),
                                      child: child,
                                    ),
                                  ),
                              child: controller
                                  .steps[controller.selectedIndex.value],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                bottom: false,
                child: Container(
                  height: indicatorHeight,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  alignment: Alignment.center,
                  child: Obx(
                    () => StepsIndicator(index: controller.selectedIndex.value),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
