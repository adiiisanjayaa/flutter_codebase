import 'package:app/core/themes/themes.dart';
import 'package:app/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchInputField extends StatelessWidget {
  const SearchInputField({
    super.key,
    this.textController,
    required this.onChanged,
    required this.hintText,
  });

  final TextEditingController? textController;
  final Function(String) onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      onChanged: onChanged,
      style: AppStyles.styleTextBody14OpenSans(
        colorText: AppColors.grayDark,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 0.0,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grayLight, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grayLight, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grayLight, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        prefixIcon: const AppImage(
          // svg: Assets.icSearchNormal,
          icon: Icons.search,
          backgroundColor: Colors.transparent,
          width: 24,
          height: 24,
          // color: AppColors.grayDark,
        ).marginOnly(left: 16, right: 12),
        prefixIconConstraints: const BoxConstraints(maxHeight: 24),
        fillColor: AppColors.grayLight,
        filled: true,
      ),
    );
  }
}
