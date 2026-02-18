// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:login/data/data_source/data_source.dart' as _i129;
import 'package:login/data/data_source/data_source_impl/data_source_impl.dart'
    as _i899;
import 'package:login/data/repository/login_repo_impl.dart' as _i527;
import 'package:login/domain/repository/login_repo.dart' as _i636;
import 'package:login/domain/usecase/login_use_case.dart' as _i936;
import 'package:login/presentation/cubit/login_cubit.dart' as _i222;
import 'package:remote/network_info/network_info.dart' as _i583;
import 'package:remote/remote/auth/auth_manager.dart' as _i218;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i129.LoginDataSource>(
      () => _i899.DataSourceImpl(gh<_i218.AuthManager>()),
    );
    gh.lazySingleton<_i636.LoginRepo>(
      () => _i527.LoginRepoImpl(
        gh<_i129.LoginDataSource>(),
        gh<_i583.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i936.LoginUseCase>(
      () => _i936.LoginUseCase(gh<_i636.LoginRepo>()),
    );
    gh.factory<_i222.LoginCubit>(
      () => _i222.LoginCubit(gh<_i936.LoginUseCase>()),
    );
    return this;
  }
}
