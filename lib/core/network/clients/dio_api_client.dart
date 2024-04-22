import 'dart:developer';
import 'package:app/app/modules/error_page/controllers/error_page_controller.dart';
import 'package:app/app/routes/app_pages.dart';
import 'package:app/app/routes/nav_args.dart';
import 'package:app/core/widgets/custom_dialog.dart';
import 'package:app/core/widgets/custom_snack_bar.dart';
import 'package:app/utils/method/analytics_method.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_constant.dart';
import '../exceptions/network_exception.dart';
import '../network_checker.dart';
import 'api_client.dart';

class DioApiClient implements ApiClient {
  final dio.Dio client;
  final String baseUrl = AppConstant.apiURL;
  final String xApiToken = AppConstant.xApiToken;
  String? device;

  DioApiClient({required this.client}) {
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
    if (query != null) {
      query['device'] = device;
    } else {
      query = {'device': device};
    }
    Uri uri = Uri.https(baseUrl, url, query);
    dio.Response? response;
    bool isConnected = await NetworkChecker().check();

    if (isConnected) {
      try {
        try {
          response = await client.getUri(uri);
        } catch (e) {
          log("Error get : $e");
        }
      } catch (e) {
        log("Error getting dio : $e");
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
    if (query != null) {
      query['device'] = device;
    } else {
      query = {'device': device};
    }
    Uri uri = Uri.https(baseUrl, url, query);
    dio.Response? response;
    bool isConnected = await NetworkChecker().check();
    if (isConnected) {
      try {
        if (body != null) {
          response = await client.postUri(uri, data: body);
        } else {
          response = await client.postUri(uri);
        }
      } on DioException catch (e) {
        if (response != null) {
          String statusMessage = errorHandle(response);
          CustomSnackBar.error(statusMessage);
        }
        if (e.response?.statusCode == 400) {
          String? exceptionType = e.response?.data['ExceptionType'] ?? e.response?.data['Exceptiontype'] ?? e.response?.data['exceptionType'] ?? e.response?.data['exceptiontype'];
          String message = e.response?.data['Message'] ?? e.response?.data['message'] ?? '';
          if (message.isEmpty) {
            try {
              var mapData = ((e.response?.data['errors'] as Map).entries.map((v) => v.value)).toList();
              message = mapData.first?[0]?.toString() ?? '';
            } catch (_) {}
          }
          log('Status 400 -- Exception $exceptionType -- $message');

          CustomSnackBar.error(message);
        } else if ((e.response?.statusCode ?? 0) >= 402 && (e.response?.statusCode ?? 0) != 403 && (e.response?.statusCode ?? 0) < 500) {
          Get.toNamed(
            Routes.ERROR_PAGE,
            arguments: NavArgsModel(
              data: ErrorType.timeout,
              secondaryData: {
                "statusCode": e.response?.statusCode.toString(),
              },
            ),
          );
        } else if ((e.response?.statusCode ?? 0) >= 500) {
          AnalyticsMethod.logEvent(
            'Internal_Server_Error',
            // parameters: {
            //   "memberUID": UserService.find.user?.uid,
            //   'url': uri.toString(),
            // },
          );
          Get.toNamed(
            Routes.ERROR_PAGE,
            arguments: NavArgsModel(
              data: ErrorType.server,
              secondaryData: {
                "statusCode": e.response?.statusCode.toString(),
              },
            ),
          );
        } else {
          log("Failed post : $e");
          if (e.type == DioExceptionType.connectionTimeout) {
            Get.toNamed(
              Routes.ERROR_PAGE,
              arguments: NavArgsModel(
                data: ErrorType.internet,
              ),
            );
          } else if (e.type == DioExceptionType.receiveTimeout) {
            Get.toNamed(
              Routes.ERROR_PAGE,
              arguments: NavArgsModel(
                data: ErrorType.internet,
              ),
            );
          } else {
            log("Failed post : $e");
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
    if (query != null) {
      query['device'] = device;
    } else {
      query = {'device': device};
    }
    Uri uri = Uri.https(baseUrl, url, query);
    dio.Response? response;
    bool isConnected = await NetworkChecker().check();
    if (isConnected) {
      try {
        if (body != null) {
          response = await client.putUri(uri, data: body);
        } else {
          response = await client.putUri(uri);
        }
      } on DioException catch (e) {
        log("Failed put : $e");
        if (e.response?.statusCode == 400) {
          String message = e.response?.data['Message'] ?? e.response?.data['message'] ?? '';
          log('Status 400 $message');
          CustomSnackBar.error(message);
        } else if ((e.response?.statusCode ?? 0) >= 402 && (e.response?.statusCode ?? 0) != 403 && (e.response?.statusCode ?? 0) < 500) {
          Get.toNamed(
            Routes.ERROR_PAGE,
            arguments: NavArgsModel(
              data: ErrorType.timeout,
              secondaryData: {
                "statusCode": e.response?.statusCode.toString(),
              },
            ),
          );
        } else if ((e.response?.statusCode ?? 0) >= 500) {
          AnalyticsMethod.logEvent(
            'Internal_Server_Error',
            // parameters: {
            //   "memberUID": UserService.find.user?.uid,
            //   'url': uri.toString(),
            // },
          );
          Get.toNamed(
            Routes.ERROR_PAGE,
            arguments: NavArgsModel(
              data: ErrorType.server,
              secondaryData: {
                "statusCode": e.response?.statusCode.toString(),
              },
            ),
          );
        } else {
          if (e.type == DioExceptionType.connectionTimeout) {
            Get.toNamed(
              Routes.ERROR_PAGE,
              arguments: NavArgsModel(
                data: ErrorType.internet,
              ),
            );
          } else if (e.type == DioExceptionType.receiveTimeout) {
            Get.toNamed(
              Routes.ERROR_PAGE,
              arguments: NavArgsModel(
                data: ErrorType.internet,
              ),
            );
          } else {
            log("failed put : ${e.response}");
            String statusMessage = errorHandle(e.response!);
            CustomSnackBar.error(statusMessage);
          }
        }
      }
    } else {
      CustomDialog.showDialogOffline();
    }
    var responseJSON = checkPutApiError(response, url, isMap, errorNeedReLogin);
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
    if (query != null) {
      query['device'] = device;
    } else {
      query = {'device': device};
    }
    Uri uri = Uri.https(baseUrl, url, query);
    dio.Response? response;
    bool isConnected = await NetworkChecker().check();
    if (isConnected) {
      try {
        if (body != null) {
          response = await client.deleteUri(uri, data: body);
        } else {
          response = await client.deleteUri(uri);
        }
      } on DioException catch (e) {
        if (e.response?.statusCode == 400) {
          String message = e.response?.data['Message'] ?? e.response?.data['message'] ?? '';
          log('Status 400 $message');
          CustomSnackBar.error(message);
        } else if ((e.response?.statusCode ?? 0) >= 402 && (e.response?.statusCode ?? 0) != 403 && (e.response?.statusCode ?? 0) < 500) {
          Get.toNamed(
            Routes.ERROR_PAGE,
            arguments: NavArgsModel(
              data: ErrorType.timeout,
              secondaryData: {
                "statusCode": e.response?.statusCode.toString(),
              },
            ),
          );
        } else if ((e.response?.statusCode ?? 0) >= 500) {
          AnalyticsMethod.logEvent(
            'Internal_Server_Error',
            // parameters: {
            //   "memberUID": UserService.find.user?.uid,
            //   'url': uri.toString(),
            // },
          );
          Get.toNamed(
            Routes.ERROR_PAGE,
            arguments: NavArgsModel(
              data: ErrorType.server,
              secondaryData: {
                "statusCode": e.response?.statusCode.toString(),
              },
            ),
          );
        } else {
          if (e.type == DioExceptionType.connectionTimeout) {
            Get.toNamed(
              Routes.ERROR_PAGE,
              arguments: NavArgsModel(
                data: ErrorType.internet,
              ),
            );
          } else if (e.type == DioExceptionType.receiveTimeout) {
            Get.toNamed(
              Routes.ERROR_PAGE,
              arguments: NavArgsModel(
                data: ErrorType.internet,
              ),
            );
          } else {
            log("failed post : $e");
          }
        }
      }
    } else {
      CustomDialog.showDialogOffline();
    }
    var responseJSON = checkApiError(response, url, isMap, false);
    return responseJSON;
  }

  dynamic checkApiError(
    dio.Response? response,
    String url,
    bool isMap,
    bool interceptorNeedReLogin,
  ) {
    if (response != null) {
      final int statusCode = response.statusCode ?? 0;
      if (statusCode != 200) {
        String statusMessage = errorHandle(response);
        debugPrint("---- Error $url");
        debugPrint("Status Code $statusCode");
        debugPrint("Status Message $statusMessage");
        debugPrint("Status Response ${response.data}");
        debugPrint("---- End Error");
        if (interceptorNeedReLogin) {
          log("refresh error error _checkAPIErrorsDio dio logout");
        } else {
          if (statusCode != 400) {
            CustomSnackBar.error(statusMessage);
          }
        }
        throw NetworkException("Error : $statusCode, $statusMessage");
      } else {
        if (response.data.isNotEmpty) {
          debugPrint("---- Response $url");
          if (isMap) {
            var responseJson = response.data;
            log(responseJson.toString());
            debugPrint("---- End Response");
            return responseJson;
          } else {
            log(response.data.toString());
            debugPrint("---- End Response");
            return response;
          }
        } else {
          return response;
        }
      }
    } else {
      throw NetworkException("Error : null");
    }
  }

  dynamic checkPutApiError(
    dio.Response? response,
    String url,
    bool isMap,
    bool interceptorNeedReLogin,
  ) {
    if (response != null) {
      final int statusCode = response.statusCode ?? 0;
      if (statusCode != 200) {
        String statusMessage = errorHandle(response);
        debugPrint("---- Error $url");
        debugPrint("Status Code $statusCode");
        debugPrint("Status Message $statusMessage");
        debugPrint("Status Response ${response.data}");
        debugPrint("---- End Error");
        if (interceptorNeedReLogin) {
          log("refresh error error _checkAPIErrorsDioPut dio logout");
        } else {
          if (statusCode != 400) {
            CustomSnackBar.error(statusMessage);
          }
        }
        throw NetworkException("Error : $statusCode, $statusMessage");
      } else {
        return response;
      }
    } else {
      throw NetworkException("Error : null");
    }
  }

  String errorHandle(dio.Response? response) {
    if (response != null) {
      Map<String, dynamic> mapRes = response.data;
      if (response.statusCode == 400) {
        return 'Bad Request, ${mapRes["Message"] ?? "Something wrong"}';
      } else if (response.statusCode == 401) {
        return 'Unauthorized, ${mapRes["Message"] ?? "Something wrong"}';
      } else if (response.statusCode == 403) {
        return 'Access Forbidden, ${mapRes["Message"] ?? "Something wrong"}';
      } else if (response.statusCode == 404) {
        return 'Not Found, ${mapRes["Message"] ?? "Something wrong"}';
      } else if ((response.statusCode ?? 0) >= 500) {
        return 'Server Error, ${mapRes["Message"] ?? "Something wrong"}';
      } else {
        return 'ERROR ${response.statusCode}';
      }
    } else {
      return 'ERROR Something Wrong,';
    }
  }
}
