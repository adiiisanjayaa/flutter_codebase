import 'package:app/core/themes/themes.dart';
import 'package:app/core/widgets/lancer_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/error_page_controller.dart';
import '../widgets/internet_error.dart';
import '../widgets/server_error.dart';
import '../widgets/timeout_request.dart';
import '../widgets/under_constructor.dart';

class ErrorPageView extends GetView<ErrorPageController> {
  const ErrorPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ErrorPageController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: LancerAppBar(
              title: "",
              appBarColor: AppColors.white,
              centerTitle: false,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: getError(controller),
          ),
        );
      },
    );
  }
}

Widget? getError(ErrorPageController controller) {
  switch (controller.type) {
    case ErrorType.server:
      return const ServerError();
    case ErrorType.internet:
      return const InternetError();
    case ErrorType.underConstructor:
      return const UnderConstructor();
    case ErrorType.timeout:
      return const TimeoutRequest();
    default:
      return const UnderConstructor();
  }
}
