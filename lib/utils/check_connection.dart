import 'package:connectivity_plus/connectivity_plus.dart';

class CheckConnection {
  _ifInternetAvailable() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  checkConnection() async {
    final result = await _ifInternetAvailable();
    if (result == true) {
      return true;
    } else {
      return false;
    }
  }
}
