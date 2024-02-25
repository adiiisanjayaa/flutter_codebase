part of 'extensions.dart';

extension StringExtension on String {
  bool get isZeroStr => num.tryParse(replaceAll(',', '')) == 0;

  /// Try parse string to integer, if string can't parse will return 0.
  /// Every coma (,) will removed
  ///
  /// Example:
  /// ```dart
  /// '2023'.toInt(); // 2023
  /// '1,23'.toInt(); // 123
  /// 'ABC'.toInt(); // 0
  /// ```
  int toInt() {
    int parsedValue = int.tryParse(replaceAll(',', '')) ?? 0;
    if (parsedValue.isNaN) {
      return 0;
    }
    return parsedValue;
  }

  /// Try parse string to double, if string can't parse will return 0.
  /// Every coma (,) will removed
  ///
  /// Example:
  /// ```dart
  /// '3.14'.toDouble(); // 3.14
  /// '1,23'.toDouble(); // 123.0
  /// 'ABC'.toDouble(); // 0.0
  /// ```
  double toDouble() {
    double parsedValue = double.tryParse(replaceAll(',', '')) ?? 0;
    if (parsedValue.isNaN) {
      return 0;
    }
    return parsedValue;
  }

  /// Try parse string to number, if string can't parse will return 0.
  /// Every coma (,) will removed
  ///
  /// Example:
  /// ```dart
  /// '3.14'.toNum(); // 3.14
  /// '1,23'.toNum(); // 123
  /// 'ABC'.toNum(); // 0
  /// ```
  num toNum() {
    num parsedValue = num.tryParse(replaceAll(',', '')) ?? 0;
    if (parsedValue.isNaN) {
      return 0;
    }
    return parsedValue;
  }

  int toNominal() {
    int parsedValue = int.tryParse(replaceAll(',', '').replaceAll('.', '')) ?? 0;
    if (parsedValue.isNaN) {
      return 0;
    }
    return parsedValue;
  }

  bool compareString(String str, [bool ignoreCase = false]) {
    if (ignoreCase) {
      return toLowerCase() == str.toLowerCase();
    }
    return this == str;
  }

  String shortenText({int? length}) {
    length ??= 50;
    int currentTextLength = this.length;
    if (currentTextLength <= length - 1) {
      return this;
    } else {
      return ("${substring(0, length)}...");

      /// FORMAT RETURN [{TEXT}...]
    }
  }

  String hiddenEmail() {
    if (!EmailValidator.validate(this)) {
      return this;

      /// if email not valid, return default value
    }
    String hiddenEmailText = "";
    List<String> splitEmail = split("@");
    String lastEmail = "@${splitEmail.last}";
    int index = 0;
    splitEmail.first.split("").forEach((element) {
      if (index <= 2) {
        hiddenEmailText += element;
      } else {
        hiddenEmailText += "*";
      }
      index++;
    });
    return "$hiddenEmailText$lastEmail";
  }

  String hiddenPhoneNumber() {
    String hiddenPhoneText = "";
    int length = this.length;
    int index = 0;
    split("").forEach((element) {
      if ((index <= 3) || (index >= length - 4)) {
        hiddenPhoneText += element;
      } else {
        hiddenPhoneText += "*";
      }
      index++;
    });
    return hiddenPhoneText;
  }

  String toRupiah() {
    var intValue = int.tryParse(this);
    if (intValue == null) {
      return this;
    } else {
      return intValue.toRupiah();
    }
  }

  String toReadAbleDate() {
    try {
      var date = DateTime.parse(this);
      return DateFormat('dd MMM yyyy HH:mm').format(date);
    } catch (e) {
      return this;
    }
  }

  String toReadAbleDateWithoutHour() {
    try {
      var date = DateTime.parse(this);
      return DateFormat('dd MMM yyyy').format(date);
    } catch (e) {
      return this;
    }
  }

  String toReadFirstWord() {
    try {
      String s = this;
      String result = s.substring(0, s.indexOf(' '));
      if (result.length < 2) {
        result = s.substring(0, s.indexOf(' ', 2));
      }
      return result;
    } catch (e) {
      return this;
    }
  }

  bool isLetter() {
    return contains(RegExp(r'[a-zA-Z]'));
  }

  bool isUpperCaseLetter() {
    return contains(RegExp(r'[A-Z]'));
  }

