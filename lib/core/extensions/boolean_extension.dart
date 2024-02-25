part of 'extensions.dart';

extension NullableBooleanExtension on bool? {
  bool get orFalse => this ?? false;
}
