import 'package:app/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomRadio<T> extends StatelessWidget {
  /// Radio Button List Tile Without Padding
  const CustomRadio({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String title;
  final T value;
  final T groupValue;
  final Function(T?) onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        children: [
          SizedBox(
            height: 24,
            width: 24,
            child: Radio(
              activeColor: AppColors.green,
              value: value,
              onChanged: onChanged,
              groupValue: groupValue,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: AppStyles.styleText(
                fontWeight: FontWeight.w400,
                color: AppColors.textBlack,
                height: 1.4,
                size: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