  bool isUpperLowerNumber() {
    return contains(RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$'));
  }

  bool isNumeric() {
    return contains(RegExp(r'[0-9]'));
  }

  bool isAllNumeric() {
    return double.tryParse(this) != null;
  }

  String capitalizeEachWord() {
    String originalText = this;
    List<String> splitText = originalText.split(" ");
    for (var i = 0; i < splitText.length; i++) {
      if (splitText[i].length > 1) {
        splitText[i] = splitText[i].substring(0, 1).toUpperCase() + splitText[i].substring(1);
      }
    }

    String text = splitText.join(" ");
    return text;
  }

  String capitalizeFirstLetter() {
    String firstLetter = this[0].capitalize ?? '';
    String otherLetter = substring(1);
    return firstLetter + otherLetter;
  }

  Map<String, dynamic> toJson() {
    if (isNotEmpty) {
      Map<String, dynamic> data = json.decode(this);
      return data;
    }
    return {};
  }

  List<String?> jsonArrayToStrList() {
    if (isNotEmpty) {
      var data = json.decode(this).cast<String?>().toList();
      return data;
    }
    return [];
  }

  List<String?> csvToStrList() {
    if (isNotEmpty) {
      return split(';');
    }
    return [];
  }

  List<String?> delimiterToStrList(String delimiter) {
    if (isNotEmpty) {
      return split(delimiter);
    }
    return [];
  }

  Map<String, String> toMapWithSeparator(String separator) {
    if (isNotEmpty) {
      List<String> keyValuePairs = split(separator);
      Map<String, String> mapPairs = {};
      for (String pair in keyValuePairs) {
        List<String> keyValue = pair.split("=");
        String key = keyValue[0];
        String value = keyValue[1];
        mapPairs[key] = value;
      }

      return mapPairs;
    }
    return {};
  }

  /// Try parse string to date time, if string can't parse will return current date time.
  /// Format param need valid pattern date
  DateTime toDateTime(String format, [String? locale]) {
    if (isNotEmpty) {
      return DateFormat(format, locale).parse(this);
    }
    return DateTime.now();
  }

  String replaceLast(String from, String to) {
    int lastIndex = lastIndexOf(from);
    if (lastIndex == -1) {
      return this;
    }
    return replaceRange(lastIndex, lastIndex + from.length, to);
  }

  /// Will get initial first and last word
  String getInitials() {
    if (isEmpty) {
      return '';
    }
    RegExp exp = RegExp(r'\b\w');
    Iterable<Match> matches = exp.allMatches(this);

    if (matches.length > 1) {
      return (matches.first.group(0) ?? '').toUpperCase() + (matches.elementAt(1).group(0) ?? '').toUpperCase();
    }
    return (matches.first.group(0) ?? '').toUpperCase();
  }
}

extension NullableStringExtension on String? {
  bool get isNull => this == null;

  bool get isNotNull => this != null;

  bool get isNullOrEmpty => (this == null) || (this == '');

  bool get isEmpty => (this ?? '').isEmpty;

  bool get isNotEmpty => (this ?? '').isNotEmpty;

  bool get isZeroStr => num.tryParse((this ?? '').replaceAll(',', '')) == 0;

  String get orEmpty => this ?? '';

  String get orZeroStr => this ?? '0';

  /// Try parse string to integer, if string can't parse will return 0.
  /// Every coma (,) will removed
  ///
  /// Example:
  /// ```dart
  /// '2023'.toInt(); // 2023
  /// '1,23'.toInt(); // 123
  /// 'ABC'.toInt(); // 0
  /// ```
  int toInt() {
    int parsedValue = int.tryParse((this ?? '').replaceAll(',', '')) ?? 0;
    if (parsedValue.isNaN) {
      return 0;
    }
    return parsedValue;
  }

  /// Try parse string to double, if string can't parse will return 0.
  /// Every coma (,) will removed
  ///
  /// Example:
  /// ```dart
  /// '3.14'.toDouble(); // 3.14
  /// '1,23'.toDouble(); // 123.0
  /// 'ABC'.toDouble(); // 0.0
  /// ```
  double toDouble() {
    double parsedValue = double.tryParse((this ?? '').replaceAll(',', '')) ?? 0;
    if (parsedValue.isNaN) {
      return 0;
    }
    return parsedValue;
  }

  /// Try parse string to number, if string can't parse will return 0.
  /// Every coma (,) will removed
  ///
  /// Example:
  /// ```dart
  /// '3.14'.toNum(); // 3.14
  /// '1,23'.toNum(); // 123
  /// 'ABC'.toNum(); // 0
  /// ```
  num toNum() {
    num parsedValue = num.tryParse((this ?? '').replaceAll(',', '')) ?? 0;
    if (parsedValue.isNaN) {
      return 0;
    }
    return parsedValue;
  }

  int toNominal() {
    int parsedValue = int.tryParse((this ?? '').replaceAll(',', '').replaceAll('.', '')) ?? 0;
    if (parsedValue.isNaN) {
      return 0;
    }
    return parsedValue;
  }
}
