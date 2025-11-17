import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:piper_phonemizer_plugin/piper_phonemizer_plugin_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelPiperPhonemizerPlugin platform = MethodChannelPiperPhonemizerPlugin();
  const MethodChannel channel = MethodChannel('piper_phonemizer_plugin');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
