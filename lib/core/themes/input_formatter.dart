import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppInputFormatter {
  AppInputFormatter._();

  /// Allow to input float/double with max number after point format text
  static List<TextInputFormatter> validDecimalPointFormat(int maxAfterPoint) => [
    TextInputFormatter.withFunction((oldValue, newValue) {
      if (newValue.text.contains(',')) {
        return newValue.copyWith(
          text: newValue.text.replaceAll(',', '.'),
        );
      }
      return newValue;
    }),
    // ignore: unnecessary_string_escapes
    FilteringTextInputFormatter.allow(RegExp('^([1-9]\\d*|0)(\\.\\d{0,$maxAfterPoint})?\$\|^\\d+\\.\$')),
  ];

  /// Allow to input float/double format text
  static List<TextInputFormatter> validDecimalFormat = [
    TextInputFormatter.withFunction((oldValue, newValue) {
      if (newValue.text.contains(',')) {
        return newValue.copyWith(
          text: newValue.text.replaceAll(',', '.'),
        );
      }
      return newValue;
    }),
    FilteringTextInputFormatter.allow(RegExp(r'^([1-9]\d*|0)(\.\d+)?$|^\d+\.$')),
  ];

  /// Allow to input integer format text
  static List<TextInputFormatter> validIntegerFormat = [
    TextInputFormatter.withFunction((oldValue, newValue) {
      if (newValue.text.contains(',')) {
        return newValue.copyWith(
          text: newValue.text.replaceAll(',', '.'),
        );
      }
      return newValue;
    }),
    FilteringTextInputFormatter.allow(RegExp(r'^([1-9]\d*|0)$')),
  ];

  /// Allow to input digit number format text
  static List<TextInputFormatter> digitOnlyFormat = [
    FilteringTextInputFormatter.digitsOnly,
  ];

  /// Auto formatting to currency Indonesia
  static List<TextInputFormatter> currencyIdFormat = [
    CurrencyTextInputFormatter(
      locale: 'id',
      symbol: '',
      decimalDigits: 0,
      enableNegative: false,
    )
  ];

  /// Allow to input valid phone format text
  static List<TextInputFormatter> phoneFormat = [
    FilteringTextInputFormatter.deny(RegExp(r'^0+')),
    FilteringTextInputFormatter.deny(RegExp(r'^62+')),
    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9+_@.]')),
  ];

  /// Allow to input text, but ignore newline
  static List<TextInputFormatter> textWithoutNewlineFormat = [
    TextInputFormatter.withFunction((oldValue, newValue) {
      return newValue.copyWith(
        text: newValue.text.replaceAll('\n', ' '),
      );
    }),
  ];

  static List<TextInputFormatter> dateMMyyyyFormat = [
    MaskTextInputFormatter(
      mask: '## / ####',
      filter: { "#": RegExp(r'[0-9]') },
    ),
    TextInputFormatter.withFunction((oldValue, newValue) {
      if (newValue.text.length >= 2) {
        var month = int.tryParse(newValue.text.substring(0, 2));
        if (month != null && month > 12) {
          return newValue.copyWith(
            text: '12${newValue.text.substring(2)}',
          );
        }
        if (month != null && month == 0) {
          return newValue.copyWith(
            text: '01${newValue.text.substring(2)}',
          );
        }
      }
      return newValue;
    }),
  ];

  static List<TextInputFormatter> creditCardFormat = [
    MaskTextInputFormatter(
      mask: '#### #### #### ####',
      filter: { "#": RegExp(r'[0-9]') },
    )
  ];

  /// Allow to input character only
  static List<TextInputFormatter> characterOnlyFormat = [
    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z\' ]')),
  ];

  /// Allow to input character, number, and symbol
  static List<TextInputFormatter> passwordFormat = [
    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9+_@.,\'"-:><;!?\$@#%^&*()_+ ]')),
  ];
}
