import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/error_page_controller.dart';
import '../widgets/body_error_message.dart';

class TimeoutRequest extends StatelessWidget {
  const TimeoutRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ErrorPageController>(
      builder: (controller) {
        return BodyErrorMessage(
          // image: Assets.timeOutRequest,
          title: "Connection timeout ${controller.statusCode}\n Try again later",
          content: "Please try again",
          titleAction: "Try again",
          action: () => controller.tryAgain(),
        );
      },
    );
  }
}
