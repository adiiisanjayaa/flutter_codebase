import 'package:get/get.dart';

import '../modules/error_page/bindings/error_page_binding.dart';
import '../modules/error_page/views/error_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/previewer/bindings/previewer_binding.dart';
import '../modules/previewer/views/previewer_view.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ROOT;

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
    GetPage(
      name: _Paths.ROOT,
      page: () => const RootView(),
      binding: RootBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
