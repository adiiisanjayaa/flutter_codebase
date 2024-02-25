import 'package:get/get.dart';
import '../datasources/member/remote/member_api_provider_impl.dart';
import 'authentication_repository.dart';

class RepositoryManager {
  static void initialize() {
    Get.lazyPut(
      () => AuthenticationRepository(
        memberProvider: Get.find<MemberApiProviderImpl>(),
      ),
      fenix: true,
    );
  }
}
