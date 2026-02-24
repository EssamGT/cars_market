abstract class SyncManagerRepo {
    Future<void> syncData();
  Future<void> syncLocationCatalog();
  Future<void> syncCarsCatalog();
}