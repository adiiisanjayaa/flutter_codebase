import 'package:get/get.dart';

import '../controllers/previewer_controller.dart';

class PreviewerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreviewerController>(
      () => PreviewerController(),
    );
  }
}
