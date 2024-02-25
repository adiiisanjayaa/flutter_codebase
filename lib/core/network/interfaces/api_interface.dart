import 'dart:developer';
import 'dart:io';

import 'package:aizen/core/constant/app_constant.dart';
import 'package:dio/dio.dart';

class ApiInterface {
  late Dio api;

  Dio build() {
    BaseOptions options = BaseOptions(
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      baseUrl: Uri.https(AppConstant.apiURL).toString(),
      connectTimeout: const Duration(seconds: AppConstant.connectionTimeout),
      receiveTimeout: const Duration(seconds: AppConstant.connectionTimeout),
    );

    api = Dio(options);
    api.interceptors.clear();
    api.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String xApiToken = AppConstant.xApiToken;
          String token = '';
          Map<String, String> requestHeaders = {
            'x-apitoken': xApiToken,
            'Content-type': 'application/json',
          };
          //TODO:: USER SERVICE
          // if (UserService.find.isLoggedIn) {
          //   token = UserService.find.user?.userToken ?? '';
          //   requestHeaders.addAll({'Authorization': 'Bearer $token'});
          // }
          options.headers = requestHeaders;
          handler.next(options);
        },
        onError: (e, handler) async {
          log("On error handler : $e");
          Response? response = e.response;
          api.options.queryParameters.clear();
          if (response?.statusCode == HttpStatus.unauthorized || response?.statusCode == HttpStatus.forbidden) {
            log("Error code ${response?.statusCode}");
            if (response?.statusCode == 401) {
              //TODO:: USER SERVICE
              // if (UserService.find.isLoggedIn) {
              //   var res;
              //   // final LoginResponse? res = await AuthenticationRepository(
              //   //   areaProvider: getx.Get.find<AreaApiProviderImpl>(),
              //   //   memberProvider: getx.Get.find<MemberApiProviderImpl>(),
              //   // ).refreshToken();
              //   if (res != null) {
              //     await UserService.find.refreshUserToken(res);
              //     // StorageMethods.find.setData(StorageNames.countRefreshToken, 0);
              //     String xApiToken = AppConstant.xApiToken;
              //     String token = '';
              //     Map<String, String> requestHeaders = {
              //       'x-apitoken': xApiToken,
              //       'Content-type': 'application/json',
              //     };
              //     if (UserService.find.isLoggedIn) {
              //       token = res.accessToken ?? '';
              //       requestHeaders.addAll({'Authorization': 'Bearer $token'});
              //     }
              //     RequestOptions? options = e.response?.requestOptions;
              //     options?.headers = requestHeaders;

              //     if (options != null) {
              //       await api
              //           .fetch(options)
              //           .then(
              //             (value) => handler.resolve(value),
              //           )
              //           .onError(
              //             (error, stackTrace) => handler.reject(e),
              //           );
              //     }
              //   }
              // }
            }
          }
          if (response?.statusCode == 403) {
            //TODO:: USER SERVICE
            // UserService.find.logout();
            // FirebaseMessaging.instance.deleteToken();
            // getx.Get.offAllNamed(Routes.SPLASHSCREEN);
          }
          try {
            handler.next(e);
          } catch (e) {
            log("Error handler next : ${e.toString()}");
          }
        },
        onResponse: (e, handler) {
          api.options.queryParameters.clear();
          return handler.next(e);
        },
      ),
    );

    return api;
  }
}
