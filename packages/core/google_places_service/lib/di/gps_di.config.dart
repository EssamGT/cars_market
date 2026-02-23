// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_places_service/data/data_source/data_source.dart'
    as _i430;
import 'package:google_places_service/data/data_source/data_source_impl/data_source_impl.dart'
    as _i767;
import 'package:google_places_service/data/repository/google_places_service_repo_impl.dart'
    as _i588;
import 'package:google_places_service/domain/repository/google_places_service_reop.dart'
    as _i1017;
import 'package:google_places_service/domain/usecase/gps_use_case.dart' as _i81;
import 'package:google_places_service/presentation/location_page/cubit/location_cubit.dart'
    as _i1023;
import 'package:injectable/injectable.dart' as _i526;
import 'package:remote/network_info/network_info.dart' as _i583;
import 'package:remote/remote/api/api_manager.dart' as _i294;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i430.GooglePlacesService>(
      () => _i767.GooglePlacesServiceDataSourceImpl(gh<_i294.ApiManager>()),
    );
    gh.factory<_i1017.GooglePlacesServiceRepo>(
      () => _i588.GooglePlacesServiceRepoImpl(
        gh<_i430.GooglePlacesService>(),
        gh<_i583.NetworkInfo>(),
      ),
    );
    gh.factory<_i81.GpsUseCase>(
      () => _i81.GpsUseCase(gh<_i1017.GooglePlacesServiceRepo>()),
    );
    gh.factory<_i1023.LocationCubit>(
      () => _i1023.LocationCubit(gh<_i81.GpsUseCase>()),
    );
    return this;
  }
}
