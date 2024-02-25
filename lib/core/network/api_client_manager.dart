import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'clients/dio_api_client.dart';
import 'clients/http_api_client.dart';
import 'interfaces/api_interface.dart';

class ApiClientManager {
  static void initialize() {
    var httpClient = http.Client();
    var dioClient = ApiInterface().build();

    Get.lazyPut(
      () => HttpApiClient(
        client: httpClient,
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => DioApiClient(
        client: dioClient,
      ),
      fenix: true,
    );
  }
}
