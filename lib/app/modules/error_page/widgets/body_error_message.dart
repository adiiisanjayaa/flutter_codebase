import 'package:app/core/themes/themes.dart';
import 'package:app/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BodyErrorMessage extends StatelessWidget {
  const BodyErrorMessage({
    super.key,
    this.image,
    required this.title,
    required this.content,
    required this.titleAction,
    required this.action,
  });

  final String? image;
  final String title;
  final String content;
  final String titleAction;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppImage(
                asset: image,
              ).marginOnly(bottom: 20),
              Text(
                title,
                style: AppStyles.styleTextBody(
                  colorText: AppColors.textBlack,
                  height: 1.4,
                  size: 18.sp,
                ),
                textAlign: TextAlign.center,
              ).marginOnly(bottom: 16.0),
              Text(
                content,
                style: AppStyles.styleTextBody(
                  colorText: AppColors.grayMedium,
                  height: 1.4,
                  size: 14.sp,
                ),
                textAlign: TextAlign.center,
              ).marginOnly(bottom: 22.0),
              GestureDetector(
                onTap: action,
                child: Text(
                  titleAction,
                  style: AppStyles.styleTextBody(
                    colorText: AppColors.purple,
                    fontWeight: FontWeight.bold,
                    size: 16.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ).marginOnly(bottom: 100),
            ],
          ),
        ],
      ),
    );
  }
}
