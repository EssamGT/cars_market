import 'dart:ui';
import 'package:constants/strings_manager.dart';
import 'package:shared_ui/shared_widgets/alert_bar/error_message_bar.dart';
import 'package:shared_ui/shared_widgets/pop_up/loading_pop_up.dart';
import 'cubit/sell_cubit.dart';
import 'widgets/sell_screen_app_bar.dart';
import 'widgets/controller/sell_steps_controller.dart';
import 'widgets/navi_buttons.dart';
import 'widgets/steps_indicator.dart';
import 'package:cars_market/di/di.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({super.key});

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  late SellStepsController controller;
  int _lastIndex = 0;
  @override
  void initState() {
    // controller = Get.put(SellStepsController());

    controller = Get.put(SellStepsController(), permanent: false);
    getIt.resetLazySingleton<SellCubit>();
    // getIt.resetLazySingleton<LocationCubit>();

    super.initState();
  }

  @override
  void dispose() {
    // controller.dispose();
    if (Get.isRegistered<SellStepsController>()) {
      Get.delete<SellStepsController>();
    }
    getIt<SellCubit>().close();
    // getIt<LocationCubit>().close();

    super.dispose();
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final double indicatorHeight = AppSize.s60;
    final double naviButtonHeight = AppSize.s80;

    return BlocProvider.value(
      value: getIt.get<SellCubit>(),
      child: Scaffold(
        appBar: SellScreenAppBar(),
        bottomNavigationBar: NaviButtons(controller: controller),

        body: BlocListener<SellCubit, SellState>(
          listener: (context, state) {
            if (state is MaxImagesLimitReached) {
              MessageBar.show(
                context,
                StringsManager.maxImagesLimitReached(state.imagesLimit),
                MessageBarType.warning,
              );
            }
            if (state is UploadingLoading ||
                state is UploadingSuccess ||
                state is UploadingError) {
              loading = true;
            } else {
              loading = false;
            }
          },
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: controller.scrollController,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: indicatorHeight + AppPadding.p8),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight:
                        screenSize.height - (indicatorHeight + naviButtonHeight + AppPadding.p8) ,
                    minWidth: screenSize.width,
                  ),
                  child: IntrinsicHeight(
                    child: PopScope(
                      canPop: false,
                      onPopInvokedWithResult: (didPop, result) async {
                        if (!didPop) {
                          if (loading == false) {
                            LoadingPopUp.show(
                              context: context,
                              type: PopupType.exit,
                            );
                          }
                        }
                      },

                      child: Obx(() {
                        final currentIndex = controller.selectedIndex.value;
                        final isForward = currentIndex >= _lastIndex;
                        _lastIndex = currentIndex;
                        return Column(
                          children: [
                            // keep only the current step in the scrollable area
                            Form(
                              key: controller.key,
                              child: AnimatedSwitcher(
                                duration: controller.animationDuration,
                                switchInCurve: controller.animationCurve,
                                switchOutCurve: controller.animationCurve,
                                transitionBuilder: (child, animation) {
                                  final offset = isForward
                                      ? const Offset(1.0, 0.0)
                                      : const Offset(-1.0, 0.0);
                                  final blur = Tween<double>(
                                    begin: 4.0,
                                    end: 0.0,
                                  ).animate(animation);

                                  return ClipRect(
                                    child: SlideTransition(
                                      position: Tween<Offset>(
                                        begin: offset,
                                        end: Offset.zero,
                                      ).animate(animation),
                                      child: Container(
                                        color: Theme.of(
                                          context,
                                        ).scaffoldBackgroundColor,
                                        child: AnimatedBuilder(
                                          animation: blur,
                                          builder: (context, child) {
                                            return ImageFiltered(
                                              imageFilter: ImageFilter.blur(
                                                sigmaX: blur.value,
                                                sigmaY: blur.value,
                                              ),
                                              child: child,
                                            );
                                          },
                                          child: child,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                layoutBuilder:
                                    (currentChild, previousChildren) {
                                      return Stack(
                                        alignment: Alignment.topCenter,
                                        children: <Widget>[
                                          if (previousChildren.isNotEmpty)
                                            IgnorePointer(
                                              child: previousChildren.first,
                                            ),
                                          if (currentChild != null)
                                            currentChild,
                                        ],
                                      );
                                    },
                                child: KeyedSubtree(
                                  key: ValueKey(currentIndex),
                                  child: controller.steps[currentIndex],
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
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
                      () =>
                          StepsIndicator(index: controller.selectedIndex.value),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
