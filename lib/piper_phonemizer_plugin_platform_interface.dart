import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'piper_phonemizer_plugin_method_channel.dart';

abstract class PiperPhonemizerPluginPlatform extends PlatformInterface {
  /// Constructs a PiperPhonemizerPluginPlatform.
  PiperPhonemizerPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static PiperPhonemizerPluginPlatform _instance = MethodChannelPiperPhonemizerPlugin();

  /// The default instance of [PiperPhonemizerPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelPiperPhonemizerPlugin].
  static PiperPhonemizerPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PiperPhonemizerPluginPlatform] when
  /// they register themselves.
  static set instance(PiperPhonemizerPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
