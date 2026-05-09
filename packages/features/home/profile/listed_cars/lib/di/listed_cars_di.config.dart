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
import 'package:listed_cars/data/data_source/daw_impl/listed_cars_daw_impl.dart'
    as _i360;
import 'package:listed_cars/data/data_source/listed_cars_data_source.dart'
    as _i51;
import 'package:listed_cars/data/repository/listed_cars_repo_impl.dart'
    as _i621;
import 'package:listed_cars/domain/repository/listed_cars_repo.dart' as _i486;
import 'package:listed_cars/domain/usecase/listed_cars_use_case.dart' as _i138;
import 'package:listed_cars/presentation/cubit/listed_cars_cubit.dart' as _i449;
import 'package:remote/network_info/network_info.dart' as _i583;
import 'package:remote/remote/firebase/firebase_db_manager.dart' as _i760;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i51.ListedCarsDataSource>(
      () => _i360.ListedCarsDawImpl(gh<_i760.FirebaseDbManager>()),
    );
    gh.factory<_i486.ListedCarsRepo>(
      () => _i621.ListedCarsRepoImpl(
        gh<_i51.ListedCarsDataSource>(),
        gh<_i583.NetworkInfo>(),
      ),
    );
    gh.factory<_i138.ListedCarsUseCase>(
      () => _i138.ListedCarsUseCase(gh<_i486.ListedCarsRepo>()),
    );
    gh.lazySingleton<_i449.ListedCarsCubit>(
      () => _i449.ListedCarsCubit(gh<_i138.ListedCarsUseCase>()),
    );
    return this;
  }
}
