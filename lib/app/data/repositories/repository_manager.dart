import 'package:app/core/network/clients/dio_api_client.dart';
import 'package:app/core/network/clients/http_api_client.dart';
import 'package:get/get.dart';
import 'authentication_repository.dart';

class RepositoryManager {
  static void initialize() {
    Get.lazyPut(
      () => AuthenticationRepository(
        httpClient: Get.find<HttpApiClient>(),
        dioClient: Get.find<DioApiClient>(),
      ),
      fenix: true,
    );
  }
}
