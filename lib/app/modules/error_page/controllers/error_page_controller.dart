import 'dart:developer';

import 'package:app/app/routes/nav_args.dart';
import 'package:get/get.dart';

enum ErrorType {
  server,
  internet,
  underConstructor,
  timeout,
}

class ErrorPageController extends GetxController {
  ErrorType? type;
  String statusCode = "";

  @override
  void onReady() {
    var args = Get.arguments as NavArgsModel?;
    if (args?.data != null) {
      try {
        type = args?.data;
      } catch (e) {
        log("error getting");
      }
    }
    if (args?.secondaryData != null) {
      statusCode = args?.secondaryData!["statusCode"] ?? "";
    }
    update();
    super.onReady();
  }

  void tryAgain() {
    Get.back();
  }
}
