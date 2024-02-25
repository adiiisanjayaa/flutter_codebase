import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/error_page_controller.dart';
import '../widgets/body_error_message.dart';

class UnderConstructor extends StatelessWidget {
  const UnderConstructor({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ErrorPageController>(
      builder: (controller) {
        return BodyErrorMessage(
          // image: Assets.underConstruction,
          title: "This feature is still under construction",
          content: "You will be the first to get notification from us when this feature is ready to use",
          titleAction: "Back",
          action: () => controller.tryAgain(),
        );
      },
    );
  }
}
