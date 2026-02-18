import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'main_screen_di.config.dart';

@InjectableInit()
Future<void> configureMainScreenDependencies(
  GetIt getIt,
  String? environment,
) async {
  getIt.init(environment: environment);
}
