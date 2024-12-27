
import 'flcore_platform_interface.dart';

class Flcore {
  Future<String?> getPlatformVersion() {
    return FlcorePlatform.instance.getPlatformVersion();
  }
}
