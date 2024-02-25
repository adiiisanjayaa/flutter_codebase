import 'package:get/get.dart';

import '../modules/error_page/bindings/error_page_binding.dart';
import '../modules/error_page/views/error_page_view.dart';
import '../modules/previewer/bindings/previewer_binding.dart';
import '../modules/previewer/views/previewer_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PREVIEWER;

  static final routes = [
    GetPage(
      name: _Paths.ERROR_PAGE,
      page: () => const ErrorPageView(),
      binding: ErrorPageBinding(),
    ),
    GetPage(
      name: _Paths.PREVIEWER,
      page: () => const PreviewerView(),
      binding: PreviewerBinding(),
    ),
  ];
}