import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:login/data/di/login_di.config.dart';

@InjectableInit()
Future<void> configureLoginDependencies(
  GetIt getIt,
  String? environment,
) async {
  getIt.init(environment: environment);
}
