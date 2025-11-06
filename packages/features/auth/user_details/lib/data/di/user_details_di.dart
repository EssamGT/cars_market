import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:user_details/data/di/user_details_di.config.dart';

@InjectableInit()
Future<void> configureUserDetailsDependencies(
  GetIt getIt,
  String? environment,
) async {
  getIt.init(environment: environment);
}
