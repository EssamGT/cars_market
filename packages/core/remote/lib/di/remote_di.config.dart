// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:remote/di/di_remote_module.dart' as _i523;
import 'package:remote/network_info/network_info.dart' as _i583;
import 'package:remote/network_info/network_info_impl.dart' as _i339;
import 'package:remote/remote/api/api_manager.dart' as _i294;
import 'package:remote/remote/auth/auth_manager.dart' as _i218;
import 'package:remote/remote/firebase/firebase_db_manager.dart' as _i760;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final remoteModule = _$RemoteModule();
    gh.singleton<_i59.FirebaseAuth>(() => remoteModule.firebaseAuth);
    gh.singleton<_i974.FirebaseFirestore>(() => remoteModule.firebaseFirestore);
    gh.singleton<_i457.FirebaseStorage>(() => remoteModule.firebaseStorage);
    gh.lazySingleton<_i294.ApiManager>(() => _i294.ApiManager());
    gh.singleton<_i760.FirebaseDbManager>(
      () => _i760.FirebaseDbManager(
        firestore: gh<_i974.FirebaseFirestore>(),
        storage: gh<_i457.FirebaseStorage>(),
        auth: gh<_i59.FirebaseAuth>(),
      ),
    );
    gh.factory<_i583.NetworkInfo>(() => _i339.NetworkInfoImpl());
    gh.singleton<_i218.AuthManager>(
      () => _i218.AuthManager(
        firebaseAuth: gh<_i59.FirebaseAuth>(),
        dbManager: gh<_i760.FirebaseDbManager>(),
      ),
    );
    return this;
  }
}

class _$RemoteModule extends _i523.RemoteModule {}
