import 'package:app/core/themes/themes.dart';
import 'package:app/core/widgets/app_image.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum LCSimpleCloseType { light, dark, none }

enum LCSimpleDialogReturn { positive, negative }

class LancerDialog extends StatefulWidget {
  final Widget? withImage;
  final String? title;
  final String? desc;
  final Widget? descWidget;
  final String? positiveButton;
  final String? negativeButton;
  final Color? positiveButtonColor;
  final TextAlign? textAlign;
  final LCSimpleCloseType closeType;

  const LancerDialog({
    super.key,
    this.title,
    this.withImage,
    this.desc,
    this.descWidget,
    this.positiveButton,
    this.negativeButton,
    this.positiveButtonColor,
    this.closeType = LCSimpleCloseType.dark,
    this.textAlign,
  });

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

class LancerDialogState extends State<LancerDialog> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SimpleDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        children: [
          Container(
            width: 10000000000000000,
          ),
          Visibility(
            visible: widget.withImage != null,
            child: Container(alignment: Alignment.center, padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 12), child: widget.withImage),
          ),
          if (widget.title != null)
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text(
                widget.title!,
                style: AppStyles.styleTextBody(
                  colorText: Colors.black,
                  fontWeight: FontWeight.bold,
                  size: 20.sp,
                ),
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
                style: AppStyles.styleTextBody(
                  colorText: Colors.black,
                  size: 16.sp,
                ),
                textAlign: widget.textAlign ?? TextAlign.center,
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: _buildNegativeButton()),
              Expanded(child: _buildPositiveButton()),
            ],
          )
        ],
      ),
    );
  }

  closeDialog({LCSimpleDialogReturn? value}) {
    Navigator.of(context, rootNavigator: true).pop(value);
  }

  _buildPositiveButton() {
    if (widget.positiveButton == null) return Container();

    return CustomButton(
      type: ButtonType.filled,
      paddingButton: const EdgeInsets.only(left: 5, right: 5),
      buttonColor: widget.positiveButtonColor,
      radiusButton: 21,
      onPressed: () {
        closeDialog(value: LCSimpleDialogReturn.positive);
      },
      childBuilder: (_, style) => Text(
        widget.positiveButton!,
        style: AppStyles.styleTextBody(
          size: 15.sp,
          fontWeight: FontWeight.w700,
          colorText: AppColors.white,
        ),
        textAlign: TextAlign.center,
      ),
      isFullButton: true,
    ).marginOnly(left: 6, right: 12, top: 12, bottom: 8);
  }

  _buildNegativeButton() {
    if (widget.negativeButton == null) return Container();

    return CustomButton(
      type: ButtonType.outline,
      paddingButton: const EdgeInsets.only(left: 5, right: 5),
      radiusButton: 21,
      onPressed: () {
        closeDialog(value: LCSimpleDialogReturn.negative);
      },
      childBuilder: (_, style) => Text(
        widget.negativeButton!,
        style: AppStyles.styleTextBody(
          size: 15,
          fontWeight: FontWeight.w700,
          colorText: AppColors.green,
        ),
        textAlign: TextAlign.center,
      ),
      isFullButton: true,
    ).marginOnly(left: 12, right: 6, top: 12, bottom: 8);
  }
}

class LancerDialogIcon extends StatefulWidget {
  final Widget? withImage;
  final String? title;
  final String? desc;
  final Widget? descWidget;
  final String? positiveButton;
  final String? negativeButton;
  final Color? positiveButtonColor;
  final TextAlign? textAlign;
  final String? icon;
  final LCSimpleCloseType closeType;

  const LancerDialogIcon({
    super.key,
    this.title,
    this.withImage,
    this.icon,
    this.desc,
    this.descWidget,
    this.positiveButton,
    this.negativeButton,
    this.positiveButtonColor,
    this.closeType = LCSimpleCloseType.dark,
    this.textAlign,
  });

