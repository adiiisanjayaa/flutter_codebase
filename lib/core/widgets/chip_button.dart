import 'package:flutter/material.dart';

import '../themes/themes.dart';

class ChipButton extends StatelessWidget {
  const ChipButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.green : AppColors.whiteGray,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: AppColors.grayInnerBorder.withOpacity(0.5),
              blurRadius: 2,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Row(
          children: [
            Text(
              title,
              style: AppStyles.styleTextBody14OpenSans(
                fontWeight: FontWeight.w400,
                colorText: isSelected ? AppColors.white : AppColors.textBlack,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
