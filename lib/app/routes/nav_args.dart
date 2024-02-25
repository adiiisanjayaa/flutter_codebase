class NavArgsModel<T> {
  String? from;
  final T? data;
  Map<String, dynamic>? secondaryData;
  final String? to;
  AnalyticsData? analyticsData;
  dynamic dynamicData;
  bool? isWithoutId;
  bool? ignoreCompassLog;

  NavArgsModel({
    this.from,
    this.secondaryData,
    this.data,
    this.to,
    this.analyticsData,
    this.dynamicData,
    this.isWithoutId,
    this.ignoreCompassLog,
  }) {
    analyticsData ??= AnalyticsData();
    secondaryData ??= {};
  }
}

class AnalyticsData {
  String? from;
  String? account;
  Map<String, dynamic>? extraData;
  AnalyticsData({
    this.from,
    this.account,
    this.extraData,
  }) {
    extraData ??= {};
  }
}
