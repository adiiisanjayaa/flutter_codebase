import 'package:aizen/core/network/clients/dio_api_client.dart';
import 'package:aizen/core/network/clients/http_api_client.dart';
import 'package:get/get.dart';
import 'member/remote/member_api_provider_impl.dart';

class ApiProviderManager {
  static void initialize() {
    Get.lazyPut(
      () => MemberApiProviderImpl(
        httpClient: Get.find<HttpApiClient>(),
        dioClient: Get.find<DioApiClient>(),
      ),
      fenix: true,
    );
  }
}
