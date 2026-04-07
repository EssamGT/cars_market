import 'package:cars_market/di/di.dart';
import 'package:constants/constants_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:router/router%20.dart';
import 'package:sync_manager/domain/usecase/sync_manager_use_case.dart';
import 'package:theme/light_theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: AppConstants.env);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await configureDependencies(Environment.dev);

  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
  await getIt.get<SyncManagerUseCase>().syncData();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
    );
  }
}
