class AnalyticsMethod {
  static void logEvent(String name, {parameters}) async {
    // final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    // try {
    //   String prefix = "";
    //   if (Platform.isAndroid) {
    //     prefix = "AND_";
    //   } else if (Platform.isIOS) {
    //     prefix = "IOS_";
    //   }
    //   String eventName = prefix + name;
    //   await analytics.logEvent(name: eventName, parameters: parameters);
    //   log("--- Analytics Called $eventName");
    // } catch (e) {
    //   debugPrint("--- Analytics Error");
    //   debugPrint(e.toString());
    //   debugPrint("--- End Analytics Error");
    // }
  }

  static void setCurrentScreen({required String screenName}) async {
    // final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    // try {
    //   await analytics.logScreenView(screenName: screenName);
    //   debugPrint("--- Analytics Called Set Screen $screenName");
    // } catch (e) {
    //   debugPrint("--- Analytics Error");
    //   debugPrint(e.toString());
    //   debugPrint("--- End Analytics Error");
    // }
  }
}
