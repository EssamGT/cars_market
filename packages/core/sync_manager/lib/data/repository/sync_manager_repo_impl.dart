import 'package:injectable/injectable.dart';
import 'package:remote/network_info/network_info.dart';
import 'package:sync_manager/data/data_source/sync_manager_data_source.dart';
import 'package:sync_manager/domain/repository/sync_manager_repo.dart';

@Injectable(as: SyncManagerRepo)
class SyncManagerRepoImpl extends SyncManagerRepo {
  SyncManagerDataSource dataSource;
  NetworkInfo networkInfo;
  SyncManagerRepoImpl({required this.dataSource, required this.networkInfo});

  @override
  Future<void> syncCarsCatalog() async {
    if (await networkInfo.isConnected) {
      return dataSource.syncCarsCatalog();
    }
  }

  @override
  Future<void> syncData() async {
    if (await networkInfo.isConnected) {
      return dataSource.syncData();
    }
  }

  @override
  Future<void> syncLocationCatalog() async {
    if (await networkInfo.isConnected) {
      return dataSource.syncLocationCatalog();
    }
  }
}
