import 'package:cars_market/di/di.config.dart';
import 'package:create_account/data/di/create_account_di.dart';
import 'package:forgot_password/data/di/forgot_password_di.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:login/data/di/login_di.dart';
import 'package:remote/di/remote_di.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies(String? enviroment) async {
  getIt.init(environment: enviroment);
  configureRemoteDependencies(getIt, enviroment);
  configureLoginDependencies(getIt, enviroment);
  configureCreateAccountDependencies(getIt, enviroment);
  configureForgotPasswordDependencies(getIt, enviroment);
}
