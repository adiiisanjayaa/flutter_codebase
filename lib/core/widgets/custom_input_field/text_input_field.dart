import 'package:app/core/extensions/extensions.dart';
import 'package:app/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'custom_input_field.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    super.key,
    this.title,
    this.hintText,
    this.isMultipleLine = false,
    this.maxLength,
    required this.textController,
    this.validator,
    this.onChanged,
    this.inputFormatters,
    this.errorText,
    this.borderType = CustomInputFieldBorderStyle.underlineBorder,
  });

  final String? title;
  final String? hintText;
  final bool isMultipleLine;
  final int? maxLength;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
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
            style: AppStyles.styleText(
              color: AppColors.textBlack,
              fontWeight: FontWeight.w400,
              size: 14.sp,
            ),
          ).marginOnly(bottom: getTitleMargin(borderType)),
        ],
        TextFormField(
          onChanged: onChanged,
          controller: textController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          keyboardType: isMultipleLine ? TextInputType.multiline : TextInputType.text,
          minLines: 1,
          maxLines: isMultipleLine ? 4 : null,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          style: AppStyles.styleText(size: 16.sp, fontWeight: FontWeight.w400, height: 1.3),
          decoration: InputDecoration(
            counterText: '',
            hintText: hintText,
            contentPadding: getContentPadding(borderType),
            border: getBorderStyle(borderType),
            enabledBorder: getBorderStyle(borderType),
            focusedBorder: getFocusedBorderStyle(borderType),
            errorBorder: getErrorBorderStyle(borderType),
            focusedErrorBorder: getErrorBorderStyle(borderType),
            errorText: errorText,
            errorStyle: (errorText ?? '').isNotEmpty ? AppStyles.styleText(size: 14.sp, fontWeight: FontWeight.w400) : const TextStyle(height: 0),
          ),
        ),
      ],
    );
  }
}
