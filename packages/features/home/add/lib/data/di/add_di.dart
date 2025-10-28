import 'package:add/data/di/add_di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit()
Future<void> configureAddDependencies(
  GetIt getIt,
  String? environment,
) async {
  getIt.init(environment: environment);
}
