import 'package:app/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomSnackBar {
  static void showNewSnackBar({
    required String message,
    IconData icon = Icons.error,
    bool withIcon = true,
    Widget? customMessage,
    TextAlign? textAlign,
    Color color = AppColors.black400,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        icon: customMessage != null
            ? null
            : withIcon
                ? Icon(
                    icon,
                    color: Colors.white,
                  )
                : null,
        messageText: customMessage ??
            Text(
              message,
              style: AppStyles.styleTextBody(
                colorText: Colors.white,
                height: 1.4,
                size: 16.sp,
              ),
              textAlign: textAlign,
            ),
        margin: const EdgeInsets.symmetric(
          vertical: 40.0,
          horizontal: 18.0,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 14.0,
        ),
        snackPosition: SnackPosition.TOP,
        borderRadius: 16.0,
        backgroundColor: color,
        duration: const Duration(seconds: 3),
        shouldIconPulse: false,
      ),
    );
  }

  static void information(String message, [String title = "Info"]) {
    _showSnackBar(
      title: title.capitalizeFirst,
      message: message,
      backgroundColor: AppColors.white,
      textColor: AppColors.textBlack,
    );
  }

  static void info(String message, [String title = "Info"]) {
    _showSnackBar(
      title: title,
      message: message,
      backgroundColor: AppColors.grayDark,
    );
  }

  static void success(String message, [String title = "Success"]) {
    _showSnackBar(
      title: title,
      message: message,
      backgroundColor: Colors.greenAccent,
    );
  }

  static void warn(String message, [String title = "Note"]) {
    _showSnackBar(
      title: title,
      message: message,
      backgroundColor: Colors.orangeAccent,
    );
  }

  static void error(String message, [String title = "Error"]) {
    _showSnackBar(
      title: title,
      message: message,
      backgroundColor: Colors.redAccent,
    );
  }

  static void _showSnackBar({
    String? message,
    String? title,
    Color? backgroundColor,
    Color textColor = Colors.white,
  }) {
    Get.snackbar(
      title!,
      message!,
      backgroundColor: backgroundColor,
      colorText: textColor,
      boxShadows: [
        const BoxShadow(
          color: AppColors.blackShadow,
          blurRadius: 15,
          offset: Offset(2, 2), // Shadow position
        ),
        const BoxShadow(
          color: AppColors.blackShadow,
          blurRadius: 15,
          offset: Offset(-2, -2), // Shadow position
        ),
      ],
    );
  }
}
