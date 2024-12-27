import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flcore_method_channel.dart';

abstract class FlcorePlatform extends PlatformInterface {
  /// Constructs a FlcorePlatform.
  FlcorePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlcorePlatform _instance = MethodChannelFlcore();

  /// The default instance of [FlcorePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlcore].
  static FlcorePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlcorePlatform] when
  /// they register themselves.
  static set instance(FlcorePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
