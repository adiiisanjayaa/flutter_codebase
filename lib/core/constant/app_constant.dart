class AppConstant {
  //server api
  static const String apiURL = String.fromEnvironment('API_URL', defaultValue: '');
  static const String xApiToken = String.fromEnvironment('X_APITOKEN', defaultValue: '');
  static const String webURL = String.fromEnvironment('WEB_URL', defaultValue: '');

  static const int connectionTimeout = 30;
}
