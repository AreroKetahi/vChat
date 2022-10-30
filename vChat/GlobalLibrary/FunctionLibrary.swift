//
//  FunctionLibrary.swift
//  vChat
//
//  Created by 苏子轩 on 2022/7/29.
//

import Foundation
import UIKit
import LocalAuthentication
import SwiftUI
import CryptoSwift


/// A function that can get application language's identifer
/// - Returns: Language identifer
func getLocalLanguageCode() -> String? {
    let uiLocalLanguageCode = Locale.current.identifier
    let avaliableLanguagesIdentifer = ["en", "zh-Hans", "de","zh-Hant", "ru", "fr", "ja", "es", "ko", "ar"]
    
    var languageIdentifer: String?
    for i in 0...(avaliableLanguagesIdentifer.count - 1) {
        if uiLocalLanguageCode.contains(avaliableLanguagesIdentifer[i]) {
            languageIdentifer = avaliableLanguagesIdentifer[i]
        }
    }
    
    return languageIdentifer
}

func isRightToLeftEnable() -> Bool {
    let filpLanguages = ["ar"]
    
    if filpLanguages.contains(getLocalLanguageCode() ?? "") {
        return true
    } else {
        return false
    }
}

// Biometrics identification
func isBiometricsEnable() -> Bool {
    let context = LAContext()
    var error: NSError?
    
    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
        return true
    } else {
        print(error.debugDescription)
        return false
    }
}

func doBiometricsIdentify(_ reason: String) -> Bool {
    let context = LAContext()
    
    var value = false
    context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
        // 鉴权完成
        DispatchQueue.main.async {
            if success {
                value = true
            } else {
                // 鉴权失败
            }
        }
    }
    return value
}

func hexString(_ iterator:Array<UInt8>.Iterator) -> String{
    return iterator.map{
        String(format: "%02x", $0)
    }.joined().uppercased() //字符串转成大写
}

func emptyAction() {
    
}

func isEmailString(_ email: String) -> Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    let emailTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    return emailTest.evaluate(with: email)
}
