import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:add/presentation/widgets/sell_steps/step_1/step_1.dart';
import 'package:add/presentation/widgets/sell_steps/step_2/step_2.dart';
import 'package:add/presentation/widgets/sell_steps/step_3/step_3.dart';
import 'package:cars_market/di/di.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

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
  void changeIndex(int index) async {
    if (index < 0) return;
    if (index >= steps.length) {
      getIt.get<AddCubit>().uploadCar();

      return;
    }
    scrollController.jumpTo(0);
    animating.value = true;
    if (index > selectedIndex.value) {
      if (index == 2) {
        selectedIndex.value = index;

        showPrevMin.value = true;

        Future.delayed(Duration(milliseconds: 100), () {
          nextMax.value = true;
          Future.delayed(Duration(milliseconds: 200), () {
            nextMaxWord.value = true;
            animating.value = false;
          });
        });
      } else {
        selectedIndex.value = index;
        minimize.value = true;
        await Future.delayed(Duration(milliseconds: 1050), () {
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

        Future.delayed(Duration(milliseconds: 500), () {
          minimize.value = false;
          animating.value = false;
        });
      }
      if (index == 1 && selectedIndex.value == 2) {
        selectedIndex.value = index;
        nextMaxWord.value = false;
        Future.delayed(Duration(milliseconds: 150), () {
          nextMax.value = false;
        });
        // nextMax.value = false;
        Future.delayed(Duration(milliseconds: 500), () {
          showPrevMin.value = false;
          animating.value = false;
        });
      }
    }
  }
}
