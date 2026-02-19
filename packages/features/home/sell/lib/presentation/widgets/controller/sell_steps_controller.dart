import 'package:cars_market/di/di.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:sell/presentation/widgets/sell_steps/step_1/step_1.dart';
import 'package:sell/presentation/widgets/sell_steps/step_2/step_2.dart';
import 'package:sell/presentation/widgets/sell_steps/step_3/step_3.dart';

class SellStepsController extends GetxController {
  ScrollController scrollController = ScrollController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  final Rx<int> selectedIndex = 0.obs;
  final Rx<bool> showPrev = false.obs;
  final Rx<bool> minimize = false.obs;
  final Rx<bool> animating = false.obs;
  final Rx<bool> showPrevMin = false.obs;
  final Rx<bool> nextMax = false.obs;
  final Rx<bool> nextMaxWord = false.obs;
  List<Widget> steps = [Step1(), Step2(), Step3()];
  final Duration animationDuration = const Duration(milliseconds: 700);
  final Duration textDurationIn = const Duration(milliseconds: 350);
  final Duration textDurationOut = const Duration(milliseconds: 450);
  final Duration opacityDuration = const Duration(milliseconds: 350);
  final Curve animationCurve = Curves.easeInOutCubic;

  BuildContext? findFirstErrorField(BuildContext context) {
    BuildContext? errorContext;
    void visitor(Element element) {
      if (errorContext != null) return; // already found
      if (element is StatefulElement && element.state is FormFieldState) {
        final fieldState = element.state as FormFieldState;
        if (fieldState.hasError) {
          errorContext = element;
          return;
        }
      }
      element.visitChildren(visitor);
    }

    (context as Element).visitChildren(visitor);
    return errorContext;
  }

  void changeIndex(int index) async {
    if (index < 0) return;
    if (index >= steps.length) {
      getIt.get<SellCubit>().uploadCar();

      return;
    }
    scrollController.jumpTo(0);
    animating.value = true;

    if (index > selectedIndex.value) {
      if (index == 2) {
        selectedIndex.value = index;

        showPrevMin.value = true;
        nextMax.value = true;
        nextMaxWord.value = true;

        Future.delayed(animationDuration, () {
          animating.value = false;
        });
      } else {
        selectedIndex.value = index;
        minimize.value = true;
        await Future.delayed(animationDuration, () {
          // alinment.value = true;
          showPrev.value = true;
          animating.value = false;
        });
      }
    }
    if (index < selectedIndex.value) {
      if (index == 0) {
        selectedIndex.value = index;
        showPrev.value = false;

        Future.delayed(textDurationOut, () {
          minimize.value = false;
          animating.value = false;
        });
      }
      if (index == 1 && selectedIndex.value == 2) {
        selectedIndex.value = index;
        nextMaxWord.value = false;
        nextMax.value = false;
        showPrevMin.value = false;

        Future.delayed(animationDuration, () {
          animating.value = false;
        });
      }
    }
  }
}
