import 'package:aizen/core/extensions/extensions.dart';
import 'package:aizen/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'custom_input_field.dart';

class MaskInputField extends StatelessWidget {
  const MaskInputField({
    super.key,
    this.isEnable = true,
    this.obscureText = false,
    this.title,
    this.hintText,
    this.maxLength,
    this.prefixWidget,
    this.suffixWidget,
    required this.textController,
    this.validator,
    this.onChanged,
    this.inputFormatters,
    this.errorText,
    this.keyboardType = TextInputType.number,
    this.borderType = CustomInputFieldBorderStyle.underlineBorder,
  });

  final bool isEnable;
  final bool obscureText;
  final String? title;
  final String? hintText;
  final int? maxLength;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final TextInputType keyboardType;
  final CustomInputFieldBorderStyle borderType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotNull) ...[
          Text(
            title.orEmpty,
            textAlign: TextAlign.start,
            style: AppStyles.styleTextBody12OpenSans(
              colorText: AppColors.textBlack,
              fontWeight: FontWeight.w400,
            ),
          ).marginOnly(bottom: getTitleMargin(borderType)),
        ],
        TextFormField(
          enabled: isEnable,
          obscureText: obscureText,
          onChanged: onChanged,
          controller: textController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          style: AppStyles.styleTextBody14OpenSans(fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            hintText: hintText,
            counterText: '',
            prefixIcon: prefixWidget,
            prefixIconConstraints: const BoxConstraints(maxHeight: 24),
            suffixIcon: suffixWidget,
            suffixIconConstraints: const BoxConstraints(maxHeight: 24),
            contentPadding: getContentPadding(borderType),
            border: getBorderStyle(borderType),
            enabledBorder: getBorderStyle(borderType),
            focusedBorder: getFocusedBorderStyle(borderType),
            errorBorder: getErrorBorderStyle(borderType),
            focusedErrorBorder: getErrorBorderStyle(borderType),
            errorText: errorText,
            errorStyle: (errorText ?? '').isNotEmpty ? AppStyles.styleTextBody12OpenSans(fontWeight: FontWeight.w400) : const TextStyle(height: 0),
          ),
        ),
      ],
    );
  }
}
