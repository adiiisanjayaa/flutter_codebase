import 'package:aizen/core/extensions/extensions.dart';
import 'package:aizen/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_input_field.dart';

class PhoneInputField extends StatelessWidget {
  const PhoneInputField({
    super.key,
    this.isEnable = true,
    this.title,
    this.hintText,
    required this.textController,
    this.validator,
    this.onChanged,
    this.errorText,
    this.borderType = CustomInputFieldBorderStyle.underlineBorder,
  });

  final bool isEnable;
  final String? title;
  final String? hintText;
  final TextEditingController textController;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
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
            style: AppStyles.styleTextBody12OpenSans(
              colorText: AppColors.textBlack,
              fontWeight: FontWeight.w400,
            ),
          ).marginOnly(bottom: getTitleMargin(borderType)),
        ],
        TextFormField(
          enabled: isEnable,
          onChanged: onChanged,
          controller: textController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          keyboardType: TextInputType.phone,
          inputFormatters: AppInputFormatter.phoneFormat,
          style: AppStyles.styleTextBody14OpenSans(fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Padding(
              padding: getAdditionalPaddingPrefixIcon(borderType),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '+62',
                    style: AppStyles.styleTextBody14OpenSans(
                      colorText: AppColors.grayDark,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    width: 2,
                    height: 24,
                    color: AppColors.lightGrey,
                  ).marginSymmetric(horizontal: 16),
                ],
              ),
            ),
            prefixIconConstraints: const BoxConstraints(maxHeight: 24),
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
