// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:main/data/data_source/d_s_impl/data_source_impl.dart' as _i565;
import 'package:main/data/data_source/main_screen_data_source.dart' as _i632;
import 'package:main/data/repository/main_screen_repository_impl.dart'
    as _i1070;
import 'package:main/domain/repository/main_screen_repository.dart' as _i566;
import 'package:main/domain/usecase/main_screen_use_case.dart' as _i1037;
import 'package:main/presentation/cubit/main_screen_cubit.dart' as _i621;
import 'package:remote/network_info/network_info.dart' as _i583;
import 'package:storage/data/remote/storage_manager.dart' as _i522;

const String _dev = 'dev';
const String _test = 'test';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i632.MainScreenDataSource>(
      () => _i565.DataSourceImplDev(storageManager: gh<_i522.StorageManager>()),
      registerFor: {_dev, _test},
    );
    gh.factory<_i566.MainScreenRepository>(
      () => _i1070.MainScreenRepositoryImplDev(
        networkInfo: gh<_i583.NetworkInfo>(),
        dataSource: gh<_i632.MainScreenDataSource>(),
      ),
      registerFor: {_dev, _test},
    );
    gh.factory<_i632.MainScreenDataSource>(
      () => _i565.DataSourceImpl(storageManager: gh<_i522.StorageManager>()),
      registerFor: {_prod},
    );
    gh.factory<_i566.MainScreenRepository>(
      () => _i1070.MainScreenRepositoryImpl(
        networkInfo: gh<_i583.NetworkInfo>(),
        dataSource: gh<_i632.MainScreenDataSource>(),
      ),
      registerFor: {_prod},
    );
    gh.factory<_i1037.MainScreenUseCase>(
      () => _i1037.MainScreenUseCase(
        repository: gh<_i566.MainScreenRepository>(),
      ),
    );
    gh.singleton<_i621.MainScreenCubit>(
      () => _i621.MainScreenCubit(gh<_i1037.MainScreenUseCase>()),
    );
    return this;
  }
}
