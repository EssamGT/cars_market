// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:car_listing/data/data_source/car_listing_data_source.dart'
    as _i68;
import 'package:car_listing/data/data_source/daw_impl/car_listing_daw_imp.dart'
    as _i599;
import 'package:car_listing/data/repository/car_listing_repo_impl.dart'
    as _i161;
import 'package:car_listing/domain/repository/car_listing_repo.dart' as _i1009;
import 'package:car_listing/domain/usecase/car_listing_use_case.dart' as _i364;
import 'package:car_listing/presentation/cubit/car_listing_cubit.dart' as _i17;
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
    gh.factory<_i68.CarListingDataSource>(
      () => _i599.CarListingDawImp(dbManager: gh<_i760.FirebaseDbManager>()),
    );
    gh.factory<_i1009.CarListingRepo>(
      () => _i161.CarListingRepoImpl(
        dataSource: gh<_i68.CarListingDataSource>(),
        networkInfo: gh<_i583.NetworkInfo>(),
      ),
    );
    gh.factory<_i364.CarListingUseCase>(
      () => _i364.CarListingUseCase(repo: gh<_i1009.CarListingRepo>()),
    );
    gh.singleton<_i17.CarListingCubit>(
      () => _i17.CarListingCubit(gh<_i364.CarListingUseCase>()),
    );
    return this;
  }
}
