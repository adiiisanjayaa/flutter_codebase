import 'package:app/core/extensions/extensions.dart';
import 'package:app/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'custom_input_field.dart';

enum NumberInputType {
  textNumber,
  currency,
  validInteger,
  validDecimalNumber,
  validDecimalPointNumber,
}

class NumberInputField extends StatelessWidget {
  const NumberInputField({
    super.key,
    this.numberInputType = NumberInputType.validDecimalNumber,
    this.isEnable = true,
    this.title,
    this.hintText,
    this.maxLength,
    this.prefixWidget,
    this.suffixWidget,
    required this.textController,
    this.validator,
    this.onChanged,
    this.errorText,
    this.borderType = CustomInputFieldBorderStyle.underlineBorder,
    this.autoFocus = false,
  });

  final NumberInputType numberInputType;
  final bool isEnable;
  final String? title;
  final String? hintText;
  final int? maxLength;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String? errorText;
  final CustomInputFieldBorderStyle borderType;
  final bool autoFocus;

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
          keyboardType: getKeyboardType(),
          inputFormatters: getInputFormatter(),
          maxLength: maxLength,
          style: AppStyles.styleTextBody14OpenSans(fontWeight: FontWeight.w400),
          autofocus: autoFocus,
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

  TextInputType getKeyboardType() {
    switch (numberInputType) {
      case NumberInputType.textNumber:
      case NumberInputType.currency:
      case NumberInputType.validInteger:
        return TextInputType.number;
      case NumberInputType.validDecimalNumber:
      case NumberInputType.validDecimalPointNumber:
      default:
        return const TextInputType.numberWithOptions(decimal: true);
    }
  }

  List<TextInputFormatter> getInputFormatter() {
    switch (numberInputType) {
      case NumberInputType.textNumber:
        return AppInputFormatter.digitOnlyFormat;
      case NumberInputType.currency:
        return AppInputFormatter.currencyIdFormat;
      case NumberInputType.validInteger:
        return AppInputFormatter.validIntegerFormat;
      case NumberInputType.validDecimalPointNumber:
        return AppInputFormatter.validDecimalPointFormat(3);
      case NumberInputType.validDecimalNumber:
      default:
        return AppInputFormatter.validDecimalFormat;
    }
  }
}

class TextNumberInputField extends StatelessWidget {
  const TextNumberInputField({
    super.key,
    this.title,
    this.hintText,
    this.maxLength,
    this.suffixWidget,
    required this.textController,
    this.onChanged,
    this.errorText,
    this.borderType = CustomInputFieldBorderStyle.underlineBorder,
  });

  final String? title;
  final String? hintText;
  final int? maxLength;
  final Widget? suffixWidget;
  final TextEditingController textController;
  final Function(String)? onChanged;
  final String? errorText;
  final CustomInputFieldBorderStyle borderType;

  @override
  Widget build(BuildContext context) {
    return NumberInputField(
      numberInputType: NumberInputType.textNumber,
      title: title,
      hintText: hintText,
      maxLength: maxLength,
      suffixWidget: suffixWidget,
      textController: textController,
      onChanged: onChanged,
      errorText: errorText,
      borderType: borderType,
    );
  }
}

class CurrencyTextInputField extends StatelessWidget {
  const CurrencyTextInputField({
    super.key,
    this.isEnable = true,
    this.title,
    this.hintText,
    this.isShowPrefix = true,
    required this.textController,
    this.validator,
    this.onChanged,
    this.errorText,
    this.borderType = CustomInputFieldBorderStyle.underlineBorder,
  });

  final bool isEnable;
  final String? title;
  final String? hintText;
  final bool isShowPrefix;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String? errorText;
  final CustomInputFieldBorderStyle borderType;

  @override
  Widget build(BuildContext context) {
    return NumberInputField(
      numberInputType: NumberInputType.currency,
      isEnable: isEnable,
      title: title,
      hintText: hintText,
      prefixWidget: isShowPrefix ? defaultPrefixWidget() : null,
      textController: textController,
      validator: validator,
      onChanged: onChanged,
      errorText: errorText,
      borderType: borderType,
    );
  }

  Widget defaultPrefixWidget() {
    return Padding(
      padding: getAdditionalPaddingPrefixIcon(borderType),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Rp',
            style: AppStyles.styleTextBody14OpenSans(
              colorText: isEnable ? AppColors.grayDark : AppColors.grayMedium,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            width: 1,
            height: 18,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            color: AppColors.grayMedium,
          ),
        ],
      ),
    );
  }
}

class PercentInputField extends StatelessWidget {
  const PercentInputField({
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
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String? errorText;
  final CustomInputFieldBorderStyle borderType;

  @override
  Widget build(BuildContext context) {
    return NumberInputField(
      numberInputType: NumberInputType.validDecimalPointNumber,
      isEnable: isEnable,
      title: title,
      hintText: hintText,
      prefixWidget: defaultPrefixWidget(),
      textController: textController,
      validator: validator,
      onChanged: onChanged,
      errorText: errorText,
      borderType: borderType,
    );
  }

  Widget defaultPrefixWidget() {
    return Padding(
      padding: getAdditionalPaddingPrefixIcon(borderType),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '%',
            style: AppStyles.styleTextBody14OpenSans(
              colorText: isEnable ? AppColors.grayDark : AppColors.grayMedium,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            width: 1,
            height: 18,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            color: AppColors.grayMedium,
          ),
        ],
      ),
    );
  }
}

class NumericInputField extends StatelessWidget {
  const NumericInputField({
    super.key,
    this.isEnable = true,
    this.title,
    this.hintText,
    this.suffixText,
    required this.textController,
    this.validator,
    this.onChanged,
    this.errorText,
    this.borderType = CustomInputFieldBorderStyle.underlineBorder,
  });

  final bool isEnable;
  final String? title;
  final String? hintText;
  final String? suffixText;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String? errorText;
  final CustomInputFieldBorderStyle borderType;

  @override
  Widget build(BuildContext context) {
    return NumberInputField(
      numberInputType: NumberInputType.validInteger,
      isEnable: isEnable,
      title: title,
      hintText: hintText,
      suffixWidget: suffixText.isNotNull ? defaultSuffixWidget() : null,
      textController: textController,
      validator: validator,
      onChanged: onChanged,
      errorText: errorText,
      borderType: borderType,
    );
  }

  Widget defaultSuffixWidget() {
    return Padding(
      padding: getAdditionalPaddingSuffixIcon(borderType),
      child: Text(
        suffixText.orEmpty,
        style: AppStyles.styleTextBody14OpenSans(
          colorText: isEnable ? AppColors.grayDark : AppColors.grayMedium,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
