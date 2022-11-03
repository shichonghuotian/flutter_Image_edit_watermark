import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_image_edit_watermark/flutter_image_edit_watermark_method_channel.dart';

void main() {
  MethodChannelFlutterImageEditWatermark platform = MethodChannelFlutterImageEditWatermark();
  const MethodChannel channel = MethodChannel('flutter_image_edit_watermark');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
