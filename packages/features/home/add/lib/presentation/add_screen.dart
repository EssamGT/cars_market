import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:add/presentation/widgets/add_screen_app_bar.dart';
import 'package:add/presentation/widgets/buttom_buttons.dart';
import 'package:add/presentation/widgets/controller/sell_steps_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  late SellStepsController controller;
  @override
  void initState() {
    controller = Get.put(SellStepsController());
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AddCubit(),
      child: Scaffold(
        appBar: AddScreenAppBar(),
        bottomNavigationBar: ButtomButtons(controller: controller),
        body: SingleChildScrollView(
          controller: controller.scrollController,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenSize.height,
              minWidth: screenSize.width,
            ),
            child: IntrinsicHeight(
              child: Obx(
                () => controller.steps[controller.selectedIndex.value],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
