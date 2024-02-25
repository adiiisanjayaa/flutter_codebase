import 'package:aizen/core/themes/themes.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  /// Checkbox List Tile Without Padding
  const CustomCheckbox({
    super.key,
    required this.title,
    required this.isChecked,
    required this.onChanged,
  });

  final String title;
  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(
            activeColor: AppColors.green,
            value: isChecked,
            onChanged: onChanged,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: GestureDetector(
            onTap: () {
              onChanged(!isChecked);
            },
            child: Text(
              title,
              style: AppStyles.styleTextBody12OpenSans(
                fontWeight: FontWeight.w400,
                colorText: AppColors.textBlack,
                height: 1.4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
