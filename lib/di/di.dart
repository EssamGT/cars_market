import 'package:cars_market/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:create_account/di/create_account_di.dart';
import 'package:forgot_password/di/forgot_password_di.dart';
import 'package:google_places_service/di/gps_di.dart';
import 'package:login/di/login_di.dart';
import 'package:main/di/main_screen_di.dart';
import 'package:remote/di/remote_di.dart';
import 'package:sell/di/sell_di.dart';
import 'package:storage/di/storage_di.dart';
import 'package:user_details/di/user_details_di.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies(String? enviroment) async {
  getIt.init(environment: enviroment);
  await configureRemoteDependencies(getIt, enviroment);
  await configureLoginDependencies(getIt, enviroment);
  await configureCreateAccountDependencies(getIt, enviroment);
  await configureForgotPasswordDependencies(getIt, enviroment);
  await configureUserDetailsDependencies(getIt, enviroment);
  await configureGooglePlacesServiceDependencies(getIt, enviroment);
  await configureSellDependencies(getIt, enviroment);
  await configureStorageDependencies(getIt, enviroment);
  await configureMainScreenDependencies(getIt, enviroment);
}
