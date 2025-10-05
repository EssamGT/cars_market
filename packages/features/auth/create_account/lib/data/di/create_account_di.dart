
import 'package:create_account/data/di/create_account_di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit()
Future<void> configureCreateAccountDependencies(
  GetIt getIt,
  String? environment,
) async {
  getIt.init(environment: environment);
}
