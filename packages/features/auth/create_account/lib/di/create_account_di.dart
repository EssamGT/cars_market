import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'create_account_di.config.dart';

@InjectableInit()
Future<void> configureCreateAccountDependencies(
  GetIt getIt,
  String? environment,
) async {
  getIt.init(environment: environment);
}
