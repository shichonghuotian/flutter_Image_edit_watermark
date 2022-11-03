import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_image_edit_watermark_method_channel.dart';

abstract class FlutterImageEditWatermarkPlatform extends PlatformInterface {
  /// Constructs a FlutterImageEditWatermarkPlatform.
  FlutterImageEditWatermarkPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterImageEditWatermarkPlatform _instance = MethodChannelFlutterImageEditWatermark();

  /// The default instance of [FlutterImageEditWatermarkPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterImageEditWatermark].
  static FlutterImageEditWatermarkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterImageEditWatermarkPlatform] when
  /// they register themselves.
  static set instance(FlutterImageEditWatermarkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> editImage(String filePath, String text,) {
    throw UnimplementedError('editImage() has not been implemented.');

  }
}
