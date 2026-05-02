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
import 'package:remote/network_info/network_info.dart' as _i583;
import 'package:remote/remote/auth/auth_manager.dart' as _i218;
import 'package:update_user_data/data/data_source/daw_impl/edit_user_data_daw_impl.dart'
    as _i377;
import 'package:update_user_data/data/data_source/edit_user_data_daw.dart'
    as _i590;
import 'package:update_user_data/data/repository/update_user_data_repo_impl.dart'
    as _i1047;
import 'package:update_user_data/domain/repository/update_user_data_repo.dart'
    as _i119;
import 'package:update_user_data/domain/usecase/update_user_data_use_case.dart'
    as _i1030;
import 'package:update_user_data/presentation/cubit/update_user_data_cubit.dart'
    as _i865;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i590.UpdateUserDataDaw>(
      () => _i377.UpdateUserDataDawImpl(gh<_i218.AuthManager>()),
    );
    gh.factory<_i119.UpdateUserDataRepo>(
      () => _i1047.UpdateUserDataRepoImpl(
        gh<_i590.UpdateUserDataDaw>(),
        gh<_i583.NetworkInfo>(),
      ),
    );
    gh.factory<_i1030.UpdateUserDataUseCase>(
      () => _i1030.UpdateUserDataUseCase(gh<_i119.UpdateUserDataRepo>()),
    );
    gh.lazySingleton<_i865.UpdateUserDataCubit>(
      () => _i865.UpdateUserDataCubit(gh<_i1030.UpdateUserDataUseCase>()),
    );
    return this;
  }
}
