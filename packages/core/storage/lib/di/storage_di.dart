import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:storage/di/storage_di.config.dart';

@InjectableInit()
Future<void> configureStorageDependencies(
  GetIt getIt,
  String? environment,
) async {
  getIt.init(environment: environment);
}
