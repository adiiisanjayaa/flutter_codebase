import 'dart:developer';
import 'package:app/app/data/datasources/api_provider_manager.dart';
import 'package:app/app/data/datasources/database_table_manager.dart';
import 'package:app/app/data/repositories/repository_manager.dart';
import 'package:app/core/constant/app_constant.dart';
import 'package:app/core/constant/event_name.dart';
import 'package:app/utils/method/analytics_method.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/api_client_manager.dart';

class MainBinding implements Bindings {
  @override
  Future<void> dependencies({isTest = false}) async {
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );

    if (!kDebugMode) {
      try {
        FlutterError.onError = (FlutterErrorDetails details) {
          log(details.toString());
          // FirebaseCrashlytics.instance.recordFlutterFatalError(details);
        };
      } catch (e) {
        log("error FirebaseCrashlytics recordFlutterFatalError :$e");
      }
    }
    // FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
    // FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    AnalyticsMethod.logEvent(EventName.mainInitEvent);
    // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    //   alert: true, // Required to display a heads up notification
    //   badge: true,
    //   sound: true,
    // );
    // FirebaseMessaging.onMessage.listen((event) async {
    //   LocalNotificationService.display(event);
    //   FirebaseHandler.onReceiveMessage(event);
    // });
    // FirebaseMessaging.onMessageOpenedApp.listen((event) {
    //   LocalNotificationService.onNotificationTapBG(event);
    // });

    await Get.putAsync<SharedPreferences>(
      () async {
        return await SharedPreferences.getInstance();
      },
      permanent: true,
    );
    // StorageMethods.find.setData(StorageNames.countRefreshToken, null);
    // StorageMethods.find.setData(
    //   StorageNames.guest,
    //   0,
    // );

    Get.put(
      Dio(
        BaseOptions(
          baseUrl: Uri.http(AppConstant.apiURL).toString(),
          connectTimeout: const Duration(seconds: AppConstant.connectionTimeout),
          receiveTimeout: const Duration(seconds: AppConstant.connectionTimeout),
        ),
      ),
      permanent: true,
    );
    ApiClientManager.initialize();
    await DatabaseTableManager.initialize();
    ApiProviderManager.initialize();
    RepositoryManager.initialize();

    // Get.put(UserService(), permanent: true);
    AnalyticsMethod.logEvent(EventName.mainFinishEvent);
  }
}
