import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NetworkChecker {
  Future<bool> check() async {
    try {
      List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
      for (var connectivity in connectivityResult) {
        if (connectivity == ConnectivityResult.mobile) {
          return checkInternetConnection(connectivity);
        } else if (connectivity == ConnectivityResult.wifi) {
          return checkInternetConnection(connectivity);
        } else {
          return checkInternetConnection(connectivity);
        }
      }
      return false;
    } catch (e) {
      log("Network Check: error Connectivity");
      return false;
    }
  }

  Future<bool> checkInternetConnection(ConnectivityResult networkState) async {
    try {
      bool haveInternet = await InternetConnection().hasInternetAccess;
      log("Network Check: $networkState -- ${haveInternet ? 'Have Inet' : 'Not Have Inet'}");
      return haveInternet;
    } catch (e) {
      log("Network Check: error CheckInternetConnection");
      return false;
    }
  }

  void checkInternet(Function func) {
    check().then((intenet) {
      if (intenet) {
        func(true);
      } else {
        func(false);
      }
    });
  }
}
