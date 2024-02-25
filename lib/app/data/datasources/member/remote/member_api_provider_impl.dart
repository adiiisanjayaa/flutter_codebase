import 'package:aizen/app/data/models/member/login_response.dart';
import 'package:aizen/app/data/models/member/register_response.dart';
import 'package:aizen/core/base/base_result.dart';
import 'package:aizen/core/constant/api_url_constant.dart';
import 'package:aizen/core/network/clients/api_client.dart';
import 'member_api_provider.dart';

class MemberApiProviderImpl implements MemberApiProvider {
  final ApiClient httpClient;
  final ApiClient dioClient;

  MemberApiProviderImpl({required this.httpClient, required this.dioClient});

  @override
  Future<Result<LoginResponse>> login({
    required String phoneEmail,
    required String password,
    required String? fcmToken,
  }) async {
    try {
      String url = ApiUrlConstant.memberLogin;
      var body = {
        'phoneEmail': phoneEmail,
        'password': password,
        'fcmToken': fcmToken,
      };
      var response = await httpClient.post(
        url,
        body: body,
      );

      return SuccessRes(LoginResponse.fromJson(response));
    } catch (e) {
      return FailureRes(e);
    }
  }

  @override
  Future<Result<RegisterResponse>> register({
    required String phone,
    required String email,
  }) async {
    try {
      String url = ApiUrlConstant.memberRegister;
      var body = {
        'phone': phone,
        'email': email,
      };
      var response = await httpClient.post(
        url,
        body: body,
      );

      return SuccessRes(RegisterResponse.fromJson(response));
    } catch (e) {
      return FailureRes(e);
    }
  }
}
