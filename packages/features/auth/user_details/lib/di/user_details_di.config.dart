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
import 'package:user_details/data/data_source/impl/user_details_daw_impl.dart'
    as _i709;
import 'package:user_details/data/data_source/user_details_data_source.dart'
    as _i34;
import 'package:user_details/data/repository/user_details_repo_impl.dart'
    as _i347;
import 'package:user_details/domain/repository/user_details_repo.dart' as _i144;
import 'package:user_details/domain/usecase/user_deatils_use_case.dart' as _i78;
import 'package:user_details/presentation/cubit/user_details_cubit.dart'
    as _i309;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i34.UserDetailsDataSource>(
      () => _i709.UserDetailsDawImpl(gh<_i218.AuthManager>()),
    );
    gh.lazySingleton<_i144.UserDetailsRepo>(
      () => _i347.UserDetailsRepoImpl(
        gh<_i34.UserDetailsDataSource>(),
        gh<_i583.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i78.UserDeatilsUseCase>(
      () => _i78.UserDeatilsUseCase(gh<_i144.UserDetailsRepo>()),
    );
    gh.factory<_i309.UserDetailsCubit>(
      () => _i309.UserDetailsCubit(gh<_i78.UserDeatilsUseCase>()),
    );
    return this;
  }
}
