part of 'extensions.dart';

extension ListExtension on List {
  /// `this != null` and `length > 0`
  bool get isNotNullOrNotEmpty => this != [] && length > 0;

  /// `this == null` or `length == 0`
  bool get isNullOrEmpty => this == [] || length == 0;

  /// Encodes with `jsonEncode(this)`
  String toJson() => jsonEncode(this);

  /// This extension will formatting list string
  /// ['Lorem', 'ipsum', 'dolor', 'sit', 'amet']
  /// to
  /// 'Lorem,ipsum,dolor,sit,amet'
  String toCommaString() => join(",");

  /// This extension will formatting list string
  /// ['Lorem', 'ipsum', 'dolor', 'sit', 'amet']
  /// to
  /// 'Lorem, ipsum, dolor, sit, amet'
  String toCommaSpaceString() => join(", ");

  /// This extension will formatting list string
  /// ['Lorem', 'ipsum', 'dolor', 'sit', 'amet']
  /// to
  /// 'Lorem, ipsum, dolor, sit & amet'
  String toCommaSpaceWithAndLastString() => join(', ').replaceLast(', ', ' & ');
}

extension Unique<E, Id> on List<E> {
  List<E> unique([Id Function(E element)? id, bool inplace = true]) {
    // ignore: prefer_collection_literals
    final ids = Set();
    var list = inplace ? this : List<E>.from(this);
    list.retainWhere((x) => ids.add(id != null ? id(x) : x as Id));
    return list;
  }
}
