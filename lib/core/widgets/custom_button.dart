import 'package:app/core/themes/themes.dart';
import 'package:flutter/material.dart';

enum ButtonType {
  filled,
  outline,
  text,
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.type,
    required this.childBuilder,
    required this.isFullButton,
    this.paddingButton,
    this.isLoading,
    this.loadingColor = AppColors.white,
    this.onPressed,
    this.buttonColor,
    this.buttonColorOutline,
    this.enabled = true,
    this.radiusButton,
    this.icon,
    this.colorTextIcon,
    this.reverse = false,
    this.fontSize = 16.0,
    this.height,
  });

  final ButtonType type;
  final Widget Function(BuildContext context, TextStyle style) childBuilder;
  final bool isFullButton;
  final EdgeInsetsGeometry? paddingButton;
  final bool? isLoading;
  final Color loadingColor;
  final VoidCallback? onPressed;
  final Color? buttonColor;
  final Color? buttonColorOutline;
  final bool enabled;
  final double fontSize;
  final double? radiusButton;
  final Widget? icon;
  final Color? colorTextIcon;
  final bool reverse;
  final double? height;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ButtonType.filled:
        return BuildFilledButton(
          context: context,
          paddingButton: paddingButton,
          isFullButton: isFullButton,
          reverse: reverse,
          enabled: enabled,
          childBuilder: childBuilder,
          fontSize: fontSize,
          radiusButton: radiusButton,
          buttonColor: buttonColor,
          onPressed: onPressed,
          height: height,
          isLoading: isLoading,
          loadingColor: loadingColor,
        );
      case ButtonType.outline:
        return BuildOutlineButton(
          context: context,
          paddingButton: paddingButton,
          isFullButton: isFullButton,
          reverse: reverse,
          enabled: enabled,
          childBuilder: childBuilder,
          fontSize: fontSize,
          radiusButton: radiusButton,
          buttonColor: buttonColor,
          buttonColorOutline: buttonColorOutline,
          onPressed: onPressed,
          isLoading: isLoading,
          loadingColor: loadingColor,
        );
      case ButtonType.text:
        return BuildTextButton(
          isLoading: isLoading,
          loadingColor: loadingColor,
          buttonColor: buttonColor,
          colorTextIcon: colorTextIcon,
          radiusButton: radiusButton,
          enabled: enabled,
          onPressed: onPressed,
          paddingButton: paddingButton,
          childBuilder: childBuilder,
          icon: icon,
          fontSize: fontSize,
        );
    }
  }
}

class BuildFilledButton extends StatelessWidget {
  const BuildFilledButton({
    super.key,
    required this.context,
    required this.isFullButton,
    this.isLoading,
    this.loadingColor = AppColors.white,
    required this.reverse,
    this.radiusButton,
    this.buttonColor,
    required this.enabled,
    this.onPressed,
    required this.childBuilder,
    required this.fontSize,
    this.height,
    required this.paddingButton,
  });

  final BuildContext context;
  final EdgeInsetsGeometry? paddingButton;
  final bool isFullButton;
  final bool? isLoading;
  final Color loadingColor;
  final bool reverse;
  final double? radiusButton;
  final Color? buttonColor;
  final bool enabled;
  final VoidCallback? onPressed;
  final Widget Function(BuildContext context, TextStyle style) childBuilder;
  final double fontSize;
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (isFullButton) {
      return SizedBox(
        width: double.infinity,
        height: height,
        child: FilledButtonItem(
          context: context,
          paddingButton: paddingButton,
          isLoading: isLoading,
          loadingColor: loadingColor,
          reverse: reverse,
          radiusButton: radiusButton,
          buttonColor: buttonColor,
          enabled: enabled,
          onPressed: onPressed,
          childBuilder: childBuilder,
          fontSize: fontSize,
        ),
      );
    } else {
      return FilledButtonItem(
        context: context,
        paddingButton: paddingButton,
        isLoading: isLoading,
        loadingColor: loadingColor,
        reverse: reverse,
        radiusButton: radiusButton,
        buttonColor: buttonColor,
        enabled: enabled,
        onPressed: onPressed,
        childBuilder: childBuilder,
        fontSize: fontSize,
      );
    }
  }
}

