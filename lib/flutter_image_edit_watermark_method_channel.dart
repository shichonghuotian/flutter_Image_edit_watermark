import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_image_edit_watermark_platform_interface.dart';

/// An implementation of [FlutterImageEditWatermarkPlatform] that uses method channels.
class MethodChannelFlutterImageEditWatermark extends FlutterImageEditWatermarkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_image_edit_watermark');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> editImage(String filePath, String text) async{

    final params = {"filePath": '$filePath', "text": text};

    final savePath = await methodChannel.invokeMethod<String>('editImage', params);

    return savePath;
  }
}
