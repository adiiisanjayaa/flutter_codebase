import 'dart:io';
import 'dart:math';
import 'package:app/core/themes/themes.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImage extends StatefulWidget {
  final String? url;
  final String? asset;
  final String? svg;
  final IconData? icon;
  final BoxFit fit;
  final Widget? loading;
  final Widget? failed;
  final int? cacheSize;
  final BoxShape? shape;
  final BoxBorder? border;
  final BorderRadius? borderRadius;
  final Clip clipBehavior;
  final double? width;
  final double? height;
  final Color? color;
  final Color? backgroundColor;
  final double? ratioImage;
  final bool? isUseFlutterImageAsset;
  final File? file;
  final Widget? skeletonWidget;
  const AppImage(
      {super.key,
      this.url,
      this.asset,
      this.svg,
      this.icon,
      this.border,
      this.skeletonWidget,
      this.shape,
      this.isUseFlutterImageAsset,
      this.borderRadius,
      this.clipBehavior = Clip.antiAlias,
      this.fit = BoxFit.contain,
      this.loading,
      this.failed,
      this.width,
      this.height,
      this.cacheSize,
      this.file,
      this.color,
      this.backgroundColor,
      this.ratioImage});

  @override
  AppImageState createState() => AppImageState();
}

class AppImageState extends State<AppImage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500), lowerBound: 0.0, upperBound: 1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.url != null) {
      return ExtendedImage.network(
        widget.url!,
        fit: widget.fit,
        compressionRatio: widget.ratioImage,
        maxBytes: widget.cacheSize,
        cache: true,
        border: widget.border,
        shape: widget.shape,
        borderRadius: widget.borderRadius,
        width: widget.width,
        height: widget.height,
        color: widget.color,
        loadStateChanged: (ExtendedImageState state) {
          switch (state.extendedImageLoadState) {
            case LoadState.loading:
              _controller.reset();
              return widget.skeletonWidget ??
                  const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.green,
                    ),
                  );
            case LoadState.completed:
              _controller.forward();

              ///if you don't want override completed widget
              ///please return null or state.completedWidget
              //return null;
              //return state.completedWidget;
              return FadeTransition(
                opacity: _controller,
                child: ExtendedRawImage(
                  image: state.extendedImageInfo?.image,
                  fit: widget.fit,
                  width: widget.width,
                  height: widget.height,
                  color: widget.color,
                ),
              );
            case LoadState.failed:
              _controller.reset();
              //remove memory cached
              state.imageProvider.evict();
              return Container(color: Colors.transparent);
          }
        },
      );
    } else if (widget.asset != null) {
      return widget.isUseFlutterImageAsset == true
          ? Image.asset(
              widget.asset!,
              fit: widget.fit,
              width: widget.width,
              height: widget.height,
              color: widget.color,
            )
          : ExtendedImage.asset(
              widget.asset!,
              fit: widget.fit,
              border: widget.border,
              shape: widget.shape,
              borderRadius: widget.borderRadius,
              width: widget.width,
              height: widget.height,
              color: widget.color,
              enableMemoryCache: true,
            );
    } else if (widget.file != null) {
      return ExtendedImage.file(
        widget.file!,
        fit: widget.fit,
        border: widget.border,
        shape: widget.shape,
        borderRadius: widget.borderRadius,
        width: widget.width,
        height: widget.height,
        color: widget.color,
      );
    } else if (widget.icon != null) {
      return _buildIcon();
    } else {
      return _buildSvg();
    }
  }

  Widget _buildIcon() {
    Widget current = Container(
      width: widget.width,
      height: widget.height,
      color: widget.backgroundColor ?? Colors.white,
      child: Icon(
        widget.icon,
        color: widget.color,
      ),
    );
    return _buildMisc(current);
  }

  Widget _buildSvg() {
    Widget current = widget.svg == null
        ? Container(
            width: widget.width,
            height: widget.height,
            color: Colors.white,
            child: SvgPicture.asset(
              // Assets.takePicture,
              "",
              width: widget.width,
              height: widget.height,
              colorFilter: widget.color != null ? ColorFilter.mode(widget.color ?? Colors.transparent, BlendMode.srcIn) : null,
              // color: widget.color,
            ),
          )
        : SvgPicture.asset(
            widget.svg!,
            width: widget.width,
            height: widget.height,
            colorFilter: widget.color != null ? ColorFilter.mode(widget.color ?? Colors.transparent, BlendMode.srcIn) : null,
            // color: widget.color,
          );
    return _buildMisc(current);
  }

  Widget _buildMisc(Widget current) {
    if (widget.shape != null) {
      switch (widget.shape!) {
        case BoxShape.circle:
          current = ClipOval(
            clipBehavior: widget.clipBehavior,
            child: current,
          );
          break;
        case BoxShape.rectangle:
          if (widget.borderRadius != null) {
            current = ClipRRect(
              borderRadius: widget.borderRadius ?? BorderRadius.zero,
              clipBehavior: widget.clipBehavior,
              child: current,
            );
          }
          break;
      }
    }
    if (widget.border != null) {
      current = CustomPaint(
        foregroundPainter: ExtendedImageBorderPainter(borderRadius: widget.borderRadius, border: widget.border, shape: widget.shape ?? BoxShape.rectangle),
        size: widget.width != null && widget.height != null ? Size(widget.width!, widget.height!) : Size.zero,
        child: current,
      );
    }
    return current;
  }

  double getProgressSize() {
    final double width = widget.width ?? 0;
    final double height = widget.height ?? width;
    if (width != 0 || height != 0) {
      final double lowest = min(width, height);
      return (lowest / 2).floorToDouble();
    }
    return 20;
  }
}
