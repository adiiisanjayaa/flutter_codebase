import 'package:app/core/themes/themes.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum IdSimpleCloseType { light, dark, none }

enum IdSimpleDialogReturn { positive, negative }

class AppFancyDialog extends StatefulWidget {
  final Widget? withImage;
  final String title;
  final String? desc;
  final int? textSize;
  final Widget? descWidget;
  final String? positiveButton;
  final String? negativeButton;
  final Color? positiveButtonColor;
  final IdSimpleCloseType closeType;
  final bool isConnection;

  const AppFancyDialog({super.key, required this.title, this.withImage, this.desc, this.descWidget, this.textSize, this.positiveButton, this.negativeButton, this.positiveButtonColor, this.closeType = IdSimpleCloseType.dark, this.isConnection = false});

  @override
  AppDialogState createState() => AppDialogState();

  static handleReturn(IdSimpleDialogReturn? value, {Function? onPositive, Function? onNegative, Function? onCancel}) {
    switch (value) {
      case IdSimpleDialogReturn.positive:
        onPositive?.call();
        break;
      case IdSimpleDialogReturn.negative:
        onNegative?.call();
        break;
      default:
        onCancel?.call();
        break;
    }
  }
}

class AppDialogState extends State<AppFancyDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(backgroundColor: Colors.transparent, child: contentBox(context));
  }

  Visibility _image() {
    Size size = MediaQuery.of(context).size;
    return Visibility(
      visible: widget.withImage != null,
      child: Stack(
        children: [
          Container(
            alignment: const Alignment(0.0, -2.0),
            padding: EdgeInsets.only(
              left: 8,
              right: 8,
              top: widget.isConnection ? size.height * 0.2 : 8,
              bottom: 20,
            ),
            child: widget.withImage,
          ),
        ],
      ),
    );
  }

  // Widget _dialog() {
  //   Size size = MediaQuery.of(context).size;
  //   return Column(
  //     children: [
  //       Visibility(
  //           child: Container(
  //         height: size.height * 0.27,
  //       )),
  //       Container(
  //         alignment: Alignment.topCenter,
  //         margin: const EdgeInsets.symmetric(horizontal: 16),
  //         padding: const EdgeInsets.only(left: 8, right: 8, top: 0),
  //         child: Text(
  //           widget.title,
  //           style: AppStyles.styleTextBody18(
  //               colorText: Colors.black, fontWeight: FontWeight.bold),
  //           textAlign: TextAlign.center,
  //         ),
  //       ),
  //       if (widget.descWidget != null)
  //         Container(
  //             width: double.infinity,
  //             padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
  //             child: widget.descWidget!),
  //       if (widget.desc != null)
  //         Container(
  //           margin: const EdgeInsets.symmetric(horizontal: 16),
  //           padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
  //           child: Text(
  //             widget.desc!,
  //             style: AppStyles.styleTextBody14(colorText: Colors.black),
  //             textAlign: TextAlign.center,
  //           ),
  //         ),
  //       Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 12),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             if (widget.negativeButton != null)
  //               Expanded(flex: 1, child: _buildNegativeButton()),
  //             Expanded(flex: 1, child: _buildPositiveButton()),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  void closeDialog({IdSimpleDialogReturn? value}) {
    Navigator.of(context, rootNavigator: true).pop(value);
  }

  Widget _buildPositiveButton() {
    if (widget.positiveButton == null) return Container();

    return CustomButton(
      type: ButtonType.filled,
      buttonColor: widget.positiveButtonColor,
      paddingButton: const EdgeInsets.symmetric(horizontal: 5),
      radiusButton: 21,
      onPressed: () {
        closeDialog(value: IdSimpleDialogReturn.positive);
      },
      childBuilder: (_, style) => Text(
        widget.positiveButton!,
        textAlign: TextAlign.center,
        style: AppStyles.styleText(
          size: 13.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
      ),
      isFullButton: true,
    ).marginOnly(left: 0, right: 0, top: 12, bottom: 8);
  }

  Widget _buildNegativeButton() {
    if (widget.negativeButton == null) return Container();

    return CustomButton(
      type: ButtonType.outline,
      paddingButton: const EdgeInsets.only(left: 5, right: 5),
      radiusButton: 21,
      onPressed: () {
        closeDialog(value: IdSimpleDialogReturn.negative);
      },
      childBuilder: (_, style) => Text(
        widget.negativeButton!,
        style: AppStyles.styleText(
          size: 13.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.green,
        ),
        textAlign: TextAlign.center,
      ),
      isFullButton: true,
    ).marginOnly(left: 0, right: 12, top: 12, bottom: 8);
  }

  // temporary change, depend on content size the container will expand

  Widget contentBox(context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: widget.isConnection ? size.height * 0.3 : size.height * 0.1, bottom: size.height * 0.2),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                  child: Visibility(
                      child: Container(
                height: size.height * 0.2,
              ))),
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.only(left: 8, right: 8, top: 0),
                child: Text(
                  widget.title,
                  style: AppStyles.styleText(size: 20.sp, color: Colors.black, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              if (widget.descWidget != null) Container(width: double.infinity, padding: const EdgeInsets.only(left: 8, right: 8, top: 8), child: widget.descWidget!),
              if (widget.desc != null)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                  child: Text(
                    widget.desc!,
                    style: AppStyles.styleText(size: 16.sp, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.negativeButton != null) Expanded(flex: 1, child: _buildNegativeButton()),
                    Expanded(flex: 1, child: _buildPositiveButton()),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(left: 16, right: 16, child: _image()),
      ],
    );
  }
}
