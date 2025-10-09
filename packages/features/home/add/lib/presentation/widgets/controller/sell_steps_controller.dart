import 'package:add/presentation/widgets/sell_steps/step_1/step_1.dart';
import 'package:add/presentation/widgets/sell_steps/step_2/step_2.dart';
import 'package:add/presentation/widgets/sell_steps/step_3/step_3.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SellStepsController extends GetxController {
  ScrollController scrollController = ScrollController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  final Rx<int> selectedIndex = 0.obs;
  final Rx<bool> showPrev = false.obs;
  final Rx<bool> minimize = false.obs;
  final Rx<bool> alinment = false.obs;
  final Rx<bool> animating = false.obs;
  List<Widget> steps = [Step1(), Step2(), Step3()];

  void changeIndex(int index) {
    if (index < 0 || index >= steps.length) return;
    if (index > selectedIndex.value) {
      selectedIndex.value = index;
      minimize.value = true;
      alinment.value = true;

      Future.delayed(Duration(milliseconds: 500), () {
        showPrev.value = true;
      });
    }
    if (index < selectedIndex.value) {
      selectedIndex.value = index;
      if (index == 0) {
        showPrev.value = false;

        animating.value = true;
        Future.delayed(Duration(milliseconds: 500), () {
          minimize.value = false;
        });
        Future.delayed(Duration(milliseconds: 870), () {
          alinment.value = false;
          animating.value = false;
        });
      }
    }
  }
}
