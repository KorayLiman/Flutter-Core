import 'dart:io';

import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:intl/date_symbol_data_local.dart';

abstract interface class IFLCore {
  Future<void> initialize();
  void closeKeyboard();
  Future<void> updateApp({String? androidPackageName, String? iOSAppId});
  Future<void> vibrate({ImpactType type = ImpactType.mediumImpact});
}

/// Core implementation of the package
final class FLCore implements IFLCore {
  /// Initializes localizations for date formatting
  @override
  Future<void> initialize() async {
    try {
      await initializeDateFormatting();
    } catch (e) {
      FLLogger.log(e, color: LogColors.red);
      rethrow;
    }
  }

  /// Closes the keyboard
  @override
  void closeKeyboard() {
    final primaryFocus = FocusManager.instance.primaryFocus;
    if (primaryFocus?.hasFocus ?? false) {
      primaryFocus!.unfocus();
    } else {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    }
  }

  @override
  Future<void> updateApp({
    String? androidPackageName,
    String? iOSAppId,
  }) async {
    final urlLauncher = FLUrlLauncher();
    if (Platform.isAndroid) {
      try {
        final updateInfo = await InAppUpdate.checkForUpdate();
        if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
          await InAppUpdate.performImmediateUpdate();
        } else {
          await urlLauncher.launchStore(androidPackageName: androidPackageName);
        }
      } catch (e) {
        // If an exception occurs launch Play Store
        await urlLauncher.launchStore(
          androidPackageName: androidPackageName,
        );
      }
    } else {
      // Launch App Store
      await urlLauncher.launchStore(iosAppId: iOSAppId);
    }
  }

  @override
  Future<void> vibrate({ImpactType type = ImpactType.mediumImpact}) {
    return switch (type) {
      ImpactType.vibrate => HapticFeedback.vibrate(),
      ImpactType.lightImpact => HapticFeedback.lightImpact(),
      ImpactType.mediumImpact => HapticFeedback.mediumImpact(),
      ImpactType.heavyImpact => HapticFeedback.heavyImpact(),
      ImpactType.selectionClick => HapticFeedback.selectionClick(),
    };
  }
}
