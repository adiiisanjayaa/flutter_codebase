import 'dart:developer';

import 'package:app/utils/network_connection_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkChecker {
  Future<bool> check() async {
    try {
      List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return false;
      } else {
        return NetworkConnectionChecker.instance.check();
      }
    } catch (e) {
      log("Network Check: error Connectivity");
      return false;
    }
  }
}
