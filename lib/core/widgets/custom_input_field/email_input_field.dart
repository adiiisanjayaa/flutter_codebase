import 'package:app/core/extensions/extensions.dart';
import 'package:app/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'custom_input_field.dart';

class EmailInputField extends StatelessWidget {
  const EmailInputField({
    super.key,
    this.title,
    this.hintText,
    required this.textController,
    this.validator,
    this.onChanged,
    this.errorText,
    this.borderType = CustomInputFieldBorderStyle.underlineBorder,
  });

  final String? title;
  final String? hintText;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
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
          keyboardType: TextInputType.emailAddress,
          minLines: 1,
          style: AppStyles.styleText(
            fontWeight: FontWeight.w400,
            size: 16.sp,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: getContentPadding(borderType),
            border: getBorderStyle(borderType),
            enabledBorder: getBorderStyle(borderType),
            focusedBorder: getFocusedBorderStyle(borderType),
            errorBorder: getErrorBorderStyle(borderType),
            focusedErrorBorder: getErrorBorderStyle(borderType),
            errorText: errorText,
            errorStyle: (errorText ?? '').isNotEmpty
                ? AppStyles.styleText(
                    fontWeight: FontWeight.w400,
                    size: 14.sp,
                  )
                : const TextStyle(height: 0),
          ),
        ),
      ],
    );
  }
}
