import 'package:app/core/themes/app_theme.dart';
import 'package:app/main_binding.dart';
import 'package:app/translations/app_translations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,

    /// For Android will affect Status Bar Icon
    statusBarIconBrightness: Brightness.dark,

    /// For iOS will affect Status Bar, If 'Brightness.light' make icon Dark
    statusBarBrightness: Brightness.light,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await MainBinding().dependencies(isTest: kDebugMode);

  Locale localLanguage = Get.deviceLocale ?? const Locale('id', 'ID');
  await initializeDateFormatting(localLanguage.toString());
  runApp(MyApp(startLocale: localLanguage));
}

class MyApp extends StatefulWidget {
  final Locale startLocale;
  const MyApp({
    super.key,
    required this.startLocale,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // LocalNotificationService.initialize(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: GetMaterialApp(
          enableLog: kDebugMode,
          debugShowCheckedModeBanner: false,
          title: "APP",
          translations: AppTranslations(),
          locale: widget.startLocale,
          fallbackLocale: const Locale('id', 'ID'), // Default locale for translations
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          theme: AppTheme.light(),
          navigatorObservers: const [
            /// The FirebaseAnalyticsObserver is a observer that listens to the navigation events in your Flutter app
            // FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
          ],
        ),
      );
    });
  }
}
