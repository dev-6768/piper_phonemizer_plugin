import 'package:flutter_test/flutter_test.dart';
import 'package:piper_phonemizer_plugin/piper_phonemizer_plugin.dart';
import 'package:piper_phonemizer_plugin/piper_phonemizer_plugin_platform_interface.dart';
import 'package:piper_phonemizer_plugin/piper_phonemizer_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPiperPhonemizerPluginPlatform
    with MockPlatformInterfaceMixin
    implements PiperPhonemizerPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PiperPhonemizerPluginPlatform initialPlatform = PiperPhonemizerPluginPlatform.instance;

  test('$MethodChannelPiperPhonemizerPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPiperPhonemizerPlugin>());
  });

  test('getPlatformVersion', () async {
    PiperPhonemizerPlugin piperPhonemizerPlugin = PiperPhonemizerPlugin();
    MockPiperPhonemizerPluginPlatform fakePlatform = MockPiperPhonemizerPluginPlatform();
    PiperPhonemizerPluginPlatform.instance = fakePlatform;

    expect(await piperPhonemizerPlugin.getPlatformVersion(), '42');
  });
}
