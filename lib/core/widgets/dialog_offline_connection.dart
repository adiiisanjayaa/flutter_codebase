import 'dart:async';
import 'dart:io';
import 'package:aizen/core/themes/themes.dart';
import 'package:aizen/core/widgets/app_image.dart';
import 'package:aizen/core/widgets/custom_button.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum DialogAction {
  positive,
  negative,
}

class DialogOfflineConnection {
  DialogOfflineConnection._privateConstructor();

  static final DialogOfflineConnection find = DialogOfflineConnection._privateConstructor();

  Route? _dialogRoute;
  bool _isShow = false;

  /// shows popup view
  Future<void> show({
    bool fromSplashScreen = false,
  }) async {
    if (_isShow) return;
    _isShow = true;

    final Completer completer = Completer();
    Get.dialog(
      _DialogOffline(
        contextCallback: (context) {
          _storeRoute(context);
          if (!completer.isCompleted) completer.complete();
        },
        removeContext: () => _removeRoute(),
        onAction: (action) {
          if (action == DialogAction.positive) {
            if (fromSplashScreen) {
              // Get.offAllNamed(Routes.SPLASHSCREEN);
            }
          }
          if (action == DialogAction.negative) {
            if (Platform.isAndroid) {
              AppSettings.openAppSettings(type: AppSettingsType.dataRoaming);
            }
          }
          _removeRoute();
        },
      ),
      barrierDismissible: false,
      routeSettings: const RouteSettings(name: "Dialog offline"),
    );
    return completer.future;
  }

  /// store route info
  void _storeRoute(BuildContext context) {
    _dialogRoute = ModalRoute.of(context);
  }

  /// remove route from the stack
  void _removeRoute() {
    if (_dialogRoute == null) return;
    Get.removeRoute(_dialogRoute!);
    _dialogRoute = null;
    _isShow = false;
  }
}

class _DialogOffline extends StatelessWidget {
  final ValueChanged<BuildContext>? contextCallback;
  final VoidCallback? removeContext;
  final Function(DialogAction action)? onAction;

  const _DialogOffline({
    this.contextCallback,
    this.removeContext,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    contextCallback!(context);

    bool checkValue = false;
    return Material(
      type: MaterialType.transparency,
      child: GestureDetector(
        onHorizontalDragStart: (DragStartDetails details) {
          checkValue = false;
          checkValue = details.localPosition.dx < 50 || details.localPosition.dx > (MediaQuery.of(context).size.width - 70);
        },
        onHorizontalDragEnd: (DragEndDetails details) async {
          if (checkValue && Platform.isIOS) {
            Navigator.pop(context);
          }
        },
        child: PopScope(
          canPop: true,
          onPopInvoked: (pop) async {
            removeContext!();
          },
          child: DialogOfflineSection(onAction: onAction),
        ),
      ),
    );
  }
}

class DialogOfflineSection extends StatelessWidget {
  const DialogOfflineSection({
    super.key,
    required this.onAction,
  });

  final Function(DialogAction action)? onAction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SimpleDialog(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        children: [
          const AppImage(
            // asset: Assets.noInternetConnectionNew,
            fit: BoxFit.cover,
          ).paddingOnly(left: 15.0, right: 15.0, top: 24.0),
          Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 12.0, left: 15.0, right: 15.0),
            child: Column(
              children: [
                Text(
                  "No internet connection",
                  textAlign: TextAlign.center,
                  style: AppStyles.styleTextBody18(
                    colorText: Colors.black,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Please check your internet/Wi-Fi network again and try again.",
                  textAlign: TextAlign.center,
                  style: AppStyles.styleTextBody14(
                    colorText: Colors.black,
                  ),
                ),
                // const SizedBox(height: 24),
                Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomButton(
                          type: ButtonType.outline,
                          paddingButton: const EdgeInsets.only(left: 5, right: 5),
                          radiusButton: 21,
                          onPressed: () {
                            onAction?.call(DialogAction.negative);
                          },
                          childBuilder: (_, style) => Text(
                            "Go to settings",
                            style: AppStyles.styleTextBody14(
                              size: 13,
                              fontWeight: FontWeight.w700,
                              colorText: AppColors.green,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          isFullButton: true,
                        ).marginOnly(left: 0, right: 12, top: 12, bottom: 8),
                      ),
                      Expanded(
                        child: CustomButton(
                          type: ButtonType.filled,
                          paddingButton: const EdgeInsets.symmetric(horizontal: 5),
                          radiusButton: 21,
                          onPressed: () {
                            onAction?.call(DialogAction.positive);
                          },
                          childBuilder: (_, style) => Text(
                            "Oke!",
                            textAlign: TextAlign.center,
                            style: AppStyles.styleTextBody16(
                              size: 13,
                              fontWeight: FontWeight.w700,
                              colorText: AppColors.white,
                            ),
                          ),
                          isFullButton: true,
                        ).marginOnly(left: 0, right: 0, top: 12, bottom: 8),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
