
import 'flutter_image_edit_watermark_platform_interface.dart';

class FlutterImageEditWatermark {
  Future<String?> getPlatformVersion() {
    return FlutterImageEditWatermarkPlatform.instance.getPlatformVersion();
  }


  @override
  Future<String?> editImage(String filePath, String text) async{

    return FlutterImageEditWatermarkPlatform.instance.editImage(filePath, text);
  }

}
