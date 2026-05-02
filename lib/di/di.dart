import 'package:favorites/di/favorites_di.dart';
import 'package:get_it/get_it.dart';
import 'package:create_account/di/create_account_di.dart';
import 'package:forgot_password/di/forgot_password_di.dart';
import 'package:google_places_service/di/gps_di.dart';
import 'package:login/di/login_di.dart';
import 'package:main/di/main_screen_di.dart';
import 'package:profile/di/profile_di.dart';
import 'package:remote/di/remote_di.dart';
import 'package:search/di/search_di.dart';
import 'package:sell/di/sell_di.dart';
import 'package:storage/di/storage_di.dart';
import 'package:sync_manager/di/sync_manager_di.dart';
import 'package:update_user_data/di/update_user_data_di.dart';
import 'package:user_details/di/user_details_di.dart';

final getIt = GetIt.instance;

// @InjectableInit(
//   initializerName: 'init', // default
//   preferRelativeImports: true, // default
//   asExtension: true, // default
// )
Future<void> configureDependencies(String? enviroment) async {
  // getIt.init(environment: enviroment);
  await configureRemoteDependencies(getIt, enviroment);
  await configureLoginDependencies(getIt, enviroment);
  await configureCreateAccountDependencies(getIt, enviroment);
  await configureForgotPasswordDependencies(getIt, enviroment);
  await configureUserDetailsDependencies(getIt, enviroment);
  await configureGooglePlacesServiceDependencies(getIt, enviroment);
  await configureStorageDependencies(getIt, enviroment);
  await configureSyncManagerDependencies(getIt, enviroment);
  await configureMainScreenDependencies(getIt, enviroment);
  await configureSellDependencies(getIt, enviroment);
  await configureSearchDependencies(getIt, enviroment);
  await configureFavoritesDependencies(getIt, enviroment);
  await configureProfileDependencies(getIt, enviroment);
  await configureUpdateUserDataDependencies(getIt, enviroment);
}
