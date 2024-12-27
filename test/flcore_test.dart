import 'package:flutter_test/flutter_test.dart';
import 'package:flcore/flcore.dart';
import 'package:flcore/flcore_platform_interface.dart';
import 'package:flcore/flcore_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlcorePlatform
    with MockPlatformInterfaceMixin
    implements FlcorePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlcorePlatform initialPlatform = FlcorePlatform.instance;

  test('$MethodChannelFlcore is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlcore>());
  });

  test('getPlatformVersion', () async {
    Flcore flcorePlugin = Flcore();
    MockFlcorePlatform fakePlatform = MockFlcorePlatform();
    FlcorePlatform.instance = fakePlatform;

    expect(await flcorePlugin.getPlatformVersion(), '42');
  });
}
