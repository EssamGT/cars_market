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
import 'package:remote/remote/firebase/firebase_db_manager.dart' as _i760;
import 'package:storage/cache/prefs_helper.dart' as _i602;
import 'package:sync_manager/data/data_source/daw_impl/sync_manager_daw_impl.dart'
    as _i179;
import 'package:sync_manager/data/data_source/sync_manager_data_source.dart'
    as _i779;
import 'package:sync_manager/data/repository/sync_manager_repo_impl.dart'
    as _i550;
import 'package:sync_manager/domain/repository/sync_manager_repo.dart' as _i413;
import 'package:sync_manager/domain/usecase/sync_manager_use_case.dart'
    as _i397;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i779.SyncManagerDataSource>(
      () => _i179.SyncManagerDawImpl(
        firebaseDbManager: gh<_i760.FirebaseDbManager>(),
        prefsHelper: gh<_i602.PrefsHelper>(),
      ),
    );
    gh.factory<_i413.SyncManagerRepo>(
      () => _i550.SyncManagerRepoImpl(
        dataSource: gh<_i779.SyncManagerDataSource>(),
        networkInfo: gh<_i583.NetworkInfo>(),
      ),
    );
    gh.factory<_i397.SyncManagerUseCase>(
      () => _i397.SyncManagerUseCase(repo: gh<_i413.SyncManagerRepo>()),
    );
    return this;
  }
}
