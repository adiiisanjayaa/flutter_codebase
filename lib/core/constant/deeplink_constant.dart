import 'package:aizen/core/constant/app_constant.dart';

class DeeplinkConstant {
  static const String hostName = AppConstant.webURL;

  static const String hostNameWithHttp = 'http://$hostName';
  static const String hostNameWithHttps = 'https://$hostName';
  static const String hostNameWithWwwHttp = 'http://www.$hostName';
  static const String hostNameWithWwwHttps = 'https://www.$hostName';

  static const String emailActivate = '$hostName/emailactivate';
}