  @override
  LancerDialogIconState createState() => LancerDialogIconState();

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

class LancerDialogIconState extends State<LancerDialogIcon> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SimpleDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        children: [
          Container(
            width: 10000000000000000,
          ),
          Visibility(
            visible: widget.withImage != null,
            child: Container(alignment: Alignment.center, padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 12), child: widget.withImage),
          ),
          if (widget.title != null)
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text(
                widget.title!,
                style: AppStyles.styleTextBody(size: 20.sp, colorText: Colors.black, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          if (widget.icon != null)
            AppImage(
              svg: widget.icon,
              width: 100,
              height: 100,
            ).marginSymmetric(vertical: 15),
          if (widget.descWidget != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: widget.descWidget!,
            ),
          if (widget.desc != null)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text(
                widget.desc!,
                style: AppStyles.styleTextBody(
                  colorText: Colors.black,
                  size: 16.sp,
                ),
                textAlign: widget.textAlign ?? TextAlign.center,
              ),
            ),
          CustomButton(
            type: ButtonType.filled,
            paddingButton: const EdgeInsets.only(left: 5, right: 5),
            buttonColor: AppColors.purple,
            radiusButton: 21,
            onPressed: () {
              closeDialog(value: LCSimpleDialogReturn.positive);
            },
            childBuilder: (_, style) => Text(
              widget.positiveButton!,
              style: AppStyles.styleTextBody(
                size: 15.sp,
                fontWeight: FontWeight.w700,
                colorText: AppColors.white,
              ),
              textAlign: TextAlign.center,
            ),
            isFullButton: true,
            height: 45,
          ).marginOnly(left: 20, right: 20, top: 20, bottom: 8),
        ],
      ),
    );
  }

  void closeDialog({LCSimpleDialogReturn? value}) {
    Navigator.of(context, rootNavigator: true).pop(value);
  }
}

class LancerDialogImage extends StatefulWidget {
  final Widget? withImage;
  final String? title;
  final String? desc;
  final Widget? descWidget;
  final String? positiveButton;
  final String? negativeButton;
  final Color? positiveButtonColor;
  final TextAlign? textAlign;
  final String? icon;
  final LCSimpleCloseType closeType;

  const LancerDialogImage({
    super.key,
    this.title,
    this.withImage,
    this.icon,
    this.desc,
    this.descWidget,
    this.positiveButton,
    this.negativeButton,
    this.positiveButtonColor,
    this.closeType = LCSimpleCloseType.dark,
    this.textAlign,
  });

  @override
  LancerDialogImageState createState() => LancerDialogImageState();

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

class LancerDialogImageState extends State<LancerDialogImage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SimpleDialog(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        children: [
          if (widget.icon != null)
            ClipRRect(
              borderRadius: (const BorderRadius.all(Radius.circular(14))),
              child: AppImage(
                asset: widget.icon!,
                height: 150,
                fit: BoxFit.cover,
              ),
            ).marginOnly(bottom: 20),
          if (widget.descWidget != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: widget.descWidget!,
            ),
          if (widget.desc != null)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text(
                widget.desc!,
                style: AppStyles.styleTextBody(
                  colorText: Colors.black,
                  size: 16.sp,
                ),
                textAlign: widget.textAlign ?? TextAlign.center,
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 45,
                child: CustomButton(
                  type: ButtonType.text,
                  paddingButton: const EdgeInsets.only(left: 5, right: 5),
                  radiusButton: 21,
                  onPressed: () {
                    closeDialog(value: LCSimpleDialogReturn.positive);
                  },
                  childBuilder: (_, style) => Text(
                    widget.positiveButton!,
                    style: AppStyles.styleTextBody(size: 15.sp, fontWeight: FontWeight.w700, colorText: AppColors.purple),
                    textAlign: TextAlign.center,
                  ),
                  isFullButton: false,
                ),
              ),
              SizedBox(
                height: 45,
                child: CustomButton(
                  type: ButtonType.text,
                  paddingButton: const EdgeInsets.only(left: 5, right: 5),
                  radiusButton: 21,
                  onPressed: () {
                    closeDialog(value: LCSimpleDialogReturn.negative);
                  },
                  childBuilder: (_, style) => Text(
                    "Batal",
                    style: AppStyles.styleTextBody(size: 15.sp, fontWeight: FontWeight.w700, colorText: AppColors.purple),
                    textAlign: TextAlign.center,
                  ),
                  isFullButton: false,
                ),
              )
            ],
          ).marginOnly(top: 20)
        ],
      ),
    );
  }

  void closeDialog({LCSimpleDialogReturn? value}) {
    Navigator.of(context, rootNavigator: true).pop(value);
  }
}
