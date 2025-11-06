// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:remote/di/di_remote_module.dart' as _i523;
import 'package:remote/network_info/network_info.dart' as _i583;
import 'package:remote/network_info/network_info_impl.dart' as _i339;
import 'package:remote/remote/api_manager.dart' as _i120;
import 'package:remote/remote/remote_manager.dart' as _i227;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final remoteModule = _$RemoteModule();
    gh.factory<_i120.ApiManager>(() => _i120.ApiManager());
    gh.singleton<_i454.Supabase>(() => remoteModule.supabase);
    gh.singleton<_i59.FirebaseAuth>(() => remoteModule.firebaseAuth);
    gh.factory<_i583.NetworkInfo>(() => _i339.NetworkInfoImpl());
    gh.singleton<_i227.RemoteManager>(
      () => _i227.RemoteManager(gh<_i454.Supabase>(), gh<_i59.FirebaseAuth>()),
    );
    return this;
  }
}

class _$RemoteModule extends _i523.RemoteModule {}
