import 'package:app/core/extensions/extensions.dart';
import 'package:app/core/themes/themes.dart';
import 'package:app/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_input_field.dart';

class PasswordInputField extends StatelessWidget {
  const PasswordInputField({
    super.key,
    this.title,
    this.hintText,
    this.isShowSuffixIcon = true,
    this.obscureText = true,
    required this.textController,
    this.validator,
    this.onChanged,
    this.onTapSuffixIcon,
    this.errorText,
    this.borderType = CustomInputFieldBorderStyle.underlineBorder,
  });

  final String? title;
  final String? hintText;
  final bool isShowSuffixIcon;
  final bool obscureText;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function()? onTapSuffixIcon;
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
          onChanged: onChanged,
          controller: textController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          obscureText: obscureText,
          keyboardType: TextInputType.text,
          inputFormatters: AppInputFormatter.passwordFormat,
          style: AppStyles.styleTextBody14OpenSans(fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: isShowSuffixIcon
                ? IconButton(
                    padding: getAdditionalPaddingSuffixIcon(borderType),
                    icon: const AppImage(
                      // svg: obscureText ? Assets.icHideEye : Assets.icShowEye,
                      icon: Icons.remove_red_eye_rounded,
                      color: AppColors.grayMedium,
                    ),
                    onPressed: onTapSuffixIcon,
                  )
                : null,
            suffixIconConstraints: isShowSuffixIcon ? const BoxConstraints(maxHeight: 24) : null,
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
