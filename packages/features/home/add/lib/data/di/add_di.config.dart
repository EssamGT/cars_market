// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:add/data/data_source/add_data_source.dart' as _i489;
import 'package:add/data/data_source/data_source_impl/add_data_source_impl.dart'
    as _i794;
import 'package:add/data/repository/add_repo_impl.dart' as _i671;
import 'package:add/domain/repository/add_repository.dart' as _i92;
import 'package:add/domain/use_case/add_use_case.dart' as _i166;
import 'package:add/presentation/cubit/add_cubit.dart' as _i268;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:remote/network_info/network_info.dart' as _i583;
import 'package:remote/remote/remote_manager.dart' as _i227;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i489.AddDataSource>(
      () => _i794.AddDataSourceImpl(remoteManager: gh<_i227.RemoteManager>()),
    );
    gh.factory<_i92.AddRepository>(
      () => _i671.AddRepoImpl(
        addDataSource: gh<_i489.AddDataSource>(),
        networkInfo: gh<_i583.NetworkInfo>(),
      ),
    );
    gh.factory<_i166.AddUseCase>(
      () => _i166.AddUseCase(addRepository: gh<_i92.AddRepository>()),
    );
    gh.lazySingleton<_i268.AddCubit>(
      () => _i268.AddCubit(gh<_i166.AddUseCase>()),
    );
    return this;
  }
}
