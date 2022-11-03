import Flutter
import UIKit

public class SwiftFlutterImageEditWatermarkPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_image_edit_watermark", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterImageEditWatermarkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      
      if call.method == "editImage" {
               
          if let args = call.arguments as? Dictionary<String, Any> {
              
              let filePath = args["filePath"] as? String ?? ""
              
              let text = args["text"]  as? String ?? ""
              let size = args["size"]  as? Int ?? 14

              let savePath = editImage(filePath: filePath, text: text, size: size)
              
              result(savePath)
              
          }
         
//          editImage(path: call.arguments as? String, result: result)

      }else {
               result("iOS " + UIDevice.current.systemVersion)
     //          result(FlutterMethodNotImplemented)

    }
  }
   

    func editImage(filePath: String , text: String , size: Int ) -> String{
        
        let image = UIImage(contentsOfFile: filePath);
        let resultImage = image?.waterMarkedImage(waterMarkText: text);
        try? resultImage?.jpegData(compressionQuality: 1)?.write(to: URL(fileURLWithPath: filePath))
        
        return filePath
    }
    


    
}

extension UIImage{
     
    //水印位置枚举
    enum WaterMarkCorner{
        case TopLeft
        case TopRight
        case BottomLeft
        case BottomRight
    }
     
    //添加水印方法
    func waterMarkedImage(waterMarkText:String, corner:WaterMarkCorner = .BottomLeft,
        margin:CGPoint = CGPoint(x: 20, y: 20), waterMarkTextColor:UIColor = UIColor.white,
                          waterMarkTextFont:UIFont = UIFont.systemFont(ofSize: 20),
        backgroundColor:UIColor = UIColor.clear) -> UIImage? {
         
        let textAttributes = [NSAttributedString.Key.foregroundColor:waterMarkTextColor,
                              NSAttributedString.Key.font:waterMarkTextFont]
        let textSize = NSString(string: waterMarkText).size(withAttributes: textAttributes)
        var textFrame = CGRect(x: 0, y: 0, width: textSize.width, height: textSize.height)
         
        let imageSize = self.size
        switch corner{
        case .TopLeft:
            textFrame.origin = margin
        case .TopRight:
            textFrame.origin = CGPoint(x: imageSize.width - textSize.width - margin.x, y: margin.y)
        case .BottomLeft:
            textFrame.origin = CGPoint(x: margin.x, y: imageSize.height - textSize.height - margin.y)
        case .BottomRight:
            textFrame.origin = CGPoint(x: imageSize.width - textSize.width - margin.x,
                y: imageSize.height - textSize.height - margin.y)
        }
         
        // 开始给图片添加文字水印
        UIGraphicsBeginImageContext(imageSize)
        self.draw(in: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        NSString(string: waterMarkText).draw(in: textFrame, withAttributes: textAttributes)
         
        let waterMarkedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
         
        return waterMarkedImage
    }
}


