import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'profile_di.config.dart';

@InjectableInit()
Future<void> configureProfileDependencies(
  GetIt getIt,
  String? environment,
) async {
  getIt.init(environment: environment);
}
