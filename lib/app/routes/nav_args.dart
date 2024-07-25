class NavArgsModel<T> {
  String? from;
  final String? to;
  final T? data;
  Map<String, dynamic>? secondaryData;
  dynamic dynamicData;

  NavArgsModel({
    this.from,
    this.secondaryData,
    this.data,
    this.to,
    this.dynamicData,
  }) {
    secondaryData ??= {};
  }
}
