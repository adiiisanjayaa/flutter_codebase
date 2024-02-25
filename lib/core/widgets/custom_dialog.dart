import 'dart:io';

import 'package:aizen/core/themes/themes.dart';
import 'package:aizen/core/widgets/fancy_dialog.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum DialogReturn { positive, negative }

class CustomDialog {
  static void showDialogOffline({bool fromSplashScreen = false}) {
    Get.dialog(
      const AppFancyDialog(
        title: 'No internet connection',
        desc: 'Please check your internet/Wi-Fi network again and try again.',
        negativeButton: 'Go to Settings',
        positiveButton: 'Oke!',
        closeType: IdSimpleCloseType.light,
        isConnection: true,
        // withImage: AppImage(
        //     // asset: Assets.noInternetConnection,
        //     ),
      ),
    ).then((value) {
      AppFancyDialog.handleReturn(value, onNegative: () async {
        if (Platform.isAndroid) {
          AppSettings.openAppSettings(type: AppSettingsType.dataRoaming);
        }
      }, onPositive: () async {
        if (fromSplashScreen) {
          // Get.offAllNamed(Routes.SPLASHSCREEN);
        }
      });
    });
  }

  static Future<void> showDialogSingleAction({
    String? title,
    required String message,
    required String positiveText,
    required Function onPositive,
    Widget? messageWidget,
    Function? callback,
  }) async {
    await Get.dialog(
        barrierDismissible: false,
        Container(
          padding: const EdgeInsets.all(14),
          width: double.infinity,
          child: SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null && title.isNotEmpty) ...[
                      Text(
                        title,
                        style: AppStyles.styleTextBody14(
                          colorText: AppColors.textBlack,
                          fontWeight: FontWeight.w700,
                          height: 1.3,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 8),
                    ],
                    messageWidget ??
                        Text(
                          message,
                          style: AppStyles.styleTextBody14(
                            colorText: AppColors.grayMedium,
                            fontWeight: FontWeight.normal,
                            height: 1.3,
                          ),
                          textAlign: TextAlign.start,
                        ),
                  ],
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                    onTap: () {
                      Get.back(result: DialogReturn.positive);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        positiveText,
                        style: AppStyles.styleTextBody14(
                          colorText: AppColors.purple,
                          fontWeight: FontWeight.w700,
                          height: 1.3,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    )),
              ),
            ],
          ),
        )).then((value) {
      if (value != null && value == DialogReturn.positive) {
        onPositive();
      }
      if (callback != null) {
        callback();
      }
    });
  }

  static void showDialogDoubleAction({
    required String message,
    required String positiveText,
    required Function onPositive,
    required String negativeText,
    required Function onNegative,
  }) {
    Get.dialog(
        barrierDismissible: false,
        Container(
          padding: const EdgeInsets.all(14),
          width: double.infinity,
          child: SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  message,
                  style: AppStyles.styleTextBody14(
                    colorText: AppColors.grayMedium,
                    fontWeight: FontWeight.normal,
                    height: 1.3,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        Get.back(result: DialogReturn.negative);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: Text(
                          negativeText,
                          style: AppStyles.styleTextBody14(
                            colorText: AppColors.blackGrey,
                            fontWeight: FontWeight.w700,
                            height: 1.3,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      )),
                  InkWell(
                      onTap: () {
                        Get.back(result: DialogReturn.positive);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: Text(
                          positiveText,
                          style: AppStyles.styleTextBody14(
                            colorText: AppColors.purple,
                            fontWeight: FontWeight.w700,
                            height: 1.3,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      )),
                ],
              )
            ],
          ),
        )).then((value) {
      if (value != null && value == DialogReturn.positive) {
        onPositive();
      } else if (value != null && value == DialogReturn.negative) {
        onNegative();
      }
    });
  }

  static void showDialogLoading({
    required String message,
    required Function(dynamic) callback,
  }) {
    Get.dialog(
      barrierDismissible: false,
      SimpleDialog(
        contentPadding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        children: [
          const Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              color: AppColors.green,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            message,
            style: AppStyles.styleTextBody14(colorText: AppColors.blackGrey, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  static void showDialogForceUpdateApp({required Function() updateCallback}) {
    Get.dialog(
        barrierDismissible: false,
        SizedBox(
          width: double.infinity,
          child: SimpleDialog(
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
            alignment: Alignment.center,
            children: [
              const SizedBox(height: 14),
              Align(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Text(
                          'Update Required',
                          style: AppStyles.styleTextBody18(
                            colorText: AppColors.textBlack,
                            fontWeight: FontWeight.w700,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          'An Update is available. Please update the app to latest version',
                          style: AppStyles.styleTextBody16(
                            colorText: AppColors.textBlack,
                            fontWeight: FontWeight.w400,
                            height: 1.4,
                          ),
                        ),
                      ],
                    )),
              ),
              const SizedBox(height: 14),
              const Divider(
                color: AppColors.grayMedium,
                height: 1,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: updateCallback,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                        child: Text(
                          'Update',
                          textAlign: TextAlign.center,
                          style: AppStyles.styleTextBody16(
                            colorText: AppColors.blackGrey,
                            fontWeight: FontWeight.w700,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  static void showDialogRecommendUpdateApp({
    required Function() skipCallback,
    required Function() updateCallback,
  }) {
    Get.dialog(
        barrierDismissible: false,
        SizedBox(
          width: double.infinity,
          child: SimpleDialog(
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
            alignment: Alignment.center,
            children: [
              const SizedBox(height: 14),
              Align(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Text(
                          'Update Available',
                          style: AppStyles.styleTextBody18(
                            colorText: AppColors.textBlack,
                            fontWeight: FontWeight.w700,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          'An Update is available. Would you like to update ?',
                          style: AppStyles.styleTextBody16(
                            colorText: AppColors.textBlack,
                            fontWeight: FontWeight.w400,
                            height: 1.4,
                          ),
                        ),
                      ],
                    )),
              ),
              const SizedBox(height: 14),
              const Divider(
                color: AppColors.grayMedium,
                height: 1,
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: skipCallback,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 16, 8, 20),
                          child: Text(
                            'Skip',
                            textAlign: TextAlign.center,
                            style: AppStyles.styleTextBody16(
                              colorText: AppColors.blackGrey,
                              fontWeight: FontWeight.w700,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const VerticalDivider(
                      color: AppColors.grayMedium,
                      width: 1,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: updateCallback,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 16, 8, 20),
                          child: Text(
                            'Update',
                            textAlign: TextAlign.center,
                            style: AppStyles.styleTextBody16(
                              colorText: AppColors.blackGrey,
                              fontWeight: FontWeight.w700,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
