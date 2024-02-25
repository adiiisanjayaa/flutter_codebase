part of 'extensions.dart';

extension DoubleExtension on double {
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