class BuildOutlineButton extends StatelessWidget {
  const BuildOutlineButton({
    super.key,
    required this.context,
    required this.isFullButton,
    this.isLoading,
    this.loadingColor = AppColors.white,
    required this.reverse,
    this.radiusButton,
    this.buttonColor,
    required this.enabled,
    this.onPressed,
    required this.childBuilder,
    required this.fontSize,
    this.height,
    required this.paddingButton,
    this.buttonColorOutline,
  });

  final BuildContext context;
  final EdgeInsetsGeometry? paddingButton;
  final bool isFullButton;
  final bool? isLoading;
  final Color loadingColor;
  final bool reverse;
  final double? radiusButton;
  final Color? buttonColor;
  final Color? buttonColorOutline;
  final bool enabled;
  final VoidCallback? onPressed;
  final Widget Function(BuildContext context, TextStyle style) childBuilder;
  final double fontSize;
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (isFullButton) {
      return SizedBox(
        width: double.infinity,
        height: height,
        child: OutlineButtonItem(
          context: context,
          paddingButton: paddingButton,
          isLoading: isLoading,
          loadingColor: loadingColor,
          reverse: reverse,
          radiusButton: radiusButton,
          buttonColor: buttonColor,
          buttonColorOutline: buttonColorOutline,
          enabled: enabled,
          onPressed: onPressed,
          childBuilder: childBuilder,
          fontSize: fontSize,
        ),
      );
    } else {
      return OutlineButtonItem(
        context: context,
        paddingButton: paddingButton,
        isLoading: isLoading,
        loadingColor: loadingColor,
        reverse: reverse,
        radiusButton: radiusButton,
        buttonColor: buttonColor,
        buttonColorOutline: buttonColorOutline,
        enabled: enabled,
        onPressed: onPressed,
        childBuilder: childBuilder,
        fontSize: fontSize,
      );
    }
  }
}

class BuildTextButton extends StatelessWidget {
  const BuildTextButton({
    super.key,
    this.isLoading,
    this.loadingColor,
    this.buttonColor,
    this.colorTextIcon,
    this.radiusButton,
    required this.enabled,
    this.onPressed,
    this.paddingButton,
    required this.childBuilder,
    this.icon,
    required this.fontSize,
  });

  final bool? isLoading;
  final Color? loadingColor;
  final Color? buttonColor;
  final Color? colorTextIcon;
  final double? radiusButton;
  final bool enabled;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? paddingButton;
  final Widget Function(BuildContext context, TextStyle style) childBuilder;
  final Widget? icon;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return TextButtonItem(
      paddingButton: paddingButton,
      isLoading: isLoading,
      loadingColor: loadingColor,
      buttonColor: buttonColor,
      colorTextIcon: colorTextIcon,
      radiusButton: radiusButton,
      enabled: enabled,
      onPressed: onPressed,
      childBuilder: childBuilder,
      icon: icon,
      fontSize: fontSize,
    );
  }
}

class FilledButtonItem extends StatelessWidget {
  const FilledButtonItem({
    super.key,
    required this.context,
    this.isLoading,
    required this.reverse,
    this.radiusButton,
    this.buttonColor,
    required this.enabled,
    this.onPressed,
    required this.childBuilder,
    required this.fontSize,
    this.loadingColor = AppColors.white,
    this.paddingButton = const EdgeInsets.symmetric(vertical: 12),
  });

  final BuildContext context;
  final bool? isLoading;
  final Color loadingColor;
  final bool reverse;
  final double? radiusButton;
  final Color? buttonColor;
  final bool enabled;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? paddingButton;
  final Widget Function(BuildContext context, TextStyle style) childBuilder;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusButton ?? 10.0),
        ),
      ).copyWith(
        backgroundColor: ButtonColorState(
          reverse ? AppColors.white : buttonColor ?? AppColors.green,
          const Color(0xFFE6E6E6),
        ),
      ),
      onPressed: enabled ? onPressed : null,
      child: Container(
        padding: paddingButton,
        child: (isLoading ?? false)
            ? SizedBox(
                height: 25,
                width: 25,
                child: Center(
                  child: CircularProgressIndicator(
                    color: loadingColor,
                  ),
                ),
              )
            : childBuilder(
                context,
                TextStyle(
                  color: enabled ? (reverse ? AppColors.green : AppColors.white) : AppColors.grayMedium,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,
                  fontFamily: 'MavenPro',
                  height: 1.1,
                ),
              ),
      ),
    );
  }
}

