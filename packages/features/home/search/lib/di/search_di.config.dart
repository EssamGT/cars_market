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
import 'package:search/data/data_source/daw_impl/search_daw_impl.dart' as _i458;
import 'package:search/data/data_source/search_data_source.dart' as _i656;
import 'package:search/data/repository/search_repo_impl.dart' as _i108;
import 'package:search/domain/repository/search_repo.dart' as _i973;
import 'package:search/domain/use_case/search_use_case.dart' as _i757;
import 'package:search/presentation/cubit/search_screen_cubit.dart' as _i423;
import 'package:storage/cache/prefs_helper.dart' as _i602;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i656.SearchDataSource>(
      () => _i458.SearchDawImpl(gh<_i760.FirebaseDbManager>()),
    );
    gh.factory<_i973.SearchRepo>(
      () => _i108.SearchRepoImpl(
        gh<_i656.SearchDataSource>(),
        gh<_i583.NetworkInfo>(),
      ),
    );
    gh.factory<_i757.SearchUseCase>(
      () => _i757.SearchUseCase(gh<_i973.SearchRepo>()),
    );
    gh.lazySingleton<_i423.SearchScreenCubit>(
      () => _i423.SearchScreenCubit(
        gh<_i757.SearchUseCase>(),
        gh<_i602.PrefsHelper>(),
      ),
    );
    return this;
  }
}
