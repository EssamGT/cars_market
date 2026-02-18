import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'gps_di.config.dart';

@InjectableInit()
Future<void> configureGooglePlacesServiceDependencies(
  GetIt getIt,
  String? enviroment,
) async {
  await getIt.init(environment: enviroment);
}
