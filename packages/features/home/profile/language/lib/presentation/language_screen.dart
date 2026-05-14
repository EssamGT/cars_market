import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:language/presentation/widgets/language_button.dart';
import 'package:shared_ui/shared_widgets/app_bar/base_app_bar.dart';
import 'package:theme/theme_controller.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  late ThemeController themeController;
  @override
  void initState() {
    themeController = Get.find<ThemeController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: StringsManager.language),
      body: Column(
        children: [
          LanguageButton(
            title: StringsManager.english,
            onTap: () {
              themeController.changeLanguage("en");
              setState(() {});
            },
            isSelected: themeController.language.value == "en",
          ),
          LanguageButton(
            title: StringsManager.arabic,
            onTap: () {
              themeController.changeLanguage("ar");
              setState(() {});
            },
            isSelected: themeController.language.value == "ar",
          ),
        ],
      ),
    );
  }
}
