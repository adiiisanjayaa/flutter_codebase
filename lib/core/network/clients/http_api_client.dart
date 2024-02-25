import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:aizen/app/modules/error_page/controllers/error_page_controller.dart';
import 'package:aizen/app/routes/app_pages.dart';
import 'package:aizen/app/routes/nav_args.dart';
import 'package:aizen/core/widgets/custom_dialog.dart';
import 'package:aizen/core/widgets/custom_snack_bar.dart';
import 'package:aizen/utils/method/analytics_method.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../constant/app_constant.dart';
import '../exceptions/network_exception.dart';
import '../network_checker.dart';
import 'api_client.dart';

class HttpApiClient implements ApiClient {
  final http.Client client;
  final String baseUrl = AppConstant.apiURL;
  final String xApiToken = AppConstant.xApiToken;
  String? device;

  HttpApiClient({required this.client}) {
    device = "Android";
    if (GetPlatform.isIOS) device = "IOS";
  }

  @override
  Future get(
    String url, {
    Map<String, String>? optionalHeaders,
    Map<String, dynamic>? query,
    bool isMap = true,
  }) async {
    String token = '';

    Map<String, String> requestHeaders = {
      'x-apitoken': xApiToken,
      'Content-type': 'application/json',
    };
    if (optionalHeaders != null) {
      requestHeaders.addAll(optionalHeaders);
    }
    //TODO:: USER SERVICE
    // if (UserService.find.isLoggedIn) {
    //   token = UserService.find.user?.userToken ?? '';
    //   requestHeaders.addAll({'Authorization': 'Bearer $token'});
    // }
    if (query != null) {
      query['device'] = device;
    } else {
      query = {'device': device};
    }
    Uri uri = Uri.https(baseUrl, url, query);
    http.Response? response;
    bool isConnected = await NetworkChecker().check();
    if (isConnected) {
      try {
        response = await client.get(uri, headers: requestHeaders);
      } catch (e) {
        if (response != null) {
          String statusMessage = errorHandle(response);
          CustomSnackBar.error(statusMessage);
        }
      }
    } else {
      CustomDialog.showDialogOffline();
    }
    var responseJSON = checkApiError(response, url, isMap, false);
    return responseJSON;
  }

  @override
  Future post(
    String url, {
    Map<String, String>? optionalHeaders,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    bool isMap = true,
    bool needCheckLogin = true,
    bool errorNeedReLogin = false,
    bool? isKTP,
  }) async {
    String token = '';

    Map<String, String> requestHeaders = {
      'x-apitoken': xApiToken,
      'Content-type': 'application/json',
    };
    if (optionalHeaders != null) {
      requestHeaders.addAll(optionalHeaders);
    }
    //TODO:: USER SERVICE
    if (needCheckLogin) {
      // if (UserService.find.isLoggedIn) {
      //   token = UserService.find.user?.userToken ?? '';
      //   requestHeaders.addAll({'Authorization': 'Bearer $token'});
      // }
    }

    if (query != null) {
      query['device'] = device;
    } else {
      query = {'device': device};
    }
    Uri uri = Uri.https(baseUrl, url, query);
    http.Response? response;
    bool isConnected = await NetworkChecker().check();
    if (isConnected) {
      try {
        if (body != null) {
          String encodedBody = '';
          try {
            encodedBody = jsonEncode(body);
          } catch (e) {
            log('error encoded body : $e');
          }
          response = await client.post(uri, headers: requestHeaders, body: encodedBody);
        } else {
          response = await client.post(uri, headers: requestHeaders);
        }
      } catch (e) {
        if (e is SocketException) {
          Get.toNamed(
            Routes.ERROR_PAGE,
            arguments: NavArgsModel(
              data: ErrorType.internet,
            ),
          );
        } else {
          if (response != null) {
            String statusMessage = errorHandle(response);
            CustomSnackBar.error(statusMessage);
          }
        }
      }
    } else {
      CustomDialog.showDialogOffline();
    }
    var responseJSON = checkApiError(response, url, isMap, errorNeedReLogin);
    return responseJSON;
  }

  @override
  Future put(
    String url, {
    Map<String, String>? optionalHeaders,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    bool isMap = true,
    bool needCheckLogin = true,
    bool errorNeedReLogin = false,
  }) async {
    String token = '';

    Map<String, String> requestHeaders = {
      'x-apitoken': xApiToken,
      'Content-type': 'application/json',
    };
    if (optionalHeaders != null) {
      requestHeaders.addAll(optionalHeaders);
    }
    //TODO:: USER SERVICE
    // if (UserService.find.isLoggedIn) {
    //   token = UserService.find.user?.userToken ?? '';
    //   requestHeaders.addAll({'Authorization': 'Bearer $token'});
    // }

    if (query != null) {
      query['device'] = device;
    } else {
      query = {'device': device};
    }
    Uri uri = Uri.https(baseUrl, url, query);
    http.Response? response;
    bool isConnected = await NetworkChecker().check();
    if (isConnected) {
      try {
        if (body != null) {
          String encodedBody = '';
          try {
            encodedBody = jsonEncode(body);
          } catch (e) {
            log('error encoded body : $e');
          }
          response = await client.put(uri, headers: requestHeaders, body: encodedBody);
        } else {
          response = await client.put(uri, headers: requestHeaders);
        }
      } catch (e) {
        if (e is SocketException) {
          // Get.toNamed(
          //   Routes.ERROR_PAGE,
          //   arguments: NavArgsModel(
          //     data: ErrorType.internet,
          //   ),
          // );
        } else {
          if (response != null) {
            String statusMessage = errorHandle(response);
            CustomSnackBar.error(statusMessage);
          }
        }
      }
    } else {
      CustomDialog.showDialogOffline();
    }
    var responseJSON = checkApiError(response, url, isMap, false);
    return responseJSON;
  }

