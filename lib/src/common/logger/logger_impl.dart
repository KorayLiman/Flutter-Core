import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

/// Enumerations of color codes for ease of use
enum LogColors { black, red, green, yellow, blue, magenta, cyan, white }

/// A UTILITY FOR PRINTING COLORFUL LOGS FOR DEBUG AND PROFILE MODE
class FLLogger {
  FLLogger({this.logName = 'FLCore'});
  final String logName;

  /// Prints colorful log with given message only form Debug and Profile mode
  void log(Object? msg, {LogColors color = LogColors.green}) {
    if (kDebugMode || kProfileMode) {
      switch (color) {
        case LogColors.black:
          developer.log('\x1B[30m$msg\x1B[0m', name: logName);
        case LogColors.red:
          developer.log('\x1B[31m$msg\x1B[0m', name: logName);
        case LogColors.green:
          developer.log('\x1B[32m$msg\x1B[0m', name: logName);
        case LogColors.yellow:
          developer.log('\x1B[33m$msg\x1B[0m', name: logName);
        case LogColors.blue:
          developer.log('\x1B[34m$msg\x1B[0m', name: logName);
        case LogColors.magenta:
          developer.log('\x1B[35m$msg\x1B[0m', name: logName);
        case LogColors.cyan:
          developer.log('\x1B[36m$msg\x1B[0m', name: logName);
        case LogColors.white:
          developer.log('\x1B[37m$msg\x1B[0m', name: logName);
      }
    }
  }
}
