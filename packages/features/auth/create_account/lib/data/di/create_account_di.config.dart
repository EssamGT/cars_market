// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:create_account/data/data_source/data_source.dart' as _i398;
import 'package:create_account/data/data_source/data_source_impl/data_source_impl.dart'
    as _i120;
import 'package:create_account/data/repository/create_account_repo_impl.dart'
    as _i842;
import 'package:create_account/domain/repository/create_account_repo.dart'
    as _i52;
import 'package:create_account/domain/use_case/create_account_use_case.dart'
    as _i146;
import 'package:create_account/presentation/cubit/create_account_cubit.dart'
    as _i349;
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
    gh.lazySingleton<_i398.DataSource>(
      () => _i120.DataSourceImpl(gh<_i227.RemoteManager>()),
    );
    gh.lazySingleton<_i52.CreateAccountRepo>(
      () => _i842.CreateAccountRepoImpl(
        gh<_i583.NetworkInfo>(),
        gh<_i398.DataSource>(),
      ),
    );
    gh.factory<_i146.CreateAccountUseCase>(
      () => _i146.CreateAccountUseCase(gh<_i52.CreateAccountRepo>()),
    );
    gh.lazySingleton<_i349.CreateAccountCubit>(
      () => _i349.CreateAccountCubit(gh<_i146.CreateAccountUseCase>()),
    );
    return this;
  }
}
