import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'search_di.config.dart';

@InjectableInit()
Future<void> configureSearchDependencies(
  GetIt getIt,
  String? environment,
) async {
  await getIt.init(environment: environment);
}
