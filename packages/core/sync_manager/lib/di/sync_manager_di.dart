import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'sync_manager_di.config.dart';

@InjectableInit()
Future<void> configureSyncManagerDependencies(
  GetIt getIt,
  String? environment,
) async {
   getIt.init(environment: environment);
}
