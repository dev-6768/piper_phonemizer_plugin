import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'piper_phonemizer_plugin_platform_interface.dart';

/// An implementation of [PiperPhonemizerPluginPlatform] that uses method channels.
class MethodChannelPiperPhonemizerPlugin extends PiperPhonemizerPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('piper_phonemizer_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
