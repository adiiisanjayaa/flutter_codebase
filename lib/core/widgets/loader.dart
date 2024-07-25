import 'dart:async';
import 'dart:io';

import 'package:app/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OverLayLoader {
  OverLayLoader._privateConstructor();

  static final OverLayLoader find = OverLayLoader._privateConstructor();

  Route? _dialogRoute;

  /// shows popup loading view
  Future<void> show([String text = "Loading Please Wait"]) async {
    final Completer completer = Completer();
    Get.dialog(
      _LoaderWidget(
        text: text,
        contextCallback: (context) {
          _storeRoute(context);
          if (!completer.isCompleted) completer.complete();
        },
        removeContext: () => _dialogRoute = null,
      ),
      barrierDismissible: false,
      routeSettings: const RouteSettings(name: "Dialog loader"),
    );
    return completer.future;
  }

  /// hide popup loading view
  void hide() => _removeRoute();

  /// store route info
  void _storeRoute(BuildContext context) {
    _dialogRoute = ModalRoute.of(context);
  }

  /// remove route from the stack
  void _removeRoute() {
    if (_dialogRoute == null) return;
    Get.removeRoute(_dialogRoute!);
    _dialogRoute = null;
  }
}

class _LoaderWidget extends StatelessWidget {
  final String? text;
  final ValueChanged<BuildContext>? contextCallback;
  final VoidCallback? removeContext;
  const _LoaderWidget({
    this.text,
    this.contextCallback,
    this.removeContext,
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
          child: _LoaderSection(text: text),
        ),
      ),
    );
  }
}

class _LoaderSection extends StatelessWidget {
  const _LoaderSection({
    required this.text,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const CircularProgressIndicator(
              color: AppColors.green,
            ),
            const SizedBox(height: 16),
            Text(
              text!,
              style: AppStyles.styleText(
                size: 16.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
