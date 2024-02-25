part of 'extensions.dart';

extension WidgetUtils on Widget {
  Padding padding(EdgeInsets padding) => Padding(
        padding: padding,
        child: this,
      );

  Padding paddingPoints({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          left: left,
          top: top,
          bottom: bottom,
          right: right,
        ),
        child: this,
      );

  Expanded expanded([int flex = 1]) => Expanded(
        flex: flex,
        child: this,
      );

  Flexible flexible() => Flexible(
        child: this,
      );
}
