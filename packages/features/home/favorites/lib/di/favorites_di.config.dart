// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:favorites/data/data_source/daw_impl/fav_daw_impl.dart' as _i404;
import 'package:favorites/data/data_source/fav_data_source.dart' as _i156;
import 'package:favorites/data/repository/fav_repo_impl.dart' as _i696;
import 'package:favorites/domain/repository/fav_repo.dart' as _i568;
import 'package:favorites/domain/usecase/fav_use_case.dart' as _i432;
import 'package:favorites/presentation/cubit/favorites_cubit.dart' as _i183;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:remote/network_info/network_info.dart' as _i583;
import 'package:remote/remote/firebase/firebase_db_manager.dart' as _i760;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i156.FavDataSource>(
      () => _i404.FavDawImpl(firebaseDbManager: gh<_i760.FirebaseDbManager>()),
    );
    gh.factory<_i568.FavRepo>(
      () => _i696.FavRepoImpl(
        networkInfo: gh<_i583.NetworkInfo>(),
        favDataSource: gh<_i156.FavDataSource>(),
      ),
    );
    gh.factory<_i432.FavUseCase>(
      () => _i432.FavUseCase(favRepo: gh<_i568.FavRepo>()),
    );
    gh.lazySingleton<_i183.FavoritesCubit>(
      () => _i183.FavoritesCubit(gh<_i432.FavUseCase>()),
    );
    return this;
  }
}
