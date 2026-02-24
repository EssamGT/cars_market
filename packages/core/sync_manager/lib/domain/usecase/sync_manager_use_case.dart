import 'package:injectable/injectable.dart';
import 'package:sync_manager/domain/repository/sync_manager_repo.dart';

@injectable
class SyncManagerUseCase {
  SyncManagerRepo repo;
  SyncManagerUseCase({required this.repo});
  Future<void> syncData() => repo.syncData();
  Future<void> syncLocationCatalog() => repo.syncLocationCatalog();
  Future<void> syncCarsCatalog() => repo.syncCarsCatalog();
}
