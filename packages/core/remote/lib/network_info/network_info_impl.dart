import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/network_info/network_info.dart';

@Injectable(as: NetworkInfo)
class NetworkInfoImpl extends NetworkInfo {
  @override
  Future<bool> get isConnected async {
    final List<ConnectivityResult> connectivityResult = await Connectivity()
        .checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.ethernet) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    } else {
      return false;
    }
  }
}
