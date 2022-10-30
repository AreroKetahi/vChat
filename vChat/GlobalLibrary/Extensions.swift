//
//  Extensions.swift
//  vChat
//
//  Created by 苏子轩 on 2022/7/1.
//

import Foundation
import SwiftUI
import UIKit
import CryptoKit
import CommonCrypto

// UIKit Effect Interface
struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

//UIKit keyboard throw
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

//UIKit get safe area extension
extension UIApplication {
    var keyWindow: UIWindow? {
        connectedScenes
            .compactMap {
                $0 as? UIWindowScene
            }
            .flatMap {
                $0.windows
            }
            .first {
                $0.isKeyWindow
            }
    }
}

private struct vcSafeAreaInsetsKey: EnvironmentKey {
    static var defaultValue: EdgeInsets {
        UIApplication.shared.keyWindow?.safeAreaInsets.swiftUiInsets ?? EdgeInsets()
    }
}

extension EnvironmentValues {
    var safeAreaInsets: EdgeInsets {
        self[vcSafeAreaInsetsKey.self]
    }
}

private extension UIEdgeInsets {
    var swiftUiInsets: EdgeInsets {
        EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
    }
}

//Data SHA256 package
extension Data {
    /// 扩展data支持将字符串进行sha256加密
    var sha256: String {
        if #available(iOS 13.0, *) {
            return hexString(SHA256.hash(data: self).makeIterator())
        } else {
            // Fallback on earlier versions
            var disest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
            self.withUnsafeBytes {
                bytes in
                _ = CC_SHA256(bytes.baseAddress,CC_LONG(self.count),&disest)
            }
            return hexString(disest.makeIterator())
        }
    }
}

//String SHA256 package
extension String {
    var sha256: String {
        let utf8 = cString(using: .utf8)
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        CC_SHA256(utf8, CC_LONG(utf8!.count - 1), &digest)
        return digest.reduce("") { $0 + String(format:"%02x", $1) }.uppercased()
    }
}

// String Base64 Encode
extension String {
    //Base64编码
    func encodBase64() -> String? {
        let strData = self.data(using: String.Encoding.utf8)
        let base64String = strData?.base64EncodedString(options: NSData.Base64EncodingOptions.init(rawValue: 0))
        return base64String
    }
    
    //Base64解码
    func decodeBase64() -> String? {
        let decodedData = NSData(base64Encoded: self, options: NSData.Base64DecodingOptions.init(rawValue: 0))
        let decodedString = NSString(data: decodedData! as Data, encoding: String.Encoding.utf8.rawValue) as String?
        return decodedString
    }
}
