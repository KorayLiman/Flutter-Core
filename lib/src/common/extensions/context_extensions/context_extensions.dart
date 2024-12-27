import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:meta/meta.dart';

/// [BuildContext] EXTENSION
extension ContextExtension on BuildContext {
  /// Equivalent to MediaQuery.sizeOf(this)
  Size get mediaQuerySize => MediaQuery.sizeOf(this);

  /// Equivalent to MediaQuery.sizeOf(this).height
  double get height => mediaQuerySize.height;

  /// Equivalent to MediaQuery.sizeOf(this).width
  double get width => mediaQuerySize.width;

  /// Equivalent to Theme.of(this)
  ThemeData get theme => Theme.of(this);

  /// Equivalent to Theme.of(this).brightness
  Brightness get brightness => Theme.of(this).brightness;

  /// Equivalent to Theme.of(this).textTheme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Equivalent to Theme.of(this).colorScheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Equivalent to MediaQuery.paddingOf(this)
  EdgeInsets get mediaQueryPadding => MediaQuery.paddingOf(this);

  /// Equivalent to MediaQuery.of(this)
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Equivalent to MediaQuery.viewPaddingOf(this)
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);

  /// Equivalent to MediaQuery.viewInsetsOf(this)
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  /// Equivalent to MediaQuery.orientationOf(this)
  Orientation get orientation => MediaQuery.orientationOf(this);

  /// Equivalent to MediaQuery.devicePixelRatioOf(this)
  double get devicePixelRatio => MediaQuery.devicePixelRatioOf(this);

  /// Equivalent to MediaQuery.textScalerOf(this)
  TextScaler get textScaler => MediaQuery.textScalerOf(this);

  /// Equivalent to Directionality.of(this)
  TextDirection get directionality => Directionality.of(this);

  /// Equivalent to DefaultTextStyle.of(this)
  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);

  /// Equivalent to MediaQuery.boldTextOf(this)
  bool get usingBoldText => MediaQuery.boldTextOf(this);

  /// Equivalent to MediaQuery.sizeOf(this).shortestSide
  double get mediaQueryShortestSide => mediaQuerySize.shortestSide;

  /// Equivalent to View.of(this)
  FlutterView get flutterView => View.of(this);

  /// Equivalent to Localizations.localeOf(this)
  Locale get locale => Localizations.localeOf(this);

  /// Equivalent to Localizations.maybeLocaleOf(this)
  Locale? get maybeLocale => Localizations.maybeLocaleOf(this);

  /// Checks if keyboard is open
  bool get isKeyboardOpen => FocusManager.instance.primaryFocus?.hasFocus ?? false || flutterView.viewInsets.bottom > 0.0;
}
