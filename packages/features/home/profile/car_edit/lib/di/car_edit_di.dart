import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'car_edit_di.config.dart';

@InjectableInit()
Future<void> configureCarEditDependencies(GetIt getIt, String? environment) async {
   getIt.init(environment: environment);
}
