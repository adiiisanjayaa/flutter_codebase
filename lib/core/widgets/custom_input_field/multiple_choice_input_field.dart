import 'package:app/core/extensions/extensions.dart';
import 'package:app/core/themes/themes.dart';
import 'package:app/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_input_field.dart';

class MultipleChoiceInputField extends StatelessWidget {
  const MultipleChoiceInputField({
    super.key,
    this.isEnable = true,
    this.title,
    this.hintText,
    this.maxLines,
    this.prefix,
    this.prefixIcon,
    // this.suffixIcon = Assets.icArrowDown,
    this.isShowSuffixIcon = true,
    required this.textController,
    this.validator,
    required this.onTap,
    this.errorText,
    this.borderType = CustomInputFieldBorderStyle.underlineBorder,
  });

  final bool isEnable;
  final String? title;
  final String? hintText;
  final int? maxLines;
  final Widget? prefix;
  final String? prefixIcon;
  // final String suffixIcon;
  final bool isShowSuffixIcon;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final Function() onTap;
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
          onTap: onTap,
          controller: textController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          readOnly: true,
          keyboardType: TextInputType.none,
          minLines: 1,
          maxLines: maxLines,
          style: AppStyles.styleTextBody14OpenSans(
            fontWeight: FontWeight.w400,
            height: 1.4,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            // prefixIcon: prefix != null ? prefixWidget() : (prefixIcon.isNotNull ? defaultPrefixWidget() : null),
            prefixIconConstraints: prefix != null ? const BoxConstraints(maxHeight: 24) : (prefixIcon.isNotNull ? const BoxConstraints(maxHeight: 24) : null),
            suffixIcon: isShowSuffixIcon
                ? Padding(
                    padding: getAdditionalPaddingSuffixIcon(borderType),
                    child: AppImage(
                      // svg: suffixIcon,
                      icon: Icons.arrow_drop_down,
                      color: isEnable ? null : AppColors.lightGrey,
                    ),
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

  Widget prefixWidget() {
    return Padding(
      padding: getAdditionalPaddingPrefixIcon(borderType),
      child: prefix,
    );
  }

  Widget defaultPrefixWidget() {
    return Padding(
      padding: getAdditionalPaddingPrefixIcon(borderType),
      child: AppImage(
        svg: prefixIcon,
        width: 16,
        height: 16,
        color: isEnable ? null : AppColors.lightGrey,
      ).marginOnly(right: 16),
    );
  }
}
