import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_image_edit_watermark/flutter_image_edit_watermark.dart';
import 'package:flutter_image_edit_watermark/flutter_image_edit_watermark_platform_interface.dart';
import 'package:flutter_image_edit_watermark/flutter_image_edit_watermark_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterImageEditWatermarkPlatform
    with MockPlatformInterfaceMixin
    implements FlutterImageEditWatermarkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterImageEditWatermarkPlatform initialPlatform = FlutterImageEditWatermarkPlatform.instance;

  test('$MethodChannelFlutterImageEditWatermark is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterImageEditWatermark>());
  });

  test('getPlatformVersion', () async {
    FlutterImageEditWatermark flutterImageEditWatermarkPlugin = FlutterImageEditWatermark();
    MockFlutterImageEditWatermarkPlatform fakePlatform = MockFlutterImageEditWatermarkPlatform();
    FlutterImageEditWatermarkPlatform.instance = fakePlatform;

    expect(await flutterImageEditWatermarkPlugin.getPlatformVersion(), '42');
  });
}
