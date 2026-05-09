import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'listed_cars_di.config.dart';

@InjectableInit()
Future<void> configureListedCarsDependencies(
  GetIt getIt,
  String? environment,
) async {
  getIt.init(environment: environment);
}
