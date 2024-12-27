import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// [DateTime] Extension
extension DateTimeExtension on DateTime {
  /// prints the day name of the date
  String toDayName({String? locale}) => DateFormat('EEEE', locale).format(this);

  /// prints the month name of the date
  String toMonthName({String? locale}) => DateFormat('MMMM', locale).format(this);

  /// Formats the date as 'd MMMM EEEE' eg. 3 Nisan Cumartesi
  String todMMMMEEEE({String? locale}) => DateFormat('d MMMM EEEE', locale).format(this);

  /// Formats the date as 'd MMMM y' eg. 3 Nisan 2022
  String todMMMMMy({String? locale}) => DateFormat('d MMMM y', locale).format(this);

  /// Formats the date as 'MMMM y' eg. Nisan 2022
  String toMMMMy({String? locale}) => DateFormat('MMMM y', locale).format(this);

  /// Formats the date as 'd MMMM' eg. 3 Nisan
  String todMMMM({String? locale}) => DateFormat('d MMMM', locale).format(this);

  /// Formats the date as 'd MMMM y H:m' eg. 3 Nisan 2022 12:00
  String todMMMMyHHmm({String? locale}) => DateFormat('d MMMM y HH:mm', locale).format(this);

  /// Formats the date as 'd MMMM H:m' eg. 3 Nisan 12:00
  String todMMMMHHmm({String? locale}) => DateFormat('d MMMM HH:mm', locale).format(this);

  /// Formats the date as 'H:m' eg. 12:00
  String get toHHmm => DateFormat('HH:mm').format(this);

  /// Formats the date as 'dd.MM.y HH:mm:ss' eg. 03.04.2022 12:00:00
  String get toddMMyHHmmss => DateFormat('dd.MM.y HH:mm:ss').format(this);

  /// Formats the date as 'dd.MM.y HH:mm' eg. 03.04.2022 12:00
  String get toddMMyHHmm => DateFormat('dd.MM.y HH:mm').format(this);

  /// Formats the date as 'dd.MM.y' eg. 03.04.2022
  String get toddMMy => DateFormat('dd.MM.y').format(this);

  /// Formats the date as 'y.MM.dd' eg. 2022.04.03
  String get toyMMdd => DateFormat('y.MM.dd').format(this);

  /// Formats the date as 'yyyy-MM-dd' eg. 2022-04-03
  String get toyyyyMMdd => DateFormat('yyyy-MM-dd').format(this);

  /// Formats the date as 'yyyy-MM-dd HH:mm:ss' eg. 2022-04-03 12:00:00
  String get toyyyyMMddHHmmss => DateFormat('yyyy-MM-dd HH:mm:ss').format(this);

  /// Prints total number of days in current month
  int get totalDaysInCurrentMonth {
    final range = DateTimeRange(start: DateTime(year, month), end: DateTime(year, month + 1));
    return range.duration.inDays;
  }
}
