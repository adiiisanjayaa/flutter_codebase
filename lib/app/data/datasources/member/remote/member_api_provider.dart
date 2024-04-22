import 'package:app/app/data/models/member/login_response.dart';
import 'package:app/app/data/models/member/register_response.dart';
import 'package:app/core/base/base_result.dart';

abstract class MemberApiProvider {
  Future<Result<LoginResponse>> login({
    required String phoneEmail,
    required String password,
    required String? fcmToken,
  });

  Future<Result<RegisterResponse>> register({
    required String phone,
    required String email,
  });
}
