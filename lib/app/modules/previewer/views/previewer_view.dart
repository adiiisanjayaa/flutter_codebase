import 'package:app/core/themes/themes.dart';
import 'package:app/core/widgets/chip_button.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/core/widgets/custom_checkbox.dart';
import 'package:app/core/widgets/custom_dialog.dart';
import 'package:app/core/widgets/custom_input_field/custom_input_field.dart';
import 'package:app/core/widgets/custom_radio.dart';
import 'package:app/core/widgets/custom_snack_bar.dart';
import 'package:app/core/widgets/custom_app_bar.dart';
import 'package:app/core/widgets/lancer_dialog.dart';
import 'package:app/core/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/previewer_controller.dart';

class PreviewerView extends GetView<PreviewerController> {
  const PreviewerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: "Title",
          appBarColor: AppColors.white,
          centerTitle: false,
          actions: [],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            EmailInputField(
              hintText: "Email",
              textController: TextEditingController(),
              validator: (val) {
                return null;
              },
              onChanged: (_) {},
              borderType: CustomInputFieldBorderStyle.underlineBorder,
            ).marginOnly(bottom: 20),
            EmailInputField(
              hintText: "Email",
              textController: TextEditingController(),
              validator: (val) {
                return null;
              },
              onChanged: (_) {},
              borderType: CustomInputFieldBorderStyle.outlineBorder,
            ).marginOnly(bottom: 20),
            CustomButton(
              type: ButtonType.filled,
              onPressed: () {},
              radiusButton: 10,
              enabled: true,
              childBuilder: (context, style) => Text(
                "BUTTON",
                style: AppStyles.styleTextBody(
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                  colorText: AppColors.white,
                  size: 18.sp,
                ),
                textAlign: TextAlign.center,
              ),
              isFullButton: true,
              isLoading: false,
            ).marginOnly(bottom: 20),
            CustomButton(
              type: ButtonType.outline,
              onPressed: () {},
              radiusButton: 10,
              enabled: true,
              childBuilder: (context, style) => Text(
                "BUTTON",
                style: AppStyles.styleTextBody(
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                  colorText: AppColors.green,
                  size: 18.sp,
                ),
                textAlign: TextAlign.center,
              ),
              isFullButton: true,
              isLoading: false,
            ).marginOnly(bottom: 20),
            MultipleChoiceInputField(
              title: "Multiple",
              hintText: "Multiple text",
              textController: TextEditingController(),
              onTap: () {},
              errorText: null,
            ).marginOnly(bottom: 20),
            TextNumberInputField(
              title: "Number",
              hintText: "Number text",
              textController: TextEditingController(),
              onChanged: (value) {},
              errorText: null,
            ).marginOnly(bottom: 20),
            PasswordInputField(
              hintText: "Password",
              obscureText: true,
              textController: TextEditingController(),
              validator: (val) {
                return null;
              },
              onChanged: (_) {},
              onTapSuffixIcon: () {},
              borderType: CustomInputFieldBorderStyle.underlineBorder,
            ).marginOnly(bottom: 20),
            SearchInputField(
              onChanged: (value) {},
              hintText: "Search",
            ).marginOnly(bottom: 20),
            TextInputField(
              hintText: "Text Input",
              isMultipleLine: true,
              textController: TextEditingController(),
              borderType: CustomInputFieldBorderStyle.outlineBorder,
            ).marginOnly(bottom: 20),
            TextInputField(
              hintText: "Text Input",
              isMultipleLine: true,
              textController: TextEditingController(),
              borderType: CustomInputFieldBorderStyle.underlineBorder,
            ).marginOnly(bottom: 20),
            Padding(
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                  ChipButton(
                    title: "Chip",
                    isSelected: true,
                    onTap: () {},
                  ),
                  const SizedBox(width: 10),
                  ChipButton(
                    title: "Chip",
                    isSelected: false,
                    onTap: () {},
                  ),
                ],
              ),
            ).marginOnly(bottom: 20),
            CustomCheckbox(
              title: "Checkbox",
              isChecked: true,
              onChanged: (val) {},
            ).marginOnly(bottom: 20),
            CustomCheckbox(
              title: "Checkbox",
              isChecked: false,
              onChanged: (val) {},
            ).marginOnly(bottom: 20),
            CustomRadio(
              title: "Radio",
              value: 1,
              groupValue: 1,
              onChanged: (value) {},
            ).marginOnly(bottom: 20),
            CustomRadio(
              title: "Radio",
              value: 1,
              groupValue: 0,
              onChanged: (value) {},
            ).marginOnly(bottom: 20),
            // SocialButton(
            //   onPressed: () {},
            //   label: "Social Button",
            //   svgIcon: '',
            // ).marginOnly(bottom: 10),
            Padding(
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                  ChipButton(
                    title: "Snackbar Error",
                    isSelected: true,
                    onTap: () {
                      CustomSnackBar.error("Error not found");
                    },
                  ),
                  const SizedBox(width: 10),
                  ChipButton(
                    title: "Snackbar Info",
                    isSelected: true,
                    onTap: () {
                      CustomSnackBar.information("Info Snackbar");
                    },
                  ),
                ],
              ),
            ).marginOnly(bottom: 20),
            Padding(
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                  ChipButton(
                    title: "Snackbar Warn",
                    isSelected: true,
                    onTap: () {
                      CustomSnackBar.warn("Warn Snackbar");
                    },
                  ),
                  const SizedBox(width: 10),
                  ChipButton(
                    title: "Snackbar Success",
                    isSelected: true,
                    onTap: () {
                      CustomSnackBar.success("Success Snackbar");
                    },
                  ),
                ],
              ),
            ).marginOnly(bottom: 20),
            Padding(
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                  ChipButton(
                    title: "Dialog single",
                    isSelected: true,
                    onTap: () {
                      CustomDialog.showDialogSingleAction(
                        message: "No. Handphone yang digunakan belum terdaftar.",
                        positiveText: "Daftar Akun",
                        onPositive: () {},
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  ChipButton(
                    title: "Dialog Multiple",
                    isSelected: true,
                    onTap: () {
                      CustomDialog.showDialogDoubleAction(
                        message: "No. Handphone yang digunakan belum terdaftar.",
                        positiveText: "Daftar Akun",
                        onPositive: () {},
                        negativeText: "No",
                        onNegative: () {},
                      );
                    },
                  ),
                ],
              ),
            ).marginOnly(bottom: 20),
            Padding(
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                  ChipButton(
                    title: "Force upgrade",
                    isSelected: true,
                    onTap: () {
                      CustomDialog.showDialogForceUpdateApp(updateCallback: () {});
                    },
                  ),
                  const SizedBox(width: 10),
                  ChipButton(
                    title: "Loading",
                    isSelected: true,
                    onTap: () {
                      CustomDialog.showDialogLoading(
                        message: "No. Handphone yang digunakan belum terdaftar.",
                        callback: (val) {},
                      );
                    },
                  ),
                ],
              ),
            ).marginOnly(bottom: 20),
            Padding(
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                  ChipButton(
                    title: "Offline",
                    isSelected: true,
                    onTap: () {
                      CustomDialog.showDialogOffline();
                    },
                  ),
                  const SizedBox(width: 10),
                  ChipButton(
                    title: "Rec Update",
                    isSelected: true,
                    onTap: () {
                      CustomDialog.showDialogRecommendUpdateApp(skipCallback: () {}, updateCallback: () {});
                    },
                  ),
                ],
              ),
            ).marginOnly(bottom: 20),
            Padding(
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                  ChipButton(
                    title: "Dialog",
                    isSelected: true,
                    onTap: () {
                      Get.dialog(
                        const LancerDialog(
                          title: "Title",
                          desc: "Description",
                          positiveButton: "Logout",
                          positiveButtonColor: AppColors.red,
                          negativeButton: "Batal",
                        ),
                      ).then(
                        (value) {
                          if (value == LCSimpleDialogReturn.positive) {}
                        },
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  ChipButton(
                    title: "OverLayLoader",
                    isSelected: true,
                    onTap: () {
                      OverLayLoader.find.show();
                    },
                  ),
                ],
              ),
            ).marginOnly(bottom: 20),
          ],
        ),
      ),
    );
  }
}
