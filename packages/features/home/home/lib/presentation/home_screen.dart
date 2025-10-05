import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/presentation/widgets/bottom_c_nav_bar.dart';
import 'package:home/presentation/widgets/navigation_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    // Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomCNavBar(controller: controller),

      body: Obx(() => controller.getScreen(controller.selectedIndex.value)),
    );
  }
}
