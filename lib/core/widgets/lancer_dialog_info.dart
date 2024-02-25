import 'dart:io';
import 'package:aizen/core/themes/themes.dart';
import 'package:aizen/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

enum LCSimpleCloseType { light, dark, none }

enum LCSimpleDialogReturn { positive, negative }

class LancerDialogInfo extends StatefulWidget {
  final String title;
  final String? desc;
  final bool? isIconShowed;
  final bool? cancelAble;
  final String? positiveButton;
  final bool? cantClose;
  final double? borderRadius;

  const LancerDialogInfo({super.key, required this.title, this.desc, this.isIconShowed = false, this.positiveButton, this.cancelAble = true, this.cantClose = false, this.borderRadius});

  @override
  LancerDialogState createState() => LancerDialogState();

  static handleReturn(LCSimpleDialogReturn? value, {Function? onPositive, Function? onNegative, Function? onCancel}) {
    switch (value) {
      case LCSimpleDialogReturn.positive:
        onPositive?.call();
        break;
      case LCSimpleDialogReturn.negative:
        onNegative?.call();
        break;
      default:
        onCancel?.call();
        break;
    }
  }
}

class LancerDialogState extends State<LancerDialogInfo> {
  @override
  Widget build(BuildContext context) {
    bool checkValue = false;

    return widget.cancelAble!
        ? _dialog()
        : GestureDetector(
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
              child: _dialog(),
            ),
          );
  }

  Widget _dialog() {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      contentPadding: const EdgeInsets.all(16),
      children: [
        Container(
          width: 10000000000000000,
        ),
        if (widget.isIconShowed == true)
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 20),
              child: SvgPicture.asset(
                // Assets.icGreenChecked,
                "",
                width: 40,
                height: 30,
              )),
        if (widget.title.isNotEmpty)
          Container(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Text(
              widget.title,
              style: AppStyles.styleTextBody18(colorText: AppColors.blackGrey, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
        if (widget.desc != null)
          Container(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Text(
              widget.desc!,
              style: AppStyles.styleTextBody14(
                colorText: AppColors.blackGrey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        const SizedBox(height: 10),
        _buildPositiveButton(),
      ],
    );
  }

  void closeDialog({LCSimpleDialogReturn? value}) {
    Navigator.of(context, rootNavigator: true).pop(value);
  }

  Widget _buildPositiveButton() {
    if (widget.positiveButton == null) return Container();
    return CustomButton(
      type: ButtonType.filled,
      radiusButton: widget.borderRadius ?? 12.0,
      onPressed: () {
        if (widget.cantClose == false) {}
        closeDialog(value: LCSimpleDialogReturn.positive);
      },
      childBuilder: (_, style) => Text(widget.positiveButton!, style: style, textAlign: TextAlign.center),
      isFullButton: false,
    ).marginOnly(left: 8, right: 8, top: 16);
  }
}
