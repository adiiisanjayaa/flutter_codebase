import 'package:aizen/core/themes/themes.dart';
import 'package:flutter/material.dart';

enum LCButtonType {
  filled,
  filledReverse,
  outline,
  outlineTransparan,
  text,
  filledText,
  gradient,
  textWithIcon,
}

class AppButton extends StatelessWidget {
  final Widget Function(BuildContext context, TextStyle style) childBuilder;
  final LCButtonType type;
  final EdgeInsets? padding;
  final VoidCallback? onPressed;
  final Color? buttonColor;
  final Color? colorOutline;
  final Color? shadowColor;
  final bool enabled;
  final double fontSize = 16.0;
  final double? radiusButton;
  final Widget? icon;
  final Color? colorTextIcon;
  const AppButton(
      {super.key,
      this.type = LCButtonType.filled,
      this.padding,
      required this.childBuilder,
      this.onPressed,
      this.buttonColor,
      this.radiusButton,
      this.colorTextIcon,
      this.icon,
      this.colorOutline,
      this.shadowColor,
      this.enabled = true});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case LCButtonType.filled:
        return BuildFilled(
            context: context,
            buttonColor: buttonColor,
            radiusButton: radiusButton,
            shadowColor: shadowColor,
            enabled: enabled,
            onPressed: onPressed,
            padding: padding,
            childBuilder: childBuilder,
            fontSize: fontSize);
      case LCButtonType.filledReverse:
        return BuildFilled(
            context: context,
            buttonColor: buttonColor,
            radiusButton: radiusButton,
            reverse: true,
            shadowColor: shadowColor,
            enabled: enabled,
            onPressed: onPressed,
            padding: padding,
            childBuilder: childBuilder,
            fontSize: fontSize);
      case LCButtonType.outline:
        return BuildOutline(
            enabled: enabled,
            colorOutline: colorOutline,
            radiusButton: radiusButton,
            buttonColor: buttonColor,
            shadowColor: shadowColor,
            onPressed: onPressed,
            padding: padding,
            childBuilder: childBuilder,
            fontSize: fontSize,
            context: context);
      case LCButtonType.outlineTransparan:
        return BuildOutlineTransparan(
          radiusButton: radiusButton,
          enabled: enabled,
          onPressed: onPressed,
          padding: padding,
          childBuilder: childBuilder,
          fontSize: fontSize,
          context: context,
        );
      case LCButtonType.text:
        return BuildText(
          padding: padding,
          radiusButton: radiusButton,
          enabled: enabled,
          onPressed: onPressed,
          childBuilder: childBuilder,
          fontSize: fontSize,
          context: context,
        );
      case LCButtonType.filledText:
        return BuildTextFilled(
          buttonColor: buttonColor,
          padding: padding,
          radiusButton: radiusButton,
          enabled: enabled,
          onPressed: onPressed,
          childBuilder: childBuilder,
          fontSize: fontSize,
          context: context,
        );
      case LCButtonType.gradient:
        return BuildGradient(
          enabled: enabled,
          radiusButton: radiusButton,
          onPressed: onPressed,
          padding: padding,
          childBuilder: childBuilder,
          fontSize: fontSize,
          context: context,
        );
      case LCButtonType.textWithIcon:
        return BuildTextIcon(
            padding: padding,
            radiusButton: radiusButton,
            enabled: enabled,
            onPressed: onPressed,
            icon: icon,
            childBuilder: childBuilder,
            colorTextIcon: colorTextIcon,
            fontSize: fontSize,
            context: context);
    }
  }
}

