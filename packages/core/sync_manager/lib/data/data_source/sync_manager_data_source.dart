abstract class SyncManagerDataSource {
  Future<void> syncData();
  Future<void> syncLocationCatalog();
  Future<void> syncCarsCatalog();
}
