import 'package:dio/dio.dart';

class NetworkConnectionChecker {
  NetworkConnectionChecker._privateConstructor();
  static final NetworkConnectionChecker instance = NetworkConnectionChecker._privateConstructor();

  Future<bool> check() async {
    BaseOptions options = BaseOptions(
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      connectTimeout: const Duration(seconds: 3),
    );
    Dio dio = Dio(options);
    try {
      Response response = await dio.get("https://www.google.com");
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
