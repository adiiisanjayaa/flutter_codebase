import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/error_page_controller.dart';
import '../widgets/body_error_message.dart';

class ServerError extends StatelessWidget {
  const ServerError({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ErrorPageController>(
      builder: (controller) {
        return BodyErrorMessage(
          // image: Assets.serverError,
          title: "There is a problem with the server ${controller.statusCode}",
          content: "Our team is trying to fix this. You can try again later.",
          titleAction: "Try again",
          action: () => controller.tryAgain(),
        );
      },
    );
  }
}
