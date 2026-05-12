import 'package:cars_market/di/di.dart';
import 'package:cars_market/globle/globle.dart';
import 'package:constants/constants_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:injectable/injectable.dart';
import 'package:router/router%20.dart';
import 'package:sync_manager/domain/usecase/sync_manager_use_case.dart';
import 'package:theme/dark_theme.dart';
import 'package:theme/light_theme.dart';
import 'package:theme/theme_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: AppConstants.env);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await configureDependencies(Environment.dev);

  runApp(const MyApp());

  Get.put(ThemeController());
  await getIt.get<SyncManagerUseCase>().syncData();
  userData = await getIt.get<SyncManagerUseCase>().getUserData();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find<ThemeController>();

    return Obx(
      () => MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        darkTheme: darkTheme(),

        themeMode: ThemeMode.values[themeController.themeMode.value],
      ),
    );
  }
}