class OutlineButtonItem extends StatelessWidget {
  const OutlineButtonItem({
    super.key,
    required this.context,
    this.isLoading,
    required this.reverse,
    this.radiusButton,
    this.buttonColor,
    required this.enabled,
    this.onPressed,
    required this.childBuilder,
    required this.fontSize,
    this.loadingColor = AppColors.white,
    required this.paddingButton,
    this.buttonColorOutline,
  });

  final BuildContext context;
  final bool? isLoading;
  final Color? loadingColor;
  final bool reverse;
  final double? radiusButton;
  final Color? buttonColor;
  final Color? buttonColorOutline;
  final bool enabled;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? paddingButton;
  final Widget Function(BuildContext context, TextStyle style) childBuilder;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.0,
            color: enabled && buttonColorOutline != null
                ? buttonColorOutline!
                : enabled && buttonColorOutline == null
                    ? AppColors.green
                    : AppColors.grayMedium.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(radiusButton ?? 10.0),
        ),
      ).copyWith(
        backgroundColor: ButtonColorState(
          reverse ? AppColors.white : buttonColor ?? AppColors.white,
          AppColors.white,
        ),
      ),
      onPressed: enabled ? onPressed : null,
      child: Container(
        padding: paddingButton,
        child: (isLoading ?? false)
            ? SizedBox(
                height: 25,
                width: 25,
                child: Center(
                  child: CircularProgressIndicator(
                    color: loadingColor ?? buttonColorOutline,
                  ),
                ),
              )
            : childBuilder(
                context,
                TextStyle(
                  color: enabled && buttonColorOutline != null
                      ? buttonColorOutline!
                      : enabled && buttonColorOutline == null
                          ? AppColors.green
                          : AppColors.whiteGray.withAlpha(90),
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,
                  fontFamily: 'MavenPro',
                  height: 1.1,
                ),
              ),
      ),
    );
  }
}

class TextButtonItem extends StatelessWidget {
  const TextButtonItem({
    super.key,
    this.isLoading,
    this.loadingColor,
    this.buttonColor,
    this.colorTextIcon,
    this.radiusButton,
    required this.enabled,
    this.onPressed,
    this.paddingButton,
    required this.childBuilder,
    this.icon,
    required this.fontSize,
  });

  final bool? isLoading;
  final Color? loadingColor;
  final Color? buttonColor;
  final Color? colorTextIcon;
  final double? radiusButton;
  final bool enabled;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? paddingButton;
  final Widget Function(BuildContext context, TextStyle style) childBuilder;
  final Widget? icon;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return icon != null
        ? TextButton.icon(
            style: TextButton.styleFrom(
              elevation: 0.0,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: paddingButton,
              shape: RoundedRectangleBorder(
                side: const BorderSide(style: BorderStyle.none, width: 0),
                borderRadius: BorderRadius.circular(radiusButton ?? 10.0),
              ),
            ),
            onPressed: enabled ? onPressed : null,
            icon: icon ?? Container(),
            label: childBuilder(
              context,
              TextStyle(
                color: colorTextIcon ?? AppColors.green,
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
                fontFamily: 'MavenPro',
                height: 1.1,
              ),
            ),
          )
        : TextButton(
            style: TextButton.styleFrom(
              backgroundColor: buttonColor ?? AppColors.white,
              foregroundColor: buttonColor ?? AppColors.white,
              elevation: 0.0,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: paddingButton,
              shape: RoundedRectangleBorder(
                side: const BorderSide(style: BorderStyle.none, width: 0),
                borderRadius: BorderRadius.circular(radiusButton ?? 10.0),
              ),
            ),
            onPressed: enabled ? onPressed : null,
            child: Container(
              padding: paddingButton,
              child: childBuilder(
                context,
                TextStyle(
                  color: AppColors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,
                  fontFamily: 'MavenPro',
                  height: 1.1,
                ),
              ),
            ),
          );
  }
}

class ButtonColorState extends MaterialStateProperty<Color?> {
  ButtonColorState(this.primary, this.onSurface);

  final Color? primary;
  final Color? onSurface;

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) return onSurface;
    return primary;
  }
}
