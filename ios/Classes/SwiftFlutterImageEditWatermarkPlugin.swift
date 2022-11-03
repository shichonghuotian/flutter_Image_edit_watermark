import Flutter
import UIKit

public class SwiftFlutterImageEditWatermarkPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_image_edit_watermark", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterImageEditWatermarkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
