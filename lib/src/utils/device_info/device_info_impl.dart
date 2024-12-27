import 'package:device_info_plus/device_info_plus.dart';

abstract interface class IFLDeviceInfo {
  Future<AndroidDeviceInfo> getAndroidInfo();
  Future<IosDeviceInfo> getIosInfo();
}

class FLDeviceInfo implements IFLDeviceInfo {
  @override
  Future<AndroidDeviceInfo> getAndroidInfo() => DeviceInfoPlugin().androidInfo;

  @override
  Future<IosDeviceInfo> getIosInfo() => DeviceInfoPlugin().iosInfo;
}
