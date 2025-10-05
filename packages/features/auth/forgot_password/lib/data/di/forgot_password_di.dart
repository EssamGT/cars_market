import 'package:forgot_password/data/di/forgot_password_di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit()
Future<void> configureForgotPasswordDependencies(
  GetIt getIt,
  String? environment,
) async {
  getIt.init(environment: environment);
}
