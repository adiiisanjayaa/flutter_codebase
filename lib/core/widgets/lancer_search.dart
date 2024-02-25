import 'package:aizen/core/themes/themes.dart';
import 'package:aizen/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class LancerSearch extends StatefulWidget {
  final String hint;
  final TextStyle? hintStyle;
  final VoidCallback? onTap;
  final VoidCallback? onTapX;
  final bool? visibileClose;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FocusNode? focus;
  final bool? autoFocus;
  final List<TextInputFormatter>? formatters;
  final TextInputType? textInputType;
  final TextCapitalization? textCapitalization;
  final AppImage? leadingAsset;
  final double? leadingPadding;
  final int? maxLength;
  const LancerSearch(
      {super.key,
      this.textCapitalization,
      this.maxLength,
      this.hintStyle,
      this.textInputType,
      required this.hint,
      this.controller,
      this.onChanged,
      this.onTap,
      this.focus,
      this.leadingAsset,
      this.leadingPadding,
      this.autoFocus,
      this.onTapX,
      this.visibileClose,
      this.formatters});

  @override
  LancerSearchState createState() => LancerSearchState();
}

class LancerSearchState extends State<LancerSearch> {
  @override
  Widget build(BuildContext context) {
    //FocusScope.of(context).requestFocus(focusNode);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(120), color: AppColors.grayLight2Divider),
      child: Row(
        children: [
          Expanded(
            child: IntrinsicWidth(
              child: TextField(
                onTap: widget.onTap,
                focusNode: widget.focus,
                autofocus: widget.autoFocus ?? false,
                controller: widget.controller,
                inputFormatters: widget.formatters,
                keyboardType: widget.textInputType,
                maxLength: widget.maxLength,
                onChanged: widget.onChanged,
                textCapitalization: widget.textCapitalization != null ? widget.textCapitalization! : TextCapitalization.none,
                style: const TextStyle(fontSize: 14, color: Colors.black),
                decoration: InputDecoration(
                  hintText: widget.hint,
                  counterText: "",
                  hintStyle: widget.hintStyle ?? AppStyles.styleTextBody14(fontWeight: FontWeight.w300, colorText: AppColors.grayOnly),
                  prefixIcon: Container(
                      padding: EdgeInsets.all(widget.leadingPadding ?? 12),
                      child: widget.leadingAsset ??
                          SvgPicture.asset(
                            // Assets.icSearch,
                            "",
                            width: 20,
                            height: 20,
                          )),
                  contentPadding: const EdgeInsets.all(10),
                  filled: true,
                  fillColor: AppColors.grayLight2Divider,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none, width: 0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(120.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
              visible: widget.visibileClose == true,
              child: IconButton(
                onPressed: widget.onTapX,
                icon: const Icon(Icons.close, color: AppColors.grayDark),
              ))
        ],
      ),
    );
  }
}
