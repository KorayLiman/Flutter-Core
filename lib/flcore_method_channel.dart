import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flcore_platform_interface.dart';

/// An implementation of [FlcorePlatform] that uses method channels.
class MethodChannelFlcore extends FlcorePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flcore');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