class BuildFilled extends StatelessWidget {
  const BuildFilled(
      {super.key,
      required this.context,
      this.reverse = false,
      this.shadowColor,
      this.radiusButton,
      this.buttonColor,
      required this.enabled,
      this.onPressed,
      this.padding,
      required this.childBuilder,
      required this.fontSize});
  final BuildContext context;
  final bool reverse;
  final Color? shadowColor;
  final double? radiusButton;
  final Color? buttonColor;
  final bool enabled;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final Widget Function(BuildContext context, TextStyle style) childBuilder;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        shadowColor: shadowColor,
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
        padding: padding,
        child: childBuilder(
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

class BuildOutline extends StatelessWidget {
  const BuildOutline({
    super.key,
    required this.enabled,
    required this.colorOutline,
    required this.radiusButton,
    required this.buttonColor,
    required this.shadowColor,
    required this.onPressed,
    required this.padding,
    required this.childBuilder,
    required this.fontSize,
    required this.context,
  });

  final bool enabled;
  final Color? colorOutline;
  final double? radiusButton;
  final Color? buttonColor;
  final Color? shadowColor;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final Widget Function(BuildContext context, TextStyle style) childBuilder;
  final double fontSize;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.0,
            color: enabled && colorOutline != null
                ? colorOutline!
                : enabled && colorOutline == null
                    ? AppColors.green
                    : AppColors.grayMedium.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(radiusButton ?? 10.0),
        ),
      ).copyWith(
        backgroundColor: ButtonColorState(buttonColor ?? AppColors.white, AppColors.white),
        shadowColor: ButtonColorState(shadowColor, shadowColor),
      ),
      onPressed: enabled ? onPressed : null,
      child: Container(
        padding: padding,
        child: childBuilder(
          context,
          TextStyle(
            color: enabled && colorOutline != null
                ? colorOutline!
                : enabled && colorOutline == null
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

class BuildOutlineTransparan extends StatelessWidget {
  const BuildOutlineTransparan({
    super.key,
    required this.radiusButton,
    required this.enabled,
    required this.onPressed,
    required this.padding,
    required this.childBuilder,
    required this.fontSize,
    required this.context,
  });

  final double? radiusButton;
  final bool enabled;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final Widget Function(BuildContext context, TextStyle style) childBuilder;
  final double fontSize;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1.0, color: AppColors.white),
          borderRadius: BorderRadius.circular(radiusButton ?? 10.0),
        ),
      ).copyWith(backgroundColor: ButtonColorState(Colors.transparent, Colors.transparent)),
      onPressed: enabled ? onPressed : null,
      child: Container(
        padding: padding,
        child: childBuilder(
          context,
          TextStyle(
            color: enabled ? AppColors.white : AppColors.white.withAlpha(90),
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

class BuildTextIcon extends StatelessWidget {
  const BuildTextIcon({
    super.key,
    required this.padding,
    required this.radiusButton,
    required this.enabled,
    required this.onPressed,
    required this.icon,
    required this.childBuilder,
    required this.colorTextIcon,
    required this.fontSize,
    required this.context,
  });

  final EdgeInsets? padding;
  final double? radiusButton;
  final bool enabled;
  final VoidCallback? onPressed;
  final Widget? icon;
  final Widget Function(BuildContext context, TextStyle style) childBuilder;
  final Color? colorTextIcon;
  final double fontSize;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
          elevation: 0.0,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: padding,
          shape: RoundedRectangleBorder(side: const BorderSide(style: BorderStyle.none, width: 0), borderRadius: BorderRadius.circular(radiusButton ?? 10.0))),
      onPressed: enabled ? onPressed : null,
      icon: icon ?? Container(),
      label: childBuilder(
        context,
        TextStyle(
          color: colorTextIcon,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          fontFamily: 'MavenPro',
          height: 1.1,
        ),
      ),
    );
  }
}

class BuildGradient extends StatelessWidget {
  const BuildGradient({
    super.key,
    required this.enabled,
    required this.radiusButton,
    required this.onPressed,
    required this.padding,
    required this.childBuilder,
    required this.fontSize,
    required this.context,
  });

  final bool enabled;
  final double? radiusButton;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final Widget Function(BuildContext context, TextStyle style) childBuilder;
  final double fontSize;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)],
        gradient: LinearGradient(
          colors: enabled ? AppColors.color_gradient_button : [AppColors.grayOnly, AppColors.grayOnly],
        ),
        borderRadius: BorderRadius.circular(radiusButton ?? 5),
      ),
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          padding: MaterialStateProperty.all(padding),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusButton ?? 5))),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: childBuilder(
          context,
          TextStyle(
            color: enabled ? AppColors.white : AppColors.grayMedium,
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

class BuildTextFilled extends StatelessWidget {
  const BuildTextFilled({
    super.key,
    required this.buttonColor,
    required this.padding,
    required this.radiusButton,
    required this.enabled,
    required this.onPressed,
    required this.childBuilder,
    required this.fontSize,
    required this.context,
  });

  final Color? buttonColor;
  final EdgeInsets? padding;
  final double? radiusButton;
  final bool enabled;
  final VoidCallback? onPressed;
  final Widget Function(BuildContext context, TextStyle style) childBuilder;
  final double fontSize;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: buttonColor ?? AppColors.white,
          elevation: 0.0,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: padding,
          shape: RoundedRectangleBorder(side: const BorderSide(style: BorderStyle.none, width: 0), borderRadius: BorderRadius.circular(radiusButton ?? 10.0))),
      onPressed: enabled ? onPressed : null,
      child: Container(
        padding: padding,
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

class BuildText extends StatelessWidget {
  const BuildText({
    super.key,
    required this.padding,
    required this.radiusButton,
    required this.enabled,
    required this.onPressed,
    required this.childBuilder,
    required this.fontSize,
    required this.context,
  });

  final EdgeInsets? padding;
  final double? radiusButton;
  final bool enabled;
  final VoidCallback? onPressed;
  final Widget Function(BuildContext context, TextStyle style) childBuilder;
  final double fontSize;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          elevation: 0.0,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: padding,
          shape: RoundedRectangleBorder(side: const BorderSide(style: BorderStyle.none, width: 0), borderRadius: BorderRadius.circular(radiusButton ?? 10.0))),
      onPressed: enabled ? onPressed : null,
      child: Container(
        padding: padding,
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
