import 'package:app/core/themes/themes.dart';
import 'package:app/core/widgets/app_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<RootController>(
          init: RootController(),
          builder: (controller) {
            return controller.pages.elementAt(controller.index);
          }),
      bottomNavigationBar: const AppBottomNavBar(),
    );
  }
}

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootController>(
        init: RootController(),
        builder: (controller) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 10.sp),
            decoration: const BoxDecoration(
              color: AppColors.white,
            ),
            child: ClipRRect(
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColors.white,
                elevation: 0,
                iconSize: 20.sp,
                selectedItemColor: AppColors.redDark,
                unselectedItemColor: AppColors.gray2,
                selectedFontSize: 15.0.sp,
                unselectedFontSize: 15.0.sp,
                selectedLabelStyle: AppStyles.styleTextBody14(
                  size: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
                currentIndex: controller.index,
                onTap: (index) => controller.onNavTapped(index),
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: AppImage(
                      // svg: controller.index == 0 ? Assets.homeActive : Assets.homeInactive,
                      icon: Icons.home,
                      width: 20.sp,
                    ).marginOnly(bottom: 5.sp),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: AppImage(
                      // svg: controller.index == 0 ? Assets.homeActive : Assets.homeInactive,
                      icon: Icons.home,
                      width: 20.sp,
                    ).marginOnly(bottom: 5.sp),
                    label: "Packages",
                  ),
                  BottomNavigationBarItem(
                    icon: AppImage(
                      // svg: controller.index == 0 ? Assets.homeActive : Assets.homeInactive,
                      icon: Icons.home,
                      width: 20.sp,
                    ).marginOnly(bottom: 5.sp),
                    label: "Recharge",
                  ),
                  BottomNavigationBarItem(
                    icon: AppImage(
                      // svg: controller.index == 0 ? Assets.homeActive : Assets.homeInactive,
                      icon: Icons.home,
                      width: 20.sp,
                    ).marginOnly(bottom: 5.sp),
                    label: "Roaming",
                  ),
                  BottomNavigationBarItem(
                    icon: AppImage(
                      // svg: controller.index == 0 ? Assets.homeActive : Assets.homeInactive,
                      icon: Icons.home,
                      width: 20.sp,
                    ).marginOnly(bottom: 5.sp),
                    label: "VAS",
                  ),
                ],
              ),
            ),
          );
        });
  }
}
