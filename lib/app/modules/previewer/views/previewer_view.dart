import 'package:aizen/core/themes/themes.dart';
import 'package:aizen/core/widgets/lancer_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/previewer_controller.dart';

class PreviewerView extends GetView<PreviewerController> {
  const PreviewerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: LancerAppBar(
          title: "Title",
          appBarColor: AppColors.white,
          centerTitle: false,
        ),
      ),
      body: Center(
        child: Text(
          'PreviewerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
