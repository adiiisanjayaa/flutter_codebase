import 'package:app/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum LancerAppBarLeading { back, close, none, custom }

class CustomAppBar extends StatelessWidget {
  final String title;
  final Widget? widget;
  final double height;
  final Widget? background;
  final bool includeSafeArea;
  final LancerAppBarLeading leadingType;
  final Widget? leading;
  final List<Widget>? actions;
  final TextStyle? textStyle;
  final Color? colorLeading;
  final Color? appBarColor;
  final bool? centerTitle;
  final Widget? centerWidget;
  final bool statusBarIconIsDark;
  final double? leadingWidth;

  const CustomAppBar({
    super.key,
    required this.title,
    this.widget,
    this.height = 56.0,
    this.leadingWidth,
    this.background,
    this.includeSafeArea = true,
    this.leadingType = LancerAppBarLeading.back,
    this.leading,
    this.textStyle,
    this.colorLeading,
    this.actions,
    this.centerTitle,
    this.centerWidget,
    this.appBarColor,
    this.statusBarIconIsDark = true,
  });

  @override
  Widget build(BuildContext context) {
    final double calculatedHeight = includeSafeArea ? (height + MediaQuery.of(context).padding.top) : height;
    final List<Widget> widgets = <Widget>[
      background != null
          ? background!
          : Container(
              color: appBarColor,
            )
    ];
    if (widget != null) widgets.add(widget!);
    return SizedBox(
      height: calculatedHeight,
      child: AppBar(
        leadingWidth: leadingWidth ?? 60,
        leading: leading ?? _getLeading(context),
        centerTitle: centerTitle ?? true,
        title: centerWidget ??
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textStyle ?? const TextStyle(color: AppColors.textBlack, fontWeight: FontWeight.bold, fontSize: 20),
            ),
        flexibleSpace: Stack(
          children: widgets,
        ),
        actions: actions,
        backgroundColor: appBarColor ?? Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          // For Android will affect Status Bar Icon
          statusBarIconBrightness: statusBarIconIsDark ? Brightness.dark : Brightness.light,
          // For iOS will affect Status Bar, If 'Brightness.light' make icon Dark
          statusBarBrightness: statusBarIconIsDark ? Brightness.light : Brightness.dark,
        ),
      ),
    );
  }

  Widget? _getLeading(BuildContext context) {
    action() async {
      Navigator.maybePop(context);
    }

    switch (leadingType) {
      case LancerAppBarLeading.back:
        return IconButton(
          icon: Icon(Icons.arrow_back_sharp, color: colorLeading != null ? colorLeading! : AppColors.textBlack),
          onPressed: action,
        );
      case LancerAppBarLeading.close:
        return IconButton(
          icon: Icon(Icons.close, color: colorLeading != null ? colorLeading! : AppColors.textBlack),
          onPressed: action,
        );
      case LancerAppBarLeading.custom:
        return leading;
      default:
        return Container();
    }
  }
}
