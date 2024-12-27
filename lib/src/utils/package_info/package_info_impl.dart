import 'package:package_info_plus/package_info_plus.dart';

abstract interface class IFLPackageInfo {
  Future<String> getAppName();

  Future<String> getPackageName();

  Future<String> getVersion();

  Future<String> getBuildNumber();
}

class FLPackageInfo implements IFLPackageInfo {
  final _packageInfo = PackageInfo.fromPlatform();

  @override
  Future<String> getAppName() async {
    final info = await _packageInfo;
    return info.appName;
  }

  @override
  Future<String> getPackageName() async {
    final info = await _packageInfo;
    return info.packageName;
  }

  @override
  Future<String> getVersion() async {
    final info = await _packageInfo;
    return info.version;
  }

  @override
  Future<String> getBuildNumber() async {
    final info = await _packageInfo;
    return info.buildNumber;
  }
}
