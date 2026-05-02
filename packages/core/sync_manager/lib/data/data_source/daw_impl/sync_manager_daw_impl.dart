import 'package:data/models/user/user_data.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/remote/firebase/firebase_db_manager.dart';
import 'package:storage/cache/prefs_helper.dart';
import 'package:sync_manager/data/data_source/sync_manager_data_source.dart';

@Injectable(as: SyncManagerDataSource)
class SyncManagerDawImpl extends SyncManagerDataSource {
  FirebaseDbManager firebaseDbManager;
  PrefsHelper prefsHelper;
  SyncManagerDawImpl({
    required this.firebaseDbManager,
    required this.prefsHelper,
  });
  @override
  Future<void> syncData() async {
    await syncCarsCatalog();
    await syncLocationCatalog();
  }

  @override
  Future<void> syncCarsCatalog() async {
    try {
      final localCatalog = prefsHelper.getCarCatalog();
      final serverCatalog = await firebaseDbManager.getCarCatalog();

      if (localCatalog.brands.isEmpty ||
          localCatalog.version != serverCatalog.version) {
        prefsHelper.setCarCatalog(serverCatalog);
      }
    } catch (e) {
      //temp
      print(e.toString());
    }
  }

  @override
  Future<void> syncLocationCatalog() async {
    try {
      final localLocation = prefsHelper.getLocationCatalog();
      final serverLocation = await firebaseDbManager.getLocationsCatalog();
      if (localLocation.locationsCatalog.isEmpty ||
          localLocation.version != serverLocation.version) {
        prefsHelper.setLocationCatalog(serverLocation);
      }
    } catch (e) {
      //temp
      print(e.toString());
    }
  }

  @override
  Future<UserData> getUserData() async {
    try {
      final userData = await firebaseDbManager.getUserData();
      return userData;
    } catch (e) {
      print(e.toString());
      return UserData.init();
    }
  }
}
