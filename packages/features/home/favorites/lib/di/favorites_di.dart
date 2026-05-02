import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'favorites_di.config.dart';

@InjectableInit()
Future<void> configureFavoritesDependencies(
  GetIt getIt,
  String? environment,
) async {
  getIt.init(environment: environment);
}
