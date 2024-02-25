part of 'extensions.dart';

extension NumExtension on num {
  bool get isZero => this == 0;
  bool get isNotZero => this != 0;

  String toRupiah() {
    try {
      return "Rp ${NumberFormat('#,##0', 'ID').format(this)}";
    } catch (e) {
      log("error converting");
      return "";
    }
  }

  String toIdrFormat() {
    try {
      return NumberFormat('#,##0', 'ID').format(this);
    } catch (e) {
      log("error converting");
      return "";
    }
  }
}

extension NullableNumExtension on num? {
  bool get isZero => this == 0;
  bool get isNotZero => this != 0;
  num get orZero => this ?? 0;
  num get orOne => this ?? 1;
}
