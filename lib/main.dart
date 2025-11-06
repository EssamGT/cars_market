import 'package:cars_market/di/di.dart';
import 'package:constants/constants_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:router/router%20.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:theme/light_theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(url: AppConstants.url, anonKey: AppConstants.key);
  await configureDependencies(Environment.dev);
  await dotenv.load(fileName: AppConstants.env);

  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Top bar color
      statusBarIconBrightness:
          Brightness.light, // For Android (dark or light icons)
      statusBarBrightness: Brightness.dark, // For iOS (dark or light content)
    ),
  );
 }

 class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
    );
  }
}
