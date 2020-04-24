import Flutter
import UIKit

public class SwiftFlutterValidateUnicodePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_validate_unicode", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterValidateUnicodePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
      case "isCharacterSupported":
        self.isCharacterSupported(call, result: result)
      default:
        result(FlutterMethodNotImplemented)
    }
  }

  private func isCharacterSupported(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if let args = call.arguments as? Dictionary<String, Any>,
      let string = args["character"] as? String {
      for char in string {
        if !char.unicodeAvailable() {
          result(false)
        }
      }
      result(true)
    } else {
      result(FlutterError.init(code: "bad args", message: nil, details: nil))
    }
  }
}

// Taken from https://stackoverflow.com/questions/41318999/is-there-a-way-to-know-if-an-emoji-is-supported-in-ios

extension Character {

    /// Pick a size, any size really, for a reasonable png bitmap comparison
    private static let refUnicodeSize: CGFloat = 8

    /// U+1FFF is merely one of the many unicode characters not yet implemented (or defined).
    /// It thus prints a ῿ question mark, as do all the unavailable characters.
    /// All unavailable unicode characters share the same question mark [?] bitmap
    private static let refUnicodePng = Character("\u{1fff}").png(ofSize: Character.refUnicodeSize) // ῿
    /// Tests against the existence of a given unicode glyph on the present OS
    ///
    /// - Returns: true if this unicode (including emoji) will return an meaningful representation (i.e, not a ῿)
    func unicodeAvailable() -> Bool {
        if let refUnicodePng = Character.refUnicodePng,
            let myPng = self.png(ofSize: Character.refUnicodeSize) {
            return refUnicodePng != myPng
        }
        return false
    }

    /// Creates a png from a Character
    ///
    /// - Parameter char: a Character
    /// - Returns: a Portable Network Graphic (png), as Data optional
    func png(ofSize fontSize: CGFloat) -> Data? {
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)]
        let charStr = "\(self)" as NSString
        let size = charStr.size(withAttributes: attributes)

        UIGraphicsBeginImageContext(size)
        charStr.draw(at: CGPoint(x: 0,y :0), withAttributes: attributes)

        var png:Data? = nil
        if let charImage = UIGraphicsGetImageFromCurrentImageContext() {
            //png = UIImagePNGRepresentation(charImage)
            png = charImage.pngData()
        }

        UIGraphicsEndImageContext()
        return png
    }
}