  @override
  Future delete(
    String url, {
    Map<String, String>? optionalHeaders,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    bool isMap = true,
    bool needCheckLogin = true,
    bool errorNeedReLogin = false,
  }) async {
    String token = '';

    Map<String, String> requestHeaders = {
      'x-apitoken': xApiToken,
      'Content-type': 'application/json',
    };
    if (optionalHeaders != null) {
      requestHeaders.addAll(optionalHeaders);
    }
    if (needCheckLogin) {
      //TODO:: USER SERVICE
      // if (UserService.find.isLoggedIn) {
      //   token = UserService.find.user?.userToken ?? '';
      //   requestHeaders.addAll({'Authorization': 'Bearer $token'});
      // }
    }

    if (query != null) {
      query['device'] = device;
    } else {
      query = {'device': device};
    }
    Uri uri = Uri.https(baseUrl, url, query);
    http.Response? response;
    bool isConnected = await NetworkChecker().check();
    if (isConnected) {
      try {
        if (body != null) {
          String encodedBody = '';
          try {
            encodedBody = jsonEncode(body);
          } catch (e) {
            log('error encoded body : $e');
          }
          response = await client.delete(uri, headers: requestHeaders, body: encodedBody);
        } else {
          response = await client.delete(uri, headers: requestHeaders);
        }
      } catch (e) {
        if (e is SocketException) {
          Get.toNamed(
            Routes.ERROR_PAGE,
            arguments: NavArgsModel(
              data: ErrorType.internet,
            ),
          );
        } else {
          if (response != null) {
            String statusMessage = errorHandle(response);
            CustomSnackBar.error(statusMessage);
          }
        }
      }
    } else {
      CustomDialog.showDialogOffline();
    }
    var responseJSON = checkApiError(response, url, isMap, errorNeedReLogin);
    return responseJSON;
  }

  dynamic checkApiError(
    http.Response? response,
    String url,
    bool isMap,
    bool interceptorNeedReLogin,
  ) {
    final int statusCode = response?.statusCode ?? 0;
    if (statusCode != 200) {
      if (statusCode >= 500) {
        AnalyticsMethod.logEvent(
          'Internal_Server_Error',
          // parameters: {
          //   "memberUID": UserService.find.user?.uid,
          //   'url': url.toString(),
          // },
        );
        Get.toNamed(
          Routes.ERROR_PAGE,
          arguments: NavArgsModel(
            data: ErrorType.server,
            secondaryData: {
              "statusCode": statusCode.toString(),
            },
          ),
        );
      } else if (statusCode >= 402 && statusCode != 403 && statusCode < 500) {
        Get.toNamed(
          Routes.ERROR_PAGE,
          arguments: NavArgsModel(
            data: ErrorType.timeout,
            secondaryData: {
              "statusCode": statusCode.toString(),
            },
          ),
        );
      }
      if (response != null) {
        String statusMessage = errorHandle(response);
        String exceptionType = getExceptionType(response);
        log("---- Error $url");
        log("Status Code $statusCode");
        log("Status Message $statusMessage");
        log("Status Response ${response.body}");
        log("Exception Type $exceptionType");
        log("---- End Error");

        throw NetworkException(
          "Error : $statusCode, $statusMessage",
          exceptionType: exceptionType,
        );
      }
    } else {
      if (response != null) {
        if (response.body.isNotEmpty == true) {
          log("---- Response $url");
          if (isMap) {
            var responseJson = jsonDecode(response.body.toString());
            log(responseJson.toString());
            log("---- End Response");
            return responseJson;
          } else {
            log(response.body.toString());
            log("---- End Response");
            return response;
          }
        } else {
          return response;
        }
      } else {
        return response;
      }
    }
  }

  String errorHandle(http.Response response) {
    Map<String, dynamic> mapRes = jsonDecode(response.body);
    if (response.statusCode == 400) {
      return 'Bad Request, ${mapRes["Message"] ?? "Something wrong"}';
    } else if (response.statusCode == 401) {
      return 'Unauthorized, ${mapRes["Message"] ?? "Something wrong"}';
    } else if (response.statusCode == 403) {
      return 'Access Forbidden, ${mapRes["Message"] ?? "Something wrong"}';
    } else if (response.statusCode == 404) {
      return 'Not Found, ${mapRes["Message"] ?? "Something wrong"}';
    } else if (response.statusCode >= 500) {
      AnalyticsMethod.logEvent(
        'Internal_Server_Error',
        // parameters: {
        //   "memberUID": UserService.find.user?.uid,
        //   'url': response.request?.url.toString(),
        // },
      );
      return 'Server Error, ${mapRes["Message"] ?? "Something wrong"}';
    } else {
      return 'ERROR ${response.statusCode}';
    }
  }

  String getExceptionType(http.Response response) {
    Map<String, dynamic> mapRes = jsonDecode(response.body);
    return mapRes['ExceptionType'] ?? 'None';
  }
}
