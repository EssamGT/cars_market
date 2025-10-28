import 'package:get_it/get_it.dart';
import 'package:google_places_service/data/di/remote_di.config.dart';
import 'package:injectable/injectable.dart';

@InjectableInit()
Future<void> configureGooglePlacesServiceDependencies(
  GetIt getIt,
  String? enviroment,
) async {
  getIt.init(environment: enviroment);
}
