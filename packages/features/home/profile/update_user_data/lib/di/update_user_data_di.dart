import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'update_user_data_di.config.dart';



@InjectableInit()
Future<void> configureUpdateUserDataDependencies(
  GetIt getIt,
  String? environment,
) async {
  getIt.init(environment: environment);
}
