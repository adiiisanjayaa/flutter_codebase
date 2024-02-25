import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/error_page_controller.dart';
import '../widgets/body_error_message.dart';

class InternetError extends StatelessWidget {
  const InternetError({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ErrorPageController>(
      builder: (controller) {
        return BodyErrorMessage(
          // image: Assets.internetError,
          title: "Is your internet connection interrupted?",
          content: "Make sure your internet is smooth. Double-check the condition of the WiFi / data package / network in your area",
          titleAction: "Try again",
          action: () => controller.tryAgain(),
        );
      },
    );
  }
}
