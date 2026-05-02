import 'package:data/models/user/user_data.dart';

abstract class SyncManagerDataSource {
  Future<void> syncData();
  Future<void> syncLocationCatalog();
  Future<void> syncCarsCatalog();
  Future<UserData> getUserData();
}
