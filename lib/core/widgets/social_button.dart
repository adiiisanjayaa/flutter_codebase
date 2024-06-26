import 'package:app/core/themes/themes.dart';
import 'package:app/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.onPressed, required this.label, required this.svgIcon, this.iconColor});
  final VoidCallback onPressed;
  final String label;
  final String svgIcon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.0,
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: AppImage(
          svg: svgIcon,
          width: 20.0,
          height: 20.0,
          color: iconColor,
        ),
        label: Text(
          label,
          style: AppStyles.styleTextBody(
            fontWeight: FontWeight.w500,
            colorText: AppColors.textBlack,
            size: 18.sp,
          ),
          textAlign: TextAlign.center,
        ),
        style: OutlinedButton.styleFrom(
          elevation: 0.0,
          side: const BorderSide(
            width: 1.0,
            color: Color(0xffD8DADD),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
      ),
    );
  }
}
