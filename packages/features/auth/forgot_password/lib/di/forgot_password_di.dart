import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'forgot_password_di.config.dart';

@InjectableInit()
Future<void> configureForgotPasswordDependencies(
  GetIt getIt,
  String? environment,
) async {
  getIt.init(environment: environment);
}
