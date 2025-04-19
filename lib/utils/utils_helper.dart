import 'package:easy_localization/easy_localization.dart';
import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';



class UtilsHelper {

    static String trans(
    String? key, {
    Map<String, String>? args,
  }) {
    var result = "";
    try {
      if (key != '' && key != null) {
        result = tr(
          key.trim(),
          namedArgs: args,
        );
      } else {
        result = '';
      }
    } catch (e) {}
    return result;
  }

  static String formatDate(DateTime date, String format) {
    try {
      return DateFormat(format).format(date);
    } catch (e) {
      UtilsHelper.log(e);
      return UtilsHelper.trans("invalid_date_format");
    }
  }


  static String formatAmount(num? number,
      {String? currencyIso,
      bool? useFree = false,
      bool? setNegativeToZero = false,
      int minimumFractionDigits = 2,
      int maximumFractionDigits = 2,
      int minimumIntegerDigits = 1,
      bool uselocalDigitFormat = false,
      String localeLanguage = "en_US"}) {
    if (number == null) return "";
    if (setNegativeToZero == true && number < 0) {
      number = 0;
    }
    NumberFormat formatter = uselocalDigitFormat
        ? NumberFormat.decimalPattern(localeLanguage)
        : NumberFormat("#,### ### ###");

    if (number.toString().startsWith("0.00")) {
      return "${number.toString().substring(0, min(number.toString().length, 11))} ${getCurrencySymbole(currencyIso)}";
    }

    if (uselocalDigitFormat) {
      return "${formatter.format(number)} ${getCurrencySymbole(currencyIso)}";
    }

    formatter.minimumFractionDigits = minimumFractionDigits;
    formatter.maximumFractionDigits = maximumFractionDigits;
    formatter.minimumIntegerDigits = minimumIntegerDigits;

    if (number == 0 && useFree == true) {
      return UtilsHelper.trans("FREE");
    }

    if (currencyIso != null) {
      return NumberFormat.currency(symbol: getCurrencySymbole(currencyIso))
          .format(number);
    }
    return formatter.format(number);
  }

  static getCurrencySymbole(String? currencyIso) {
    if (currencyIso == null) return "";
    return currencyFormat(currencyIso).currencySymbol;
  }

  static NumberFormat currencyFormat(String currencyIso) {
    var format = NumberFormat.simpleCurrency(
      locale: Platform.localeName,
      name: currencyIso,
    );
    return format;
  }
  static log(
    dynamic message, {
    dynamic error,
    StackTrace? trace,
    String? name,
  }) {
    dev.log("${message}", name: name ?? '');
  }

    static String extractName(String? name, {int? maxCount = 1}) {
    if (name != null && name.isNotEmpty) {
      final splitted = name.split(' ');
      return splitted.sublist(0, maxCount!).join(" ");
    } else {
      return '';
    }
  }
}
