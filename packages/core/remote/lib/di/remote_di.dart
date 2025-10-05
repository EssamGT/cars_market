import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/di/remote_di.config.dart';

@InjectableInit()
Future<void> configureRemoteDependencies(
  GetIt getIt,
  String? environment,
) async {
  getIt.init(environment: environment);
}
 