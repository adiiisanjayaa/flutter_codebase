import 'dart:developer';

import 'package:aizen/app/data/datasources/member/remote/member_api_provider.dart';
import 'package:aizen/app/data/models/member/login_response.dart';
import 'package:aizen/app/data/models/member/register_response.dart';
import 'package:aizen/core/base/base_result.dart';
import 'package:aizen/core/network/exceptions/network_exception.dart';

class AuthenticationRepository {
  final MemberApiProvider memberProvider;

  AuthenticationRepository({
    required this.memberProvider,
  });

  Future<LoginResponse?> login({
    required String phoneEmail,
    required String password,
    required String? fcmToken,
  }) async {
    var res = await memberProvider.login(
      phoneEmail: phoneEmail,
      password: password,
      fcmToken: fcmToken,
    );

    switch (res) {
      case SuccessRes(value: final value):
        return value;
      case FailureRes(error: final error):
        log('error login: $error');
        if (error is NetworkException) {}
        return Future.error(error);
    }
  }

  Future<RegisterResponse?> register({
    required String phone,
    required String email,
    bool isRecaptchaV2 = false,
  }) async {
    var res = await memberProvider.register(
      phone: phone,
      email: email,
    );
    switch (res) {
      case SuccessRes(value: final value):
        return value;
      case FailureRes(error: final error):
        log('error register: $error');
        if (error is NetworkException && !isRecaptchaV2) {}
        return Future.error(error);
    }
  }
}
