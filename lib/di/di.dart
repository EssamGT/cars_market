import 'package:add/data/di/add_di.dart';
import 'package:cars_market/di/di.config.dart';
import 'package:create_account/data/di/create_account_di.dart';
import 'package:forgot_password/data/di/forgot_password_di.dart';
import 'package:get_it/get_it.dart';
import 'package:google_places_service/data/di/remote_di.dart';
import 'package:injectable/injectable.dart';
import 'package:login/data/di/login_di.dart';
import 'package:main/data/di/di.dart';
import 'package:remote/di/remote_di.dart';
import 'package:storage/di/storage_di.dart';
import 'package:user_details/data/di/user_details_di.dart';

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
  await configureAddDependencies(getIt, enviroment);
  await configureGooglePlacesServiceDependencies(getIt, enviroment);
  await configureUserDetailsDependencies(getIt, enviroment);
  await configureStorageDependencies(getIt, enviroment);
  await configureMainScreenDependencies(getIt, enviroment);
  
}
