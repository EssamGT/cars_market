// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:forgot_password/data/data_source/data_source_impl/forgot_password_data_source_impl.dart'
    as _i386;
import 'package:forgot_password/data/data_source/forgot_password_data_soure.dart'
    as _i7;
import 'package:forgot_password/data/repository/forgot_password_repo_impl.dart'
    as _i327;
import 'package:forgot_password/domain/repository/forgot_password_repo.dart'
    as _i470;
import 'package:forgot_password/domain/usecase/forgot_password_use_case.dart'
    as _i1007;
import 'package:forgot_password/presentation/cubit/forgot_password_cubit.dart'
    as _i1000;
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
    gh.lazySingleton<_i7.ForgotPasswordDataSoure>(
      () => _i386.ForgotPasswordDataSourceImpl(gh<_i227.RemoteManager>()),
    );
    gh.lazySingleton<_i470.ForgotPasswordRepo>(
      () => _i327.ForgotPasswordRepoImpl(
        gh<_i7.ForgotPasswordDataSoure>(),
        gh<_i583.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i1007.ForgotPasswordUseCase>(
      () => _i1007.ForgotPasswordUseCase(gh<_i470.ForgotPasswordRepo>()),
    );
    gh.lazySingleton<_i1000.ForgotPasswordCubit>(
      () => _i1000.ForgotPasswordCubit(gh<_i1007.ForgotPasswordUseCase>()),
    );
    return this;
  }
}
