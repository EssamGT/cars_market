// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_places_service/domain/usecase/gps_use_case.dart' as _i81;
import 'package:injectable/injectable.dart' as _i526;
import 'package:remote/network_info/network_info.dart' as _i583;
import 'package:remote/remote/firebase/firebase_db_manager.dart' as _i760;
import 'package:sell/data/data_source/data_source_impl/sell_data_source_impl.dart'
    as _i949;
import 'package:sell/data/data_source/sell_data_source.dart' as _i720;
import 'package:sell/data/repository/sell_repo_impl.dart' as _i796;
import 'package:sell/domain/repository/sell_repository.dart' as _i730;
import 'package:sell/domain/use_case/sell_use_case.dart' as _i814;
import 'package:sell/presentation/cubit/sell_cubit.dart' as _i828;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i720.SellDataSource>(
      () => _i949.SellDataSourceImpl(
        storageManager: gh<_i760.FirebaseDbManager>(),
      ),
    );
    gh.lazySingleton<_i730.SellRepository>(
      () => _i796.SellRepoImpl(
        sellDataSource: gh<_i720.SellDataSource>(),
        networkInfo: gh<_i583.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i814.SellUseCase>(
      () => _i814.SellUseCase(sellRepository: gh<_i730.SellRepository>()),
    );
    gh.lazySingleton<_i828.SellCubit>(
      () => _i828.SellCubit(gh<_i814.SellUseCase>(), gh<_i81.GpsUseCase>()),
    );
    return this;
  }
}